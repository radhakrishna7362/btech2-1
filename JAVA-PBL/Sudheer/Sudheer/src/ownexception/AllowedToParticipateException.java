package ownexception;

public class AllowedToParticipateException extends Exception {
	
	private static final long serialVersionUID = 1L;
	public AllowedToParticipateException() {
		this.message();
	}
	
	public void message(){
		System.out.println("You are eligible for the contest");
	}
}
