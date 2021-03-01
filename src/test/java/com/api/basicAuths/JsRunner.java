package com.api.basicAuths;
import com.intuit.karate.junit5.Karate;
import com.intuit.karate.junit5.Karate.Test;

public class JsRunner {

	@Test
	public Karate testRun()
	{
		return Karate.run("JavaScriptExect").relativeTo(getClass());
		
	}
}
