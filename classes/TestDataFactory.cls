@isTest
public class TestDataFactory {
    public static Set<Integer> createTouristAges() {
       Set<Integer> ages = new Set<Integer>();
       ages.add(20);
       ages.add(18);
       ages.add(22);
        
       return ages;
    }
    
    public static List<Tourist__c> createTouritsWithoutFlightRegistration() {
        
        List<Tourist__c> tourists = [
            							SELECT Name,
            							Age__c
            							FROM Tourist__c
            							WHERE ID NOT IN (
                											SELECT Tourist_Name__c
                											FROM Flight__c)
        ];
        
        return tourists;
    }
    
    public static Set<String> createTouristEmails() {
        
        Set<String> emails = new Set<String>();
        emails.add('irina.staneyko28@gmail.com');
        emails.add('12342@.gmail.com');
        
        return emails;
    }
    
      public static Set<String> createTouristNames() {
        
        Set<String> names = new Set<String>();
        names.add('Bob');
        names.add('Liza');
        
        return names;
    }
    
    public static Set<String> createTouristIds() {
        
        Set<String> touristsId = new Set<String>();
        touristsId.add('a0P2w000005rUCeEAM');
        touristsId.add('a0P2w000005rrmUEAQ');
        touristsId.add('a0P2w000004oiJFEAY');
        touristsId.add('a0P2w000005pawjEAA');
        
        return touristsId;
    }
    
    public static Set<Id> createTouristIds2() {
        
        Set<Id> touristsId = new Set<Id>();
        touristsId.add('a0P2w000005rUCeEAM');
        touristsId.add('a0P2w000005rrmUEAQ');
        touristsId.add('a0P2w000004oiJFEAY');
        touristsId.add('a0P2w000005pawjEAA');
        
        return touristsId;
    }

}