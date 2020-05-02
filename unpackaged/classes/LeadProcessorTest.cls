@isTest
public class LeadProcessorTest {
    @TestSetup
    static void TestSetup(){
        list<Lead> leads = new list<Lead>();
        for(Integer i=0;i<200;i++){
            Lead l =new Lead(LastName='Last',Company='New Account');
            leads.add(l);
        }
        insert leads;
    }
    
    static TestMethod void myTestMethod(){
        Test.startTest();
        Database.executeBatch(new LeadProcessor()); 
        Test.stopTest();
        
        for(Lead l: [SELECT Id,LeadSource FROM Lead]){
            system.assertEquals('Dreamforce', l.LeadSource);
        }
        
    }
    
}