global  class EventMessage{
	
	//sample message
	/*{"token":"123", 
	"accountId":"005U0000000Et32IAC", 
	"message":"Sample Message", 
	"instance":"Dev", 
	"item":"HelloWorldClass", 
	"level":"info", 
	"userId":"000000000", 
	"userName":"bob jones"}*/
	
	//public string token;
    //public string accountId;
	public List<Event> events;
	
	public string token;
    public string accountId;
	public string message;
    public string instance;
	public string item;
    public string level;
	public string userId;
    public string userName;

	global class Event {
		public string message;
        public string instance;
		public string item;
        public string level;
		public string userId;
        public string userName;
		
	}
}