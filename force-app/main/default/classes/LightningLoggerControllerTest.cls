@isTest
private class LightningLoggerControllerTest {

    @TestSetup
    static void makeData(){
        String orgId = userInfo.getOrganizationId();
        String dateString = String.valueof(Datetime.now()).replace(' ','').replace(':','').replace('-','');
        Integer randomInt = Integer.valueOf(math.rint(math.random()*1000000));
        String uniqueString = orgId + dateString + randomInt;
        Profile profileToUse = [SELECT Id FROM Profile LIMIT 1];

        User testUser = new User(firstname = 'Testy',
                            lastName = 'McTestTest',
                            email = uniqueString + '@test.com',
                            Username = uniqueString + '@test.com',
                            EmailEncodingKey = 'ISO-8859-1',
                            Alias = uniqueString.substring(18, 23),
                            ProfileId = profileToUse.Id,
                            TimeZoneSidKey = 'America/Los_Angeles',
                            LocaleSidKey = 'en_US',
                            LanguageLocaleKey = 'en_US');

        testUser.UserPreferencesUserDebugModePref = true;
        insert testUser;
    }

    @isTest static void testUserDebug() {
        User testUser = [SELECT Id, UserPreferencesUserDebugModePref FROM User WHERE LastName = 'McTestTest'];
        Boolean isLightningDebugModeEnabled = false;

        System.runAs(testUser) {
            Test.startTest();
            isLightningDebugModeEnabled = LightningLoggerController.isLightningDebugModeEnabled();
            Test.stopTest();
        }

        System.assertEquals(true, isLightningDebugModeEnabled);
    }
}
