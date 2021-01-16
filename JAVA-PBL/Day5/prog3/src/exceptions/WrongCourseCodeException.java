package exceptions;

public class WrongCourseCodeException extends Exception {
		private static final long serialVersionUID = 1L;
		private String code;
		public WrongCourseCodeException(String code) {
			this.code=code;
			this.message();
		}
		
		public void message(){
			System.out.println(this.code+" is a Wrong Course Code");
		}
}