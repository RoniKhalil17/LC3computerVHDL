import com.fazecast.jSerialComm.*;
public class uartProtocol {
    public static void main(String[] args) {
        SerialPort comPort = SerialPort.getCommPorts()[3]; // Get the 3 available serial port
        //SerialPort comPort = SerialPort.getCommPort("com4"); // port navnet
        comPort.setComPortParameters(19200, 8, 2, 0); // Sæt parameters: baud rate, data bits, stop bits, parity
        comPort.setComPortTimeouts(SerialPort.TIMEOUT_READ_BLOCKING, 1000, 0); // Set read timeout

        if(comPort.openPort()){
            byte[] buffer = new byte[6]; // holder 6 bytes
                int bytesRead = comPort.readBytes(buffer, 25); // Read 1 byte from the port
           
                if (bytesRead > 0) {
                    byte receivedByte = buffer[0]; // Get the received byte
                    if (receivedByte == (byte) 0xFF) { //start byte
                        int length = (int) buffer[1]; // længden af pakken.
                        byte datatype = buffer[2];
                        if (datatype == 0x11){ // integer type
                           int dataInt = (int) buffer[3];  
                        } else if (datatype == 0x88){ // char
                            String dataString;
                            
                            } 
                        }


                    } 
                }

                
            } 

        
}

