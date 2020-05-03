public class StringArrayTest {
    public static List<String> generateStringArray(Integer n) {
        List<String> List1 = new List<String>();
        for(Integer i =0; i < n; ++i){
           system.debug('current i value'+i);
            List1.add('Test ' + i);
        }
        system.debug('what is in the list'+List1);
        return List1;
        
    }
}