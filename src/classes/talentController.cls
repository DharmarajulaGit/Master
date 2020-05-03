public class talentController {
    public List<Talent__c> Talentdetails{get;set;}
    public List<Talent__c> Showtalents{get;set;}
    public Talent__c Objtalent{get;set;}
    
    public PageReference Cancel(){
        PageReference Np=new PageReference('/apex/SampleCustomContactPage');
        Np.setRedirect(true);
        return Np;
    }
    Public talentController(){
        Talentdetails= new List<Talent__c>();
        Objtalent= new Talent__c();
        Showtalents= new List<Talent__c>();
        Showtalents= [Select Name__c,Phone__c,Email__c,vendor__c,Feedback__c from Talent__c where vendor__c like :'T%'];
        }
    Public void testingTalent(){
        Talentdetails= new List<Talent__c>();
        Talent__c ObjtalentNew=new Talent__c();
        ObjtalentNew.Name__c=Objtalent.Name__c;
        ObjtalentNew.Phone__c=Objtalent.Phone__c;
        ObjtalentNew.Email__c=Objtalent.Email__c;
        ObjtalentNew.vendor__c=Objtalent.vendor__c;
        ObjtalentNew.Feedback__c=Objtalent.Feedback__c;
        //Talentdetails= [Select Name__c,Phone__c,Email__c,vendor__c,Feedback__c from Talent__c where vendor__c='Tek'];
        Talentdetails.add(ObjtalentNew);
        try{
            upsert Talentdetails;
            Showtalents=[Select Name__c,Phone__c,Email__c,vendor__c,Feedback__c from Talent__c where vendor__c='Tek'];     
        }
        catch(exception ex){
            }
    }
        Public void saveonLoad()
        {
            
        
        }

}