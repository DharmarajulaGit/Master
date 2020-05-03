@isTest
public class AnimalLocatorTest {
    public testmethod static void testPostCallout() {
        // Set mock callout class 
        Test.setMock(HttpCalloutMock.class, new AnimalLocatorMock()); 
        // This causes a fake response to be sent
        // from the class that implements HttpCalloutMock. 
        string animalName = AnimalLocator.getAnimalNameById(0);       
        System.assertEquals(animalName, 'Tiger');
    }
}