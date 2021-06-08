public class FlightManager {

	public static List<Flight__c> getTouristsByStartYearFlight(Integer year) {
		if (year == null) {
		return new List<Flight__c>();
		}

		return [
			 SELECT Tourist_Name__r.Name, 
				Tourist_Name__r.Age__c
		 	 FROM Flight__c
		 	 WHERE CALENDAR_YEAR(Trip__r.Start_Date__c) = :year
		];
	}

	public static List<Flight__c> getTouristsWithListOfFlights() {
		return [
		 	SELECT Tourist_Name__r.Name, 
				Tourist_Name__r.Age__c,
				Trip__r.Name,
				Trip__r.Start_Date__c
		 	FROM Flight__c
		];
	}

	public static List<Flight__c> getFlightsByInactiveTourists(Set<String> inactiveTourists) {
		return [
	 		SELECT Status__c
			FROM Flight__c
	 		WHERE Tourist_Name__r.Id IN :inactiveTourists AND Status__c != 'Declined'
		];
	}

}
