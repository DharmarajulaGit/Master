public class ParkLocator {
    public static list<string> country(string country){
        list<string> parkNames = new list<string>();
        ParkService.ParksImplPort  pr = new ParkService.ParksImplPort();
        parkNames = pr.byCountry(country);
        return parkNames;
    }
}