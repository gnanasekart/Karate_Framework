package com.api.basicAuths;



import com.intuit.karate.junit5.Karate;
import com.intuit.karate.junit5.Karate.Test;

public class BasicAuth {

	@Test
	public Karate testRun()
	{
		return Karate.run( "putIncident").relativeTo(getClass());
		
	}
}
