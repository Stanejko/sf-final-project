global class FlightScheduleJob implements Schedulable  {
   
    public static String CRON_EXP = '0 0 0 1/1 * ? *';  //'0 0/30 * 1/1 * ? *' - every 30 minutes
    
    global static String scheduleFlight() {
    	FlightScheduleJob flightSchedule = new FlightScheduleJob();
        
    	return System.schedule('Batch job', CRON_EXP, flightSchedule);
    }
    
    global void execute(SchedulableContext ctx) {
        FlightDeleteBatch flightDelete = new FlightDeleteBatch();
        Database.executeBatch(flightDelete, 15);
    }

}
