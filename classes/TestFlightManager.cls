@isTest
private class TestFlightManager {
    @isTest static void testGetTouristsByStartYearFlight() {
        
        Integer testYear = 2020;
        Integer testYear2 = null;
        
        List<Flight__c> testList = FlightManager.getTouristsByStartYearFlight(testYear);
        List<Flight__c> testList2 = FlightManager.getTouristsByStartYearFlight(testYear2);
    }
    
    @isTest static void testGetTouristsWithListOfFlights() {
        
        System.equals(TestDataForFlightManager.createTouristsWithListOfFlights(), FlightManager.getTouristsWithListOfFlights());
    }
    
    @isTest static void testGetFlightsByInactiveTourists() {
        
      FlightManager.getFlightsByInactiveTourists(TestDataForFlightManager.createFlightsByInactiveTourists());
    }
    
    @isTest static void testGetTouristsWithStatus() {
        
        System.equals(TestDataForFlightManager.createTouristsWithStatus(), FlightManager.getTouristsWithStatus());
    }
}