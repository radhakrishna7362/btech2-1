package collection;

import java.io.File;
import java.io.FileNotFoundException;
import java.util.ArrayList;
import java.util.Scanner;

import entity.Student;

public class Registrations {
	private static final String regFileName="regsitrations.txt";
	private static File inf=new File(regFileName);
	private static ArrayList<Student> regStudents= new ArrayList<Student>();
	
	public static void addRegistrations() throws FileNotFoundException{
		Scanner sf=new Scanner(inf);
		while(sf.hasNextLine()) {
			String[] line=sf.nextLine().split(' ');
		}
		sf.close();
	}
}
