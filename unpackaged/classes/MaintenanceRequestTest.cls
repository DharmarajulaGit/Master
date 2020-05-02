@isTest
public class MaintenanceRequestTest {
	@testsetup
    public static void setupTestData(){
        list<Case> csList = new List<Case>();
        for(Integer i = 0; i<301; i++){
            Case c= new Case(Status = 'In-Progress', Type='Repair');
            csList.add(c);
        }        
        insert csList;
    }
    
	// postitve Test case with bulk data    
    public static testmethod void testMRBulkInsert(){
        list<Case> cases = new list<Case>();
        for(Integer i= 0 ;i< 301 ; i++){
            Case c= new Case(Status = 'Closed', Type='Repair');
        	cases.add(c);
        }
        insert cases;
        list<Case> caseList = [SELECT Id FROM Case WHERE Status='New'];
		system.assertEquals(cases.size(), caseList.size());        
    }
    
     public static testmethod void testMRBulkPositive(){
        list<Case> cases = new list<Case>();
        for(Integer i= 0 ;i< 1; i++){
            Case c= new Case(Status = 'Closed', Type='Repair');
        	cases.add(c);
        }
        insert cases;
        list<Case> caseList = [SELECT Id FROM Case WHERE Status='New'];
		system.assertEquals(cases.size(), caseList.size());        
    }
    
    public static testmethod void testMRInsertNegative(){
        Case c= new Case(Status = 'Closed', Type='Checkup');
        insert c;
        list<Case> caseList = [SELECT Id FROM Case WHERE Status='New'];
		system.assertEquals(0, caseList.size());        
    }
    
    public static testmethod void testMRBulkUpdate(){
        list<Case> cases = new list<Case>();
        for(Case c:[SELECT Id FROM Case]){
            c.Status = 'Closed';
        	cases.add(c);
        }
        update cases;
        list<Case> caseList = [SELECT Id FROM Case WHERE Status='New'];
		system.assertEquals(cases.size(), caseList.size());        
    }
    
    public static testmethod void testMRUpdatePostive(){
        list<Case> cases = new list<Case>();
        for(Case c:[SELECT Id FROM Case LIMIT 1]){
            c.Status = 'Closed';
        	cases.add(c);
        }
        update cases;
        list<Case> caseList = [SELECT Id FROM Case WHERE Status='New'];
		system.assertEquals(cases.size(), caseList.size());        
    }
    
    public static testmethod void testMRUpdateNegative(){
        list<Case> cases = new list<Case>();
        for(Case c:[SELECT Id FROM Case]){
            c.Status = 'Closed';
            c.Type = 'Checkup';
        	cases.add(c);
        }
        update cases;
        list<Case> caseList = [SELECT Id FROM Case WHERE Status='New'];
		system.assertEquals(0, caseList.size());        
    }
    
}