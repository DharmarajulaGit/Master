public class AddPrimaryContact implements Queueable{
    public Contact con;
    public string State;
    public AddPrimaryContact(Contact  con,String State){
        this.con = con;
        this.State = State;
        
        
    }    
    public void execute(QueueableContext context){
        //Added the comment for git
        list<Contact> conList = new list<Contact>();
        for(Account a: [SELECT Id FROM Account WHERE billingstate =:State Limit 200]){
            Contact conct = this.con.clone(false,false,false,true);
            conct.AccountId = a.Id;
            conList.add(conct);
        }
        insert conList;
    }
}
