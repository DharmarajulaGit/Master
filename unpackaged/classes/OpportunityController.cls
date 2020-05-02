public class OpportunityController {
     @AuraEnabled  
    Public static List<Opportunity> getOpportunity() {
        return [SELECT Id,TrackingNumber__c, CurrentGenerators__c,DeliveryInstallationStatus__c,MainCompetitors__c,OrderNumber__c From Opportunity  ORDER BY createdDate ASC LIMIT 15];
        
    }

}