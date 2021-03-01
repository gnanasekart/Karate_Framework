package com.api.variable;

import com.intuit.karate.junit5.Karate;
import com.intuit.karate.junit5.Karate.Test;

public class VariableRunner {

	@Test
	public Karate testRun()
	{
		return Karate.run("variableReadData", "DataDriven").relativeTo(getClass());
	}
}
