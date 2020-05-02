@isTest
global class AnimalLocatorMock  implements HttpCalloutMock {    
    // Implement this interface method
    global HTTPResponse respond(HTTPRequest request) {
        // Create a fake response
        HttpResponse response = new HttpResponse();
        response.setHeader('Content-Type', 'application/json');
        response.setBody('{"animal":{"id":0,"name":"Tiger","eats":"Meat","says":"Hello"}}');
        response.setStatusCode(200);
        return response; 
    }    
}