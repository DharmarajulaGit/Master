global class ParkServiceMock implements WebServiceMock {
    global void doInvoke(Object stub, Object request, Map<String, Object> response, String endpoint, String soapAction, String requestName, String responseNS, String responseName, String responseType) {         
        // start - specify the response you want to send
        ParkService.byCountryResponse  response_x = new ParkService.byCountryResponse();
        list<String> parkList = new list<string>{'Location 1','Location 2','Location 3','Location 4'};
            response_x.return_x = parkList;
            // end
            response.put('response_x', response_x); 
      }

}