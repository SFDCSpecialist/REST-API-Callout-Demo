@isTest
private class getCurrentWeatherTest {
     @isTest 
    static void testCallout() {
        // Set mock callout class 
        Test.setMock(HttpCalloutMock.class, new MockHttpResponseGenerator());
        
        // Call the actual method to test.
        // This causes a fake response to be sent from the class that implements HttpCalloutMock. 
        getCurrentWeatherByCityClass.getCurrentWeather('Delhi');
    }
    
    @isTest 
    static void testAnotherMethod() {
        Account acc = New Account(Name='TestAccount',BillingCity='Delhi');
        insert acc;
        getCurrentWeatherByCityClass.getCurrentAccountDetails(acc.id);

    }
}