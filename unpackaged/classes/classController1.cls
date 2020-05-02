public class classController1 {
    @AuraEnabled public string DeveloperName{get;set;}
    @AuraEnabled public string DeveloperAge{get;set;}
    @AuraEnabled public List<account> lstofAccount{get;set;}
    @AuraEnabled
    public static classController1 initClass(){
        classController1 obj= new classController1();
        system.debug('------------'+obj);
        obj.DeveloperName='sandeep';
         system.debug('**************'+obj);
        obj.DeveloperAge='28';
         system.debug('&&&&&&&&&&&&&&&&&'+obj);
        obj.lstofAccount= [select id,name from account LIMIT 10];
        system.debug('..............'+obj);
        return obj;
    }
}