package staticDemo;

public class SwapDemo {
	public static void main(String args[]) {
		int[] a=new int[3];
		a[0]=22;
		a[1]=80;
		a[2]=10;
		for(int i=0;i<3;i++) {
			System.out.print(a[i]+" ");
		}
		System.out.println();
		int temp=a[0];
		a[0]=a[a.length-1];
		a[a.length-1]=temp;
		for(int i=0;i<3;i++) {
			System.out.print(a[i]+" ");
		}
	}
}
