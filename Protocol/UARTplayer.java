import com.fazecast.jSerialComm.SerialPort;

public class Uart_Rx {
    public static void main(String[] args) {
        //SerialPort comPort = SerialPort.getCommPorts()[3]; // Get the 3 available serial port
       SerialPort comPort = SerialPort.getCommPort("COM4"); // port navnet
        comPort.setComPortParameters(115200, 8, 1, 0); // Sæt parameters: baud rate, data bits, stop bits, parity
        comPort.setComPortTimeouts(SerialPort.TIMEOUT_READ_BLOCKING, 1000, 0); 
        
        if(comPort.openPort()){
            System.out.println("Port opened successfully.");
            byte[] buffer = new byte[1024]; //holder 3 bytes
            while (true) {
            
                int bytesRead = comPort.readBytes(buffer, 17); // Read 1 byte from the port
                if (bytesRead > 0) {
                    System.out.println("bytesRead: " + bytesRead);
                    byte receivedByte = buffer[0]; // Get the received byte
                    if (receivedByte == (byte) 0x3F) { // Checker for start byte
                        System.out.println("Start byte detected!");
                       if(buffer[1]== (byte) 0x88){
                        char a      = (char) buffer[2]; // læser data byte som integer
                        char b      = (char) buffer[3];
                        char c      = (char) buffer[4];
                        int saldo    = (int) buffer[6] & 0xFF ;
                    
                        
                        System.out.println("Player Name: " + a+b+c);
                        System.out.println("Player Balance: " + saldo);
                        for(var i = 7; i < 16; i++)
                        System.out.println("Historik spin " + buffer[i]);
                        }
                    } else {
                        System.out.println("Invalid byte: " + receivedByte);
                    }
                }
            }
        } else {
            System.out.println("Failed to open port.");
        }
        }
    }
