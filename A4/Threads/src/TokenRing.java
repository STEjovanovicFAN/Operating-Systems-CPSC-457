import java.util.concurrent.*;

public class TokenRing extends Thread {
	
	private static int id = 1;
	private static int amtID;
	private int count = 0; 
	private static Token t;
	
	public static boolean end = false;
	
	//make the token object 
	public TokenRing(int x){
		t = new Token("I AM A FUCKING GOD AMONG YOU PLEBS");
		amtID = x;
		
	}
	
	//returns the unique identifier for the token received from the predecessor
	private static synchronized void RecieveToken(Token x){
		//get the token back
		t = x;
				
	}
	
	//this method manages who gets the token next
	private static synchronized Token SendToken(int currID){
		if(id == currID){
			if(t == null){
				return(t);
			}
			else{
				
				//Token x = t;
				//t = null;
				return(t);
			}
		}
		else{
			return(t);
		}
	}
	
	public void run(){
		
		while(end == false){
			try{
				Thread.sleep(50);
			}
			catch(InterruptedException e){
				System.out.println(e);
			}
			
			int id1 = id +1;
			if(id1 > amtID){
				id = 1;
			}
			else{
				id++;
			}

		}	
		
		
	}
	
	public static Token getToken(int currID){
		
		Token x = SendToken(currID);
		
		return(x);
		
	}
	
	public static void retToken(Token x){
		RecieveToken(x);
	}
	
	public static void end(){
		end = true;
	}
	
}