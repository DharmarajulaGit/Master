public class ControllerClass {
   public List<Talent__c> myList{get;set;}
   public Talent__c mainobjType{get;set;}
   public ControllerClass(){
        myList= new List<Talent__c>();
        mainobjType=new Talent__c();
        myList=[select Name__c,Developer__c,None__c,Email__c from Talent__c where Email__c Like '%gmail.com%'];
    }
    Public void save(){
        List<Talent__c> myList= new List<Talent__c>();
        mainobjType=new Talent__c();
        myList=[select Name__c,Developer__c,None__c,	Email__c from Talent__c  where Email__c Like '%gmail.com%'];
       update myList;
    }
   
        
        
        
    }