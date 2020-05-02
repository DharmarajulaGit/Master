public class Acccreate {

    /* @param Candidate__c candidate  candidate record to be inserted
   * 
   */
    @AuraEnabled
    public static void createRecord (Account account){
        
        try{
            System.debug('CreateCandidateRecord::createRecord::candidate'+account);
            
            if(account != null){
                insert account;
            }
            
        } catch (Exception ex){
            system.debug('error occured'+ex.getMessage());
            
        }
        
    }    
}