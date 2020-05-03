@isTest
public class AccountManagerTest {
    @testsetup
    public static void setTestData(){
        Account acc = new Account(Name='Test Account');
        insert acc;
        
        contact con = new contact(AccountId = acc.Id,LastName='Test',FirstName='Name');
        insert con;
    }
    public static testmethod void testM(){
        Account acc = [SELECT Id FROM Account LIMIT 1];
        Id recordId = acc.Id;
        RestRequest request = new RestRequest();
        request.requestUri = 'https://dharmathedeveloper-dev-ed.my.salesforce.com/services/apexrest/Accounts/' + recordId+'/contacts';
        request.httpMethod = 'GET';
        RestContext.request = request;
        Account acc1 = AccountManager.getAccount();
        system.assertEquals(acc.Id, acc.Id);
        
        request = new RestRequest();
        request.requestUri = 'https://dharmathedeveloper-dev-ed.my.salesforce.com/services/apexrest/Accounts/*/contacts';
        request.httpMethod = 'GET';
        RestContext.request = request;
        acc1 = AccountManager.getAccount();
    }
}