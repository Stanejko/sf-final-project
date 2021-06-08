public class TouristService {
	public static Boolean wasExecuted = false;
	
	public static void markDuplicates(List<Tourist__c> newTourists) {
        Set<Id> newTouristsIds = new Set<Id>();
        
        for ( Tourist__c touristNew : newTourists) {
            newTouristsIds.add(touristNew.Id);
        } 
		
        TouristService.markDuplicatesAsync(newTouristsIds);       
   }
	
 	public static void flightStatusChange(List<Tourist__c> tourists) {
        Set<String> inactiveTourists = new Set<String>();
        
        for (Tourist__c tourist : tourists) { 
            if (tourist.Active__c == false) {
                inactiveTourists.add(tourist.id);
            }
        }
        
        List<Flight__c> flights = new List<Flight__c>(FlightManager.getFlightsByInactiveTourists(inactiveTourists));
        
        for (Flight__c flight : flights) {
            flight.Status_of_flight__c = 'Declined';
        }
        
        update flights;
    }	
    
    @future
    public static void markDuplicatesAsync(Set<Id> newTouristsIds) {
        Set<String> newTouristNames = new Set<String>();
        Set<String> newTouristEmails = new Set<String>();
        
        List<Tourist__c> newTourists = new List<Tourist__c>(TouristManager.getById(newTouristsIds));
        
        for ( Tourist__c touristNew : newTourists) {
            newTouristNames.add(touristNew.Name);
            newTouristEmails.add(touristNew.Email__c);
        } 
		
        List<Tourist__c> oldTourists = new List<Tourist__c>(TouristManager.getTouristByEmail(newTouristNames, newTouristEmails));
        
        for (Tourist__c recordedTourist : oldTourists) {
            for (Tourist__c enteredTourist : newTourists) {
                if (recordedTourist.Id != enteredTourist.Id && recordedTourist.Name == enteredTourist.Name && recordedTourist.Email__c == enteredTourist.Email__c) {
                    enteredTourist.IsDuplicate__c = true;
                }
            }
        }
        
        update newTourists;
   }
}
