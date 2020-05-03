public class MyMapController {
    @AuraEnabled
    public static Map<string,string> getMyMap(){
        Map<string,string> Mymap = new Map<string,string>();
   			Mymap.put('Key1','apple');
        	Mymap.put('Key2','Mango');
        system.debug('...............'+Mymap);
        return Mymap;
    }
}
//In this apex class we have a @AuraEnabled getMyMap() method which return type is Map type.
//In this method first we created a new map called Mymap and put value on it . (‘key’ , ‘value’) and return the map.