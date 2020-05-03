public class importantCollectionsClass {
    public static void testMethod23(){
        Map < Id, List < Contact >> mapAccIdByCntlst = new Map < Id, List < Contact >> ();
        system.debug('what is in the mapAccIdByCntlst'+mapAccIdByCntlst);
        for(Contact c: [Select Id, name, AccountId from Contact where AccountId != null]){ 
            system.debug('what is in the c'+c);
            // AccountId mapping with Contact List
            if (mapAccIdByCntlst.containsKey(c.AccountId)) {
                system.debug('what is in the c.AccountId'+mapAccIdByCntlst.containsKey(c.AccountId));
                system.debug('what is in============'+ mapAccIdByCntlst.get(c.AccountId));
                mapAccIdByCntlst.get(c.AccountId).add(c); //tricky part .Here map.get(key) is returning list and we are adding contacts to the list
                system.debug('what is in this============'+ mapAccIdByCntlst.get(c.AccountId));
            } else {
                List < Contact > lstcnts = new List < Contact > (); //Initialize list as no key is found before and first time we get key 
                lstcnts.add(c);
                mapAccIdByCntlst.put(c.AccountId, lstcnts);
            }
            
        }
    }
    
}