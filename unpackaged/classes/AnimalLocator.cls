public class AnimalLocator {

    public static String getAnimalNameById(Integer animalId){
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        string animalName;
        string endpoint= 'https://th-apex-http-callout.herokuapp.com/animals/'+animalId;
        request.setEndpoint(endpoint);
        request.setMethod('GET');
        HttpResponse response = http.send(request);
        if (response.getStatusCode() == 200) {
            Map<String, Object> results = (Map<String, Object>) JSON.deserializeUntyped(response.getBody());
            Map<String,Object> animals = (Map<String,Object>)results.get('animal');
            animalName = (String)animals.get('name');
            
        }
        return animalName;
    }
}