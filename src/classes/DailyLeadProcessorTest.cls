@isTest
public class DailyLeadProcessorTest {
    public static String CRON_EXP = '0 0 0 15 3 ? 2022';

    static TestMethod void myUnitTest1(){
        list<Lead> leads = new List<Lead>();
        for(Integer i =0 ; i<100;i++){
            Lead l = new Lead(LastName='Account',company='TEst Account');
            leads.add(l);
        }
        insert leads;
        Test.startTest();
        DailyLeadProcessor dlp = new DailyLeadProcessor();
        system.schedule('DailyLeadProcessor', CRON_EXP, dlp);
        Test.stopTest();
        
      
    }
}