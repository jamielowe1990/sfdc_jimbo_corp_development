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
trigger AccountAddressTrigger on Account (before insert, before update) {
	for(Account a : Trigger.New) {
		if(a.ShippingPostalCode != a.BillingPostalCode && a.Match_Billing_Address__c) {
			a.ShippingPostalCode = a.BillingPostalCode;
		}
	}
}