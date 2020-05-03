@isTest
public class TestVerifyDate {
    @isTest
    public static void TestMethod1(){
        Date d1 = Date.today().addDays(-30);
        Date d2 = Date.today();
        VerifyDate.CheckDates(d1,d2);
        
        d1 = Date.today().addDays(-5);
        VerifyDate.CheckDates(d1,d2);
        
    }
}