public class testContactController {
     public TestContact__c ac{ get; set; }
     	public List<TestContact__c> samepage { get; set; }
    public testContactController(){
       //samepage= [select id,Name__c,PhoneNumber__c,Type__c,CreatingDate__c from TestContact__c order by createddate desc];
      
    }
    
    public PageReference save() {
       insert ac;  
      samepage= [select id,Name__c,PhoneNumber__c,Type__c,CreatingDate__c from TestContact__c order by createddate desc];
      
        return null;
    }
    Public PageReference back(){
        PageReference pr= new PageReference('/apex/talentpage');
        pr.setRedirect(true);
        return pr;
        
        
        
    }
}