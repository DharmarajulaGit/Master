trigger ClosedOpportunityTrigger on Opportunity (after insert, after update) {
    list<Task> tsklist = new list<Task>();
    for(Opportunity opp: Trigger.new){
        if(opp.StageName == 'Closed Won'){
            Task tsk = new Task(WhatId = opp.Id,subject='Follow Up Test Task');
            tsklist.add(tsk);
        }
    }
    
    insert tsklist;
}