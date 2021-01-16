package staticDemo;

interface Demo2{
	public void test();
}

interface Demo3{
	public void test1();
}

class Demo4 implements Demo2,Demo3{
	public void test() {
		System.out.println("Interface & Multiple Interface Demo");
	}
	public void test1() {
		System.out.println("Interface & Multiple Interface Demo");
	}
}

public class InterfaceDemo{
	public static void main(String args[]) {
		Demo4 o=new Demo4();
		o.test();
		o.test1();
	}
}
