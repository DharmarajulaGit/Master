@isTest
public class ParkLocatorTest {
	@isTest 
    public static void testCallout() {  
    	Test.setMock(WebServiceMock.class, new ParkServiceMock());
        list<string> parkList = ParkLocator.country('India');
        list<String> parkListExpected = new list<string>{'Location 1','Location 2','Location 3','Location 4'};
        
        system.assertEquals(parkListExpected, parkList);
        
    }
}