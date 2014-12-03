/**
	* AccountTrigger - <description>
	* Created by BrainEngine Cloud Studio
	* @author: brian maththews
	* @version: 1.0
*/

trigger AccountTrigger on Account bulk (before insert) {

	Utility sys = new Utility();
	sys.CreateAccount();

}