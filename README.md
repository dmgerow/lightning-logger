# Lightning Logger

A framework for enabling logging within Lightning Components.

## Overview

Adding the lightingLogger component and related apex classes, extending that component to any additional components will allow a developer to toggle their console.log messages with a checkbox per user. This allows a clickable way to remove any unnecessary console.log messages for users not being used for testing/debugging purposes.

## How to Use

### In the Component (.cmp) file

```[html]
<aura:component extends="c:lightningLogger">
    <aura:handler name="change" value="{!v.isLoaded}" action="{!c.doInit}"/>

</aura:component>
```

### In the Controller

```[javascript]
({
    doInit : function(component, event, helper) {
        helper.log(component, 'basic log message!');
        helper.log(component, 'logger should console an object?', component);
        helper.helperMethod(component);
    }
})
```

### In the Helper

```[javascript]
({
    helperMethod : function(component) {
        this.log(component, 'logging in the helper too!');
    }
})
```
