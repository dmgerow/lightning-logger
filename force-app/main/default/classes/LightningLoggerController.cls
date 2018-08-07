public with sharing class LightningLoggerController {

    @AuraEnabled
    public static Boolean isLightningDebugModeEnabled() {
        return [SELECT UserPreferencesUserDebugModePref FROM User 
                WHERE Id =: UserInfo.getUserId() LIMIT 1].UserPreferencesUserDebugModePref;
    }

}
