package swx;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class PatMat 
{
	private static final Pattern PAT = Pattern.compile("(\\w+)\\((\\d+)\\)");
	
	/*
	** REMIND - escape ) by ^^ with Windows Console
	** 
	*/
    public static void main(String[] args)
	{
		String txt = String.join(" ", args);
 		
        Matcher mat = PAT.matcher(txt);
        
        while (mat.find())
		{
             System.out.format("%s.%s", mat.group(1), mat.group(2)).println();	           			
        }
    }
}
