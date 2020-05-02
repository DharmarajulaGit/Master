@isTest
public class AddPrimaryContactTest {

    @testSetup 
    static void setup() {
        List<Account> accounts = new List<Account>();
        for (Integer i = 0; i < 100; i++) {
            	Account a;
            if(i<50)
           		a = new Account(name='Parent',BillingState ='NY');
            else if(i>=50)
                a = new Account(name='Parent',BillingState ='CA');
            accounts.add(a);
        }
        insert accounts;
    }
    
    static testmethod void testQueueable() {
        Account a = new Account(Name='Test Account');
        insert a;
        Contact con = new Contact(LastName = 'Test Name',AccountId = a.Id);
        insert con;
        
       
        // Create our Queueable instance
        AddPrimaryContact updater = new AddPrimaryContact(con, 'CA');
        // startTest/stopTest block to force async processes to run
        Test.startTest();        
        System.enqueueJob(updater);
        Test.stopTest();        
        // Validate the job ran. Check if record have correct parentId now
        System.assertEquals(50, [select count() from Contact where Account.BillingState = 'CA']);
    }
    
}