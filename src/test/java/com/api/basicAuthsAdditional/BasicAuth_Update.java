package com.api.basicAuthsAdditional;



import com.intuit.karate.junit5.Karate;
import com.intuit.karate.junit5.Karate.Test;

public class BasicAuth_Update {

	@Test
	public Karate testRun()
	{
		return Karate.run("deleteIncident").relativeTo(getClass());
		
	}
}
