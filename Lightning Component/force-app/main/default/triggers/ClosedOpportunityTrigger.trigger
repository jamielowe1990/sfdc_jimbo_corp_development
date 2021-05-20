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
trigger ClosedOpportunityTrigger on Opportunity (after insert, after update) {
	List<Task> taskList = new List<Task>();
	for (Opportunity opp : Trigger.New) {
		if(opp.StageName == 'Closed Won') {
			// Add a default Task for each Closed Opportunity
			taskList.add(
				new Task(
			 		Subject = 'Follow Up Test Task',
                    WhatId = opp.Id)
				); 
		}	
	}

	if (taskList.size() > 0) {
        insert taskList;
    }
}