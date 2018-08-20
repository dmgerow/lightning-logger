({
    doIsLightningDebugModeEnabled: function (component) {
        var action = component.get("c.isLightningDebugModeEnabled");
        action.setCallback(this, function (response) {
            var state = response.getState();
            if (state === "SUCCESS") {
                component.set("v.isLightningDebugModeEnabled", response.getReturnValue());
            }

            component.set('v.isLoaded', true);
        });
        $A.enqueueAction(action);
    },

    // dont pass the object param if that type of console log isn't needed
    log: function(component, msg, object) {
        if (component.get('v.isLightningDebugModeEnabled')) {
            if (object === undefined) {
                console.log(msg);
            } else {
                console.log(msg, object);
            }
        }
    }
})
