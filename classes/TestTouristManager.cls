@isTest
private class TestTouristManager {
    @isTest static void TestGetTouristByName() {
      
      String name1 = '';
      String name2 = 'Джон';
   
      List<Tourist__c> testListTourists1 = TouristManager.getTouristsByName(name1);
      List<Tourist__c> testListTourists2 = TouristManager.getTouristsByName(name2);  
    }
    
    @isTest static void TestGetTouristsByAges() {
        
       Set<Integer> ages = new Set<Integer>();
        
       TouristManager.getTouristsByAges(TestDataFactory.createTouristAges());
       TouristManager.getTouristsByAges(ages); 
    }
    
    @isTest static void TestGetTouristsWithoutFlightRegistration() {
        
        System.assertEquals(TestDataFactory.createTouritsWithoutFlightRegistration(), TouristManager.getTouristsWithoutFlightRegistration());
    }
    
    @isTest static void TestGetTouristByEmail() {
        
        Set<String> emails = new Set<String>();
        Set<String> names = new Set<String>();
        
        TouristManager.getTouristByEmail(TestDataFactory.createTouristNames(), TestDataFactory.createTouristEmails());
        TouristManager.getTouristByEmail(names, emails);
        TouristManager.getTouristByEmail(TestDataFactory.createTouristNames(), emails);
        TouristManager.getTouristByEmail(names, TestDataFactory.createTouristEmails());
    }
    
      @isTest static void TestGetTouristByAges() {
        
        Set<String> touristsId = new Set<String>();
        
        TouristManager.getTouristByAges(TestDataFactory.createTouristIds());
        TouristManager.getTouristByAges(touristsId);
    }
    
    @isTest static void TestGetById() {
        
        Set<Id> touristsId = new Set<Id>();
        
        TouristManager.getById(TestDataFactory.createTouristIds2());
        TouristManager.getById(touristsId);
    }
}