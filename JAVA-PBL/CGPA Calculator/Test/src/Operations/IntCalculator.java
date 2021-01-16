package Operations;

public class IntCalculator {

	public static long factorial(int n)
	{
		long result = 1;
		for(int i = n;i>0;i--)
			result*=i;
		return result;
	}
	public static int sumSquares(int n)
	{
		int sum = 0;
		for(int i=1;i<=n;i++)
			sum = sum + i*i;
		return sum;
	}
//	public static int sumOfN(int n)
//	{
//		int sum = 0;
//		for(int i=1;i<=n;i++)
//			sum = sum + i;
//		return sum;
//	}
//	public static int computeString(String exp)
//	{
//		int result = 0;
//		String[] res = exp.split("+");
//		for(int i = 0;i<res.length;i++)
//		{
//			result = result + Integer.parseInt(res[i]);
//		}
//		return result;
//	}
}