public class ContactsController {
     @AuraEnabled  
     public static List<Contact> getContacts() {
    return [SELECT Id, name, Phone,Languages__c FROM contact  ORDER BY createdDate ASC LIMIT 10];
  }
    

}