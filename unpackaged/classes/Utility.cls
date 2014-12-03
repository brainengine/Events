public with sharing class Utility{
	
	public void CreateAccount(){
		try{
			BrainEngineEvents.LogEvent('Utility.CreateAccount','Starting Process','Info', UserInfo.getUserId());
			Contact a = new Contact();
			GenerateMessage();
			insert a;
		}catch(Exception ex){
			BrainEngineEvents.LogEvent('Utility.CreateAccount',ex.getMessage(),'Error', UserInfo.getUserId());
		}
		
	}
	
	public void GenerateMessage(){
		XmlStreamWriter w = null;
		try {
			//BrainEngineEvents.LogEvent('Utility.GenerateMessage','Building Message','Info', UserInfo.getUserId());
			
			w = new XmlStreamWriter();
			w.writeStartDocument(null, '1.0');
			w.writeStartElement(null, 'book', null);
			w.writeCharacters('This is my book');
			w.writeEndElement();
			w.writeEndDocument();
			// Perform some other operations
			String s;
			// This causes an exception because
			// the string hasn't been assigned a value.
			Integer i = s.length();
		} catch(Exception e) {
			System.debug('An exception occurred: ' + e.getMessage());
			//BrainEngineEvents.LogEvent('Utility.GenerateMessage',e.getMessage(),'Error', UserInfo.getUserId());
		} finally {
			// This gets executed after the exception is handled
			System.debug('Closing the stream writer in the finally block.');
			// Close the stream writer
			w.close();
		}
	}


}