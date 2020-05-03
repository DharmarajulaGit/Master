@isTest
public class WarehouseCalloutServiceTest {
    @testsetup
    public static void setupTestData(){
        list<Product2> p2List = new list<Product2>();
        for(Integer i=0; i<300; i++){
            Product2 pt = new Product2(Name='UPS 2000 VA'+i,Replacement_Part__c= true,Current_Inventory__c=i,Maintenance_Cycle__c=i,
                                       Lifespan_Months__c=i,Cost__c=i,Warehouse_SKU__c='100'+i);
            p2List.add(pt);
        }
        insert p2List;
    }
    @isTest
    static void WarehouseEquipmentSync(){
        Test.startTest();
        // Set mock callout class 
        Test.setMock(HttpCalloutMock.class, new WarehouseCalloutServiceMock()); 
        // This causes a fake response to be sent from the class that implements HttpCalloutMock. 
        WarehouseCalloutService.runWarehouseEquipmentSync();
        Test.stopTest();        
        System.assertEquals(302, [SELECT count() FROM Product2]);        
        
    }
    
    // Positive Test Case
    public static testmethod void warehouseCalloutServicePositiveTest(){
        Test.startTest();
        Test.setMock(HttpCalloutMock.class, new WarehouseCalloutServiceMock());
        String CRON_EXP =  '0 0 0 3 9 ? 2022';
        String jobId = System.schedule('WarehouseSyncSchedule2', CRON_EXP, new WarehouseSyncSchedule());   
        Test.stopTest();
        CronTrigger  ct = [SELECT Id, CronExpression, TimesTriggered,NextFireTime FROM CronTrigger WHERE id = :jobId];  
        // Verify the expressions are the same
        System.assertEquals(CRON_EXP,ct.CronExpression);
        // Verify the job has not run
        System.assertEquals(0, ct.TimesTriggered);
    }
    /*
// Negative Test Case
public static testmethod void warehouseCalloutServiceNegativeTest(){
Test.startTest();
Test.setMock(HttpCalloutMock.class, new WarehouseCalloutServiceMock());
Datetime dt = Datetime.now().addMinutes(1);
String CRON_EXP = '0 '+ dt.minute() + ' * ' + dt.day() + ' ' + dt.month() + ' ? ' + dt.year();
System.schedule('WarehouseSyncSchedule2', CRON_EXP, new WarehouseSyncSchedule());   
Test.stopTest();
list<Product2> prList = [SELECT Id FROM Product2 WHERE Warehouse_SKU__c='100001' OR Warehouse_SKU__c= '100002'];
system.assertEquals(0, prList.size());
}*/
}