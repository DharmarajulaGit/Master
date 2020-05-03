public with sharing class WarehouseCalloutService {
    
    private static final String WAREHOUSE_URL = 'https://th-superbadge-apex.herokuapp.com/equipment';
    
    // complete this method to make the callout (using @future) to the
    // REST endpoint and update equipment on hand.
    @future(callout = true)
    public static void runWarehouseEquipmentSync(){
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint(WAREHOUSE_URL);
        request.setMethod('GET');
        request.setHeader('Content-Type', 'application/json;charset=UTF-8');
        HttpResponse response = http.send(request);
        // Parse the JSON response
        if (response.getStatusCode() == 200) {
            list<Product2> prodList = new list<Product2>();
            //"_id":"55d66226726b611100aaf741","replacement":false,"quantity":5,"name":"Generator 1000 kW","maintenanceperiod":365,"lifespan":120,"cost":5000,"sku":"100003"
            //replacement part (always true), cost, current inventory, lifespan, maintenance cycle, and warehouse SKU
            list<Object> results = (list<Object>) JSON.deserializeUntyped(response.getBody());
            for(Object obj:results){
                Map<String,Object> res = (Map<String,Object>)obj;
                Product2 pt = new Product2();
                //pt.ProductCode = (string)res.get('_id');
                pt.Replacement_Part__c = (boolean)res.get('replacement');
                pt.Current_Inventory__c = (Integer)res.get('quantity');
                pt.Name = (string)res.get('name');
                pt.Maintenance_Cycle__c = (Integer)res.get('maintenanceperiod');
                pt.Lifespan_Months__c = (Integer)res.get('lifespan');
                pt.Cost__c = (Integer)res.get('cost');
                pt.Warehouse_SKU__c = (string)res.get('sku');
                prodList.add(pt);
            }
            
            if(!prodList.isEmpty()){
                upsert prodList Warehouse_SKU__c;
            }
            System.debug(response.getBody());
        }
    }   
}