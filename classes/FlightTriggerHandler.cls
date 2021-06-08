public class FlightTriggerHandler {
	public static Boolean wasExecuted = false;
	
	public static void checkingAgeOfTourists(List<Flight__c> newFlights) {
		
		Set<String> idTourists = new Set<String>();
		Set<String> idTrips = new Set<String>();

		for (Flight__c newFlight : newFlights) {
			idTourists.add(newFlight.Tourist_Name__c);
			idTrips.add(newFlight.Trip__c);
		}

		Map<Id, Tourist__c> searchTourists = new Map<Id, Tourist__c>(TouristManager.getTouristByAges(idTourists));
		Map<Id, Trip__c> searchTrips = new Map<Id, Trip__c>(TripManager.getTripByAges(idTrips));

		for (Flight__c flightnew : newFlights) {
			Tourist__c tourist = searchTourists.get(flightnew.Tourist_Name__c);
			Trip__c trip = searchTrips.get(flightnew.Trip__c);

			if (tourist.Age__c < trip.Minimum_Age__c) {
				flightnew.addError('You are not the right age!');
			}
			if (flightnew.Status__c == 'Past') {
                		flightnew.addError('The flight has already departed!');
            		}
		}
	}
}
