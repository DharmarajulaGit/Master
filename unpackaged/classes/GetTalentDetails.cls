public class GetTalentDetails{
    Talent__c t = new Talent__c();
        public Talent__c Talentdetails(){
            t = [select Id,Email__c,Name__c,Phone__c from Talent__c limit 1];
            System.debug('..............'+t);
            return t;
        }
}