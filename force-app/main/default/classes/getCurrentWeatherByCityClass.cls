public class getCurrentWeatherByCityClass {
    @AuraEnabled
    public static Decimal getCurrentWeather(string cityName){
        Decimal currentTemp = 0.0;
        Http h = New Http();
        
        string endpoint = 'https://api.weatherapi.com/v1/current.json?key='+ System.Label.WeatherAPIKey +'&q=' + cityName;
        
        HttpRequest req = New HttpRequest();
        req.setEndpoint(endpoint);
        req.setMethod('GET');
        req.setHeader('Content-Type','application/JSON');
        
        HttpResponse res = h.send(req);
        
        system.debug(res.getStatusCode());
        if(res.getStatusCode() == 200){
            //Deserializes the specified JSON string into collections of primitive data types
            Map<string,Object> returnedJSONBody = (Map<string,Object>)Json.deserializeUntyped(res.getBody());
            system.debug(returnedJSONBody);
            
            Map<string,Object> currentMap = (Map<string,Object>)returnedJSONBody.get('current');
            system.debug(currentMap);
            
            currentTemp = (Decimal)currentMap.get('temp_c');
            system.debug(currentTemp);
        }
        
        return currentTemp;
    } 
    
    @AuraEnabled
    public static string getCurrentAccountDetails(string accId){
        Account acc= [Select Id, BillingCity from Account where Id=:accId];
        return acc.BillingCity;
    }
}