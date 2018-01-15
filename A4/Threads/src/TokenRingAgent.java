
public class TokenRingAgent {
	// returns the unique identifier for the token received from the predecessor
	public Token Recieve(int currID){
		
		//get the token and return value
		Token x = TokenRing.getToken(currID);
		
		return(x);
		
	}
	
	//sends the token to the successor
	public void SendToken(Token x){
		
		TokenRing.retToken(x);
		
	}
}
