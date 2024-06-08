import java.io.*;
import java.net.*;
public class TCPServer {
    public static void main(String[] args) throws Exception{ 
        String strSocket, strLocal; 

        ServerSocket ssocketWelcome = new ServerSocket(6789);   
        while(true) {  
            Socket socketServer = ssocketWelcome.accept(); 
            BufferedReader brInFromUser = 
              new BufferedReader(new InputStreamReader(System.in)); 
            BufferedReader brInFromClient = 
               new BufferedReader(new
               InputStreamReader(socketServer.getInputStream())); 
            DataOutputStream  dosOutToClient = 
               new DataOutputStream(socketServer.getOutputStream());
            do{
                strSocket = brInFromClient.readLine(); 
                System.out.println("Client: " + strSocket);

                strLocal = brInFromUser.readLine(); 

                dosOutToClient.writeBytes(strLocal + '\n'); 
            } while(!strSocket.equals("bye"));
            socketServer.close();
        }   
    }    
}
