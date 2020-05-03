public class AccWithContController {
    Public static List<Account> fetchAccount(){
         List < Account > lstOfAcc = [select Name, AnnualRevenue, BillingState, (select LastName from contacts) from Account LIMIT 10];
			return lstOfAcc;
        
    }

}