({ 
    doInit : function(component, event, helper) {
        var action = component.get("c.getCurrentAccountDetails");
        action.setParams({
            accId: component.get("v.recordId")
        });
        
        action.setCallback(this, function(response) {
            var state = response.getState();

            console.log("status::"+state);
            if (state === "SUCCESS"){
                console.log("BillingCity::", response.getReturnValue());
                if(response.getReturnValue() !== null){
                    component.set("v.cityName", response.getReturnValue());
                    component.set("v.isCityAvailable", "True");
                }
            }
        });
        $A.enqueueAction(action); 
    },
    
    
    getCurrentTemp : function(component, event, helper) {
        var action = component.get("c.getCurrentWeather");
        action.setParams({
            cityName : component.get("v.cityName")
        });
        
        action.setCallback(this, function(response) {
            var state = response.getState();

            if (state === "SUCCESS"){
                console.log("Current Temp::", response.getReturnValue());
                if(response.getReturnValue() !== null){
                    component.set("v.currentTemp", response.getReturnValue());
                }
            }
        });
        $A.enqueueAction(action); 
    }
})