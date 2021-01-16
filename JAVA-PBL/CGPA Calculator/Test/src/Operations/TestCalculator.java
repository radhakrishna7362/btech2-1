package Operations;
import org.junit.Test;
import org.junit.Assert;

public class TestCalculator {

	@Test
	public void testFactorial1()
	{
		long expresult = 24;
		long actresult = IntCalculator.factorial(4);
		Assert.assertEquals(expresult, actresult);
	}
	@Test
	public void testSumSquares()
	{
		int expresult = 42925;
		int actresult = IntCalculator.sumSquares(50);
		Assert.assertEquals(expresult, actresult);
	}
//	@Test
//	public void testSumOfN()
//	{
//		int expresult = 28;
//		int actresult = IntCalculator.sumOfN(7);
//		Assert.assertEquals(expresult, actresult);
//	}
//	@Test
//	public void testComputeString()
//	{
//		int expresult = 10;
//		int actresult = IntCalculator.computeString("2+3+5");
//		Assert.assertEquals(expresult, actresult);
//	}
}