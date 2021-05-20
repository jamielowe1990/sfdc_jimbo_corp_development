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
trigger AccountDeletion on Account (before delete) {
   
   // Prevent the deletion of accounts if they have related opportunities.
   for (Account a : [SELECT Id FROM Account
					WHERE Id IN (SELECT AccountId FROM Opportunity) AND
					Id IN :Trigger.old]) {
	   Trigger.oldMap.get(a.Id).addError(
		   'Cannot delete account with related opportunities.');
   }
   
}