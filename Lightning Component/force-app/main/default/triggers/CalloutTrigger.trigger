/**
 * @description       : 
 * @author            : ChangeMeIn@UserSettingsUnder.SFDoc
 * @group             : 
 * @last modified on  : 05-20-2021
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
 * Modifications Log 
 * Ver   Date         Author                               Modification
 * 1.0   05-20-2021   ChangeMeIn@UserSettingsUnder.SFDoc   Initial Version
**/
trigger CalloutTrigger on Account (before insert, before update) {
    CalloutClass.makeCallout();
}