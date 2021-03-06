
public class Driver {   
	
	private static int AmountProcessors = 100;
	
	public static void main(String args[]) {
		//begin the BroadcastSystem
		(new BroadcastSystem()).start();
		
		//begin TokenRing and input the amount of processes you will be running  
		(new TokenRing(AmountProcessors)).start();
		
		int i = 1;
		while(i <101){
		
		//these are all the threads that need to run
		(new Processor("A", i)).start(); //1
		//(new Processor("B", 2)).start(); //2
		//(new Processor("C", 3)).start(); //3
		//(new Processor("Y", 4)).start(); //4
		//(new Processor("D", 5)).start(); //5
		//(new Processor("E", 6)).start(); //6
		//(new Processor("F", 7)).start(); //7
		//(new Processor("G", 8)).start(); //8
		//(new Processor("H", 9)).start(); //9
		//(new Processor("Z", 10)).start(); //10
		i++;
		}
		System.out.println("||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||");
		System.out.println("||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||");
		System.out.println("||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||");
		System.out.println("||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||");
		System.out.println("||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||");
		System.out.println("||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||");
		//this is used to end the TokenRing thread and terminate program  
		TokenRing.end();
	}

}
