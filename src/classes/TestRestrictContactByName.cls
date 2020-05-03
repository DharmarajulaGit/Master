@isTest
public class TestRestrictContactByName {
	@isTest
    public static void testMethod1(){
        contact c = new contact(LastName = 'INVALIDNAME');
        try{
             insert c;
        }
        catch(Exception e){
            
        }
       
    }
}