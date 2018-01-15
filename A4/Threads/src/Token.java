//represents a token message

//this class is the token object itself 
public class Token {
	
	private String token;
	
	public Token(String x){
		token = x;
		
	}
	
	//this will find out if the token is taken or still here 
	public String getToken(){
		
		return token;
	}
}
