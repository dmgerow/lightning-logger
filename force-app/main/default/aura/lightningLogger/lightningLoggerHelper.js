({
    doIsLightningDebugModeEnabled: function (component) {
        var action = component.get("c.isLightningDebugModeEnabled");
        action.setCallback(this, function (response) {
            var state = response.getState();
            if (state === "SUCCESS") {
                component.set("v.isLightningDebugModeEnabled", response.getReturnValue());
            }
        });
        $A.enqueueAction(action);
    }
})
