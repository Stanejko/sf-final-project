@isTest
public class TestDataForFlightManager {
	
    public static List<Flight__c> createTouristsWithListOfFlights() {
        
        return [
				SELECT Tourist_Name__r.Name, 
			           Tourist_Name__r.Age__c,
			           Trip__r.Name,
			           Trip__r.Start_Date__c
		        FROM Flight__c
		];
    }
    
    public static Set<String> createFlightsByInactiveTourists() {
        
        List<Tourist__c> tourists = [
            				          SELECT id,
            							     Name,
                                             Active__c
            						  FROM Tourist__c
        ];
         
        Set<String> inactiveTourist = new Set<String>();
        
        for (Tourist__c tourist : tourists) { 
            if (tourist.Active__c == false) {
                inactiveTourist.add(tourist.id);
            }
        }
        
        return inactiveTourist;
    }
    
    public static List<Flight__c> createTouristsWithStatus() {
        
        return [
				SELECT Tourist_Name__r.Name, 
			           id
		        FROM Flight__c
                WHERE Status_Of_flight__c = 'Declined'
		];
    }
}