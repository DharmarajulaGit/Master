global class LeadProcessor implements Database.Batchable<sObject>{
    global Database.QueryLocator start(Database.BatchableContext bc){
        string query = 'SELECT Id,LeadSource FROM Lead';
        return Database.getQueryLocator(query);
    }
    global void execute(Database.BatchableContext bc, List<Lead> scope){
        for(sObject so:scope){
            Lead l = (Lead)so;
            l.LeadSource = 'Dreamforce';
        }
        update scope;
    }
    global void finish(Database.BatchableContext bc){
        
    }
}