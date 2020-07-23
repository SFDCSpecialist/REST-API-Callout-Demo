@isTest
global class MockHttpResponseGenerator implements HttpCalloutMock {
    // Implement this interface method
    global HTTPResponse respond(HTTPRequest req) {
        // Optionally, only send a mock response for a specific endpoint
        // and method.
        System.assertEquals('https://api.weatherapi.com/v1/current.json?key='+System.Label.WeatherAPIKey+'&q=Delhi', req.getEndpoint());
        System.assertEquals('GET', req.getMethod());
        
        // Create a fake response
        HttpResponse res = new HttpResponse();
        res.setHeader('Content-Type', 'application/json');
        res.setBody(' {"location": {"name": "Delhi"},"current": { "temp_c": 26.0,"temp_f": 78.8}}');
        res.setStatusCode(200);
        return res;
    }
}