@isTest
global class WarehouseCalloutServiceMock implements HttpCalloutMock {

    // implement http mock callout
    global HTTPResponse respond(HTTPRequest req){
        System.assertEquals('https://th-superbadge-apex.herokuapp.com/equipment', req.getEndpoint());
        System.assertEquals('GET', req.getMethod());
        // Create a fake response
        HttpResponse res = new HttpResponse();
        res.setHeader('Content-Type', 'application/json');
        res.setBody('[{"_id":"55d66226726b611100aaf73f","replacement":false,"quantity":10,"name":"UPS 2000 VA","maintenanceperiod":180,"lifespan":60,"cost":1350,"sku":"100001"},{"_id":"55d66226726b611100aaf740","replacement":true,"quantity":194,"name":"Fuse 8A","maintenanceperiod":0,"lifespan":0,"cost":5,"sku":"100002"}]');
        res.setStatusCode(200);
        return res;
    }
}