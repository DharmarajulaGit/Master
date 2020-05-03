@isTest
public class AccountProcessorTest {
	@TestSetup
    static void setup(){
        Account a = new Account(Name='ABC corp');
        insert a;
        
        contact c=new Contact(LastName='Test',AccountId=a.ID);
        insert c;
    } 
    
    static TestMethod void myUnitTest(){
      	list<Id> recIds  = new list<Id>();
        for(Account a: [SELECT Id FROM Account]){
            recIds.add(a.Id);
        }
        Test.startTest();
        AccountProcessor.countContacts(recIds);
        Test.stopTest();
        Account a = [Select Id,Number_of_Contacts__c FROM Account LIMIT 1];
        system.assertEquals(1,a.Number_of_Contacts__c);
    }
}