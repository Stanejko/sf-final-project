trigger TouristTrigger on Tourist__c (after insert, after update) {

    if (!TouristService.wasExecuted) {
        TouristService.wasExecuted = true;
        
        switch on Trigger.operationType {
            when AFTER_INSERT {
               TouristService.markDuplicates(Trigger.New);
            }
            when AFTER_UPDATE {
               TouristService.flightStatusChange(Trigger.New);
            }       
        }
    }
}