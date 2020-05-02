public class insertRecord {
    public static Account insertRecordMethod(){
        Account acc= new Account();
        acc.Name='test1';
        acc.BillingCity='Elkridge';
        acc.BillingCountry='USA'; 
        insert acc;
        system.debug('accdetails'+acc);
        ID a= acc.Id;
        system.debug('accid'+a);
        return acc;
    } 

}