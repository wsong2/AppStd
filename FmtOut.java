package swx;

import java.time.LocalDateTime;

public class FmtOut 
{
    public static void main(String[] args)
	{
		long tm = System.currentTimeMillis();
		System.out.format("%1$tF %1$tR", new java.util.Date(tm)).println();	           			
		System.out.format("%1$tF %1$tT", LocalDateTime.of(2021,5,20,19,36,1)).println();	           			
    }
}
