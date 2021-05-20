/**
 * @description       : 
 * @author            : Jamie Lowe - jamielowe1990/jlowesfdc
 * @group             : 
 * @last modified on  : 20-05-2021
 * @last modified by  : Jamie Lowe - jamielowe1990/jlowesfdc
 * Modifications Log 
 * Ver   Date         Author                                 Modification
 * 1.0   20-05-2021   Jamie Lowe - jamielowe1990/jlowesfdc   Initial Version
**/
trigger AddRelatedRecord on Account(after insert, after update) {
    List<Opportunity> oppList = new List<Opportunity>();
    
    // Add an opportunity for each account if it doesn't already have one.
    // Iterate over accounts that are in this trigger but that don't have opportunities.
    for (Account a : [SELECT Id,Name FROM Account
                     WHERE Id IN :Trigger.New AND
                     Id NOT IN (SELECT AccountId FROM Opportunity)]) {
        // Add a default opportunity for this account
        oppList.add(new Opportunity(Name=a.Name + ' Opportunity',
                                   StageName='Prospecting',
                                   CloseDate=System.today().addMonths(1),
                                   AccountId=a.Id)); 
    }
    
    if (oppList.size() > 0) {
        insert oppList;
    }
}