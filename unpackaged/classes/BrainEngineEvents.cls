/**
	* BrainEngineEvents - <description>
	* Created by BrainEngine Cloud Studio
	* @author: brianA matthews
	* @version: 1.0
*/

global with sharing class BrainEngineEvents{
	
	@future (callout=true)
	global static void submitData(String endpoint, String content){
		try{
			//CREATE THE REQUEST
			HttpRequest req = new HttpRequest();
			req.setEndpoint(endPoint);
			req.setMethod('POST');
			req.setHeader('content-type', 'application/json');
			req.setBody(content);
			
			//SUBMIT THE REQUEST
			Http Http = new Http();
			HttpResponse resp = Http.send(req);
			system.debug(resp.getBody());
			
			system.debug('DONE');
		}catch(Exception ex){
			system.debug(ex);
		}
	}
	
	global static void Info(string item, string msg, string level, string userId){
		LogEvent(item, msg, 'Info', userId);
	}
	
	global static void Debug(string item, string msg, string level, string userId){
		LogEvent(item, msg, 'Debug', userId);
	}
	
	global static void Error(string item, string msg, string level, string userId){
		LogEvent(item, msg, 'Error', userId);
	}
	
	global static void Warning(string item, string msg, string level, string userId){
		LogEvent(item, msg, 'Warning', userId);
	}
	
	global static void LogEvents(List<EventMessage.Event> events){
		try{
			BrainEngine__c be = BrainEngine__c.getValues('default');
		
			String token = be.token__c;
			String accountId = be.accountId__c;
			String instance = be.instance__c;
			String endPoint = be.endpoint__c;
			
			EventMessage message = new EventMessage();
			message.token = token;
			message.accountId = accountId;
			message.events = events;
			
			//GENERATE THE JSON
			String content = JSON.serialize(message); 
			
			submitData(endPoint,content);
			
		}catch(Exception ex){
			
		}
	}

	global static void LogEvent(string item, string msg, string level, string userId){
		
		BrainEngine__c be = BrainEngine__c.getValues('default');
		
		String token = be.token__c;
		String accountId = be.accountId__c;
		String instance = be.instance__c;
		String endPoint = be.endpoint__c;
		
		EventMessage message = new EventMessage();
		message.token = token;
		message.accountId = accountId;
		message.events = new List<EventMessage.Event>();
		
		EventMessage.Event event = new EventMessage.Event();
		event.message = msg;
		event.item = item;
		event.instance = instance;
		event.level = level;
		
		if(userId != ''){
			User usr = [Select Id, Name from User where Id =:userId limit 1];
			event.userId = userId;
			event.userName = usr.Name;
		}
		
		message.events.add(event);
		
		//GENERATE THE JSON
		String content = JSON.serialize(message); 
		
		submitData(endPoint,content);
		
	}
	
}