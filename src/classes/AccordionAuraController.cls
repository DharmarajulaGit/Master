public class AccordionAuraController {
    @AuraEnabled
    public static List<contact> getContacts(){
        List<contact> contactList = new List<contact>();
        for(contact oCon : [Select Id, Name, Email, Phone, MailingStreet, MailingCity, MailingPostalCode, MailingCountry From Contact LIMIT 10]){
            system.debug('test.......'+oCon);
            contactList.add(oCon);
    }
        return contactList;
}
}