public class talentJobcontroller {
    public List<SelectOption> Developerdetails{get;set;}
    public List<SelectOption> Testerdetails{get;set;}
    public string selectedtype{get;set;}
       public string Test{get;set;}
    
    public void save(){
        Talent__c test1 = new Talent__c();
        List<Talent__c> lstTalent =  new List<Talent__c>();
        test1= [select 	None__c,selected_type__c from Talent__c where 	Name__c like '%t'];
        
        test1.None__c= selectedtype;
        test1.selected_type__c= Test;
        lstTalent.add(test1);
        update lstTalent;
        
        
        
    
        
        
        //PageReference Np=new PageReference('/apex/SampleCustomContactPage');
        //Np.setRedirect(true);
        
    }
        public talentJobcontroller() {
        Developerdetails= new List<SelectOption>();
        Testerdetails= new List<SelectOption>();
        SelectOption option = new SelectOption('--None--','--None--');
        Developerdetails.add(option);
        Testerdetails.add(option);
            option=new SelectOption('Developer1','Developer1');
           
            
            SelectOption option1=new SelectOption('Developer','Developer'); 
            Developerdetails.add(option);
            Developerdetails.add(option1);
            
            
            option=new SelectOption('Tester','Tester');
            Testerdetails.add(option);
        }
    public void createdevTestList(){
        Testerdetails.clear();
        //Developerdetails.add(new SelectOption('--None--','--None--'));
        Testerdetails.add(new SelectOption('--None--','--None--'));
        if(selectedtype=='Developer'){
            Testerdetails.add(new SelectOption('sandeep','sandeep'));
              Testerdetails.add(new SelectOption('Rajeesh','Rajeesh'));
            
        }
        else if(selectedtype=='Developer1'){ 
            Testerdetails.add(new SelectOption('Ravi','Ravi'));
            Testerdetails.add(new SelectOption('george','George'));
            
            
        }
        
        
        
        
    }       
            
    
}