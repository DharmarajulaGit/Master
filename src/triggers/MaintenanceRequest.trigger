trigger MaintenanceRequest on Case (After insert, After update) {
    // call MaintenanceRequestHelper.updateWorkOrders  
    if(Trigger.isAfter && Trigger.isInsert) {
        MaintenanceRequestHelper.handleAfterInsert(Trigger.new);
    } else if(Trigger.isAfter && Trigger.isUpdate) {
        MaintenanceRequestHelper.handleAfterUpdate(Trigger.new, Trigger.old,Trigger.oldMap);
    }
}