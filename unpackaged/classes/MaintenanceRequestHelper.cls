public class MaintenanceRequestHelper {
    
    /*public static void updateWorkOrders(){
        // update workorders
    } */       
    public static void handleAfterInsert(list<Case> newRecords){
        list<Case> newMRList = new list<Case>();
        for(Case cs:newRecords){
            if(cs.Status.equals('Closed') && string.isNotBlank(cs.Type) && (cs.Type.equals('Repair') || cs.Type.equals('Routine Maintenance'))){
                newMRList.add(cs);
            }
        }
        if(!newMRList.isEmpty()){
            createMaintenanceRequest(newMRList);
        }
    }
    public static void handleAfterUpdate(list<Case> newRecords,list<Case> oldRecords, Map<Id,Case> oldMapRecords){
         list<Case> newMRList = new list<Case>();
        for(Case cs:newRecords){
            if(cs.Status != oldMapRecords.get(cs.id).status){
                if(cs.Status.equals('Closed') && string.isNotBlank(cs.Type) && (cs.Type.equals('Repair') || cs.Type.equals('Routine Maintenance'))){
                    newMRList.add(cs);
                }
            }
        }
        if(!newMRList.isEmpty()){
            createMaintenanceRequest(newMRList);
        }
    }
    public static void createMaintenanceRequest(list<Case> cases){
        list<case> newMrs = new list<Case>();
        for(Case cs:cases){
            Case mr = cs.Clone(false,true,false,false);
            mr.Status = 'New';
            newMrs.add(mr);
        }
        insert newMrs;
    }
}