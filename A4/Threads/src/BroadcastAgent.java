//this class provides the implementation of the broadcast mechanism needed by DSM. Each agent executes in a separate thread.
public class BroadcastAgent {

    //send a store
	public void Broadcast(int x, int v ){
		//put out a change to the
		BroadcastSystem.array1[x] = v;
		
	}
	
	//receive a store
	public int[] receive(){
		
		return(BroadcastSystem.array1);
		
	}
	
}
