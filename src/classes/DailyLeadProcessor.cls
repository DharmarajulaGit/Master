global class DailyLeadProcessor implements Schedulable{
    global void execute(SchedulableContext ctx) {
        list<Lead> leads = new list<Lead>();
        for(Lead l : [SELECT Id,LeadSource FROM Lead WHERE (LeadSource= null OR LeadSource='') LIMIT 200]){
            l.LeadSource = 'Dreamforce';
            leads.add(l);
        }
        update leads;
    }
}