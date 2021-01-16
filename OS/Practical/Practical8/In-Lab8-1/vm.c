#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>
#include <unistd.h>
#define PSIZE 4096
int main(int argc, char *argv[])
{
	int addressFile,backingStore; 				
	char *file= argv[1];	
	char ch,ct, input[1000], output;
	int logicalAddress, physicalAddress;	
	int i=0, j=0;
	int p,d;											
	int f; 										
	char frames[PSIZE*16]; 					
	int frametable[16];						
	int start, current;							
	int offset, pagefault=0;	
	int freeFrame=-1;	
	int pagetable[16]; 							
	for (j=0;j<16;j++)						
	{
		pagetable[j] = -1;
	}	
        pagetable[0]=0x2;
        pagetable[1]=0x1;
        pagetable[2]=0x6;
        pagetable[3]=0x0;
        pagetable[4]=0x4;
        pagetable[5]=0x3;
        pagetable[9]=0x5;
        pagetable[11]=0x7;
	for (j=0;j<16;j++)						
	{
		frametable[j] = -1;
	}	
	frametable[0] = 1;
	frametable[1] = 1;
	frametable[2] = 1;
	frametable[3] = 1;
	frametable[4] = 1;
	frametable[5] = 1;
	frametable[9] = 1;
	frametable[11] = 1;
	addressFile = open("address.txt",O_RDONLY); 
	backingStore = open("BACKING_STORE.bin",O_RDONLY); 
	if(addressFile != -1)
	{
		while(read(addressFile, &ch, sizeof(char)) != 0)	
		{
			if(ch != '\n')
			{
				input[i] = ch;
				i++;
			}
			else
			{
				logicalAddress =atoi(input);
				p = (logicalAddress & 0x000000000000f000UL) >>  12;
				d = (logicalAddress & 0x0000000000000fffUL);

				printf("\nlogicalAddress: %d, p: %d, d: %d", logicalAddress,p,d);

				if(pagetable[p]!= -1){

					f = pagetable[p];
					physicalAddress = (f * PSIZE) + d;
					printf("\nphysicalAddress: %d, f: %d", physicalAddress,f);

				}
//				pagetable-miss, page-fault	
				else
				{
					pagefault++;
//					locate free frame (-1) in physical memory 
					for (j=0;j<8;j++)
					{
						if(frametable[j]==-1)
						{
							freeFrame = j;
							break;	
						}
					}	 					
					if(backingStore != -1)
					{						
						
						offset=0;
						start = PSIZE * p;
						current=lseek(backingStore, start, SEEK_SET);
						while((offset < PSIZE)&&(current))
						{
							current = read(backingStore, &ct, sizeof(char));
							frames[freeFrame*offset] = ct; 
							offset++;														
						}
					}
					else
					{
						printf("Backing-Store Does not exist!");
						close(backingStore);
						close(addressFile);	
						return 0;	
					}
//					update pagetable, frametable
					pagetable[p] = freeFrame;	
					frametable[freeFrame] = 0;

					physicalAddress = (freeFrame * PSIZE) + d;
					printf("\nphysicalAddress: %d, freeFrame: %d", physicalAddress, freeFrame);
				}

				output = frames[physicalAddress];
				printf("\nByte value stored at physicalAddress %d: %c\n",physicalAddress, output);
				
				memset(input,0,sizeof(input));
				i=0;

			}
		}
		printf("\nTotal Page Faults: %d",pagefault);		
	}
	else
		printf("Addresses File Does not exist!");

	close(backingStore);
	close(addressFile);	
	return 0;	
}



