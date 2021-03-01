package com.api.OAuth;

import com.intuit.karate.junit5.Karate;
import com.intuit.karate.junit5.Karate.Test;

public class OAuth {

	@Test
	public Karate testRun()
	{
		return Karate.run("OAuth_Token").relativeTo(getClass());
		
	}
}
