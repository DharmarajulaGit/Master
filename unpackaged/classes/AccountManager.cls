@RestResource(urlMapping='/Accounts/*/contacts')
global class AccountManager {
	@HttpGet
    global static Account getAccount(){
        RestRequest request = RestContext.request;
        String accountId = request.requestURI.substringBetween('Accounts/', '/contacts');
        list<Account> accList = [SELECT Id,Name,(Select Id,Name FROM Contacts) FROM Account WHERE Id=:accountId];
        if(accList != null && accList.size()> 0){
            return accList[0];
        }else{
            return null;
        }
        
    }
}