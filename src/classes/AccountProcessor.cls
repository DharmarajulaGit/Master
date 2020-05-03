public class AccountProcessor {
    @future	
    public static void countContacts(list<Id> accountIds){
        list<Account> accList = new list<account>();
        for(Account a: [SELECT Id,(Select Id From Contacts) FROM Account WHERE Id In:accountIds]){
         	   a.Number_of_Contacts__c = a.Contacts != null? a.Contacts.size() : 0;
            accList.add(a);
        }        
        update accList;
    }
}