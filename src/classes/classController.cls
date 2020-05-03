public class classController {
    
    // create properties in apex class
 @AuraEnabled public String DeveloperName {get;set;}
 @AuraEnabled public integer DeveloperAge {get;set;}
 @auraEnabled public List<account> lstOfAccount{get;set;}
    public void methodname(){
    
        system.debug(DeveloperName);
     
        
    }
     public void methodname(String fName, String lname){
         
        
    }
}