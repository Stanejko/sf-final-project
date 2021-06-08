public class TouristManager{
	
	public static List<Tourist__c> getTouristsByName(String name) {
		if (String.isBlank(name)) {
			return new List<Tourist__c>();
		}
		
		String expression = '%' + name + '%';

		return [
			 SELECT Name,
			        Age__c
		         FROM Tourist__c
		         WHERE Name LIKE :expression
		];
	}

	public static List<Tourist__c> getTouristsByAges(Set<Integer> ages) {
		if (ages.isEmpty()) {
			return new List<Tourist__c>();
		}

		return [
			 SELECT Name,
				Age__c
		         FROM Tourist__c
		         WHERE Age__c IN :ages
		];
	}

	public static List<Tourist__c> getTouristsWithoutFlightRegistration() {
		return [
		         SELECT Name,
			        Age__c
		         FROM Tourist__c
		         WHERE ID NOT IN (
					   SELECT Tourist_Name__c
		                	   FROM Flight__c)
		];
	}
    
    public static List<Tourist__c> getTouristByEmail(Set<String> newNames, Set<String> newEmails) {
        return [
            	 SELECT Name,
            		Email__c
            	 FROM Tourist__c
            	 WHERE Name = :newNames AND Email__c = :newEmails
        ];
    }
    
    public static List<Tourist__c> getTouristByAges(Set<String> newTourists) {
        if (newTourists == null || newTourists.isEmpty()) {
            return new List<Tourist__c>();
        } 
        
        List<Tourist__c> touristByAge = [
        				  SELECT Age__c
           				  FROM Tourist__c
             				  WHERE Id IN :newTourists
        ];
        
        return touristByAge;
    }
    
    public static List<Tourist__c> getById(Set<Id> newTouristsId) {
        if (newTouristsId == null || newTouristsId.isEmpty()) {
            return new List<Tourist__c>();
        } 
        
        List<Tourist__c> tourists = [
            			      SELECT Name,
            				     Email__c
            			      FROM Tourist__c
                                      WHERE id IN : newTouristsId
        ];
        
        return tourists;
    }
}
