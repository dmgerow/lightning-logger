# Lightning Logger

A framework for enabling logging within Lightning Components.

## Overview

Adding the lightingLogger component and related apex classes, extending that component to any additional components will allow a developer to toggle their console.log messages with a checkbox per user. This allows a clickable way to remove any unnecessary console.log messages for users not being used for testing/debugging purposes.

## How to Use

### In the Component (.cmp) file

```[html]
<aura:component extends="c:lightningLogger">
    <!-- need to let the lightning logger component load first with debug status -->
    <aura:handler name="change" value="{!v.isLoaded}" action="{!c.doInit}"/>

</aura:component>
```

### In the Controller

```[javascript]
({
    doInit : function(component, event, helper) {
        // represents a console.log('msg') type log
        helper.log(component, 'basic log message!');

        // represents a console.log('msg', obj) type log
        helper.log(component, 'logger should console an object?', component);
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
