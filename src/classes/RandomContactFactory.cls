public class RandomContactFactory {
    public static List<Contact> generateRandomContacts(integer parameter1,string parameter2){
        list<contact> conList = new list<contact>();
        
        for(integer i = 0 ; i< parameter1 ; i++){
            contact c= new contact(firstName = parameter2+i);
            conList.add(c);
        }
        
        return conList;
    }
}