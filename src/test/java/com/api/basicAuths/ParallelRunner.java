package com.api.basicAuths;

import org.junit.jupiter.api.Test;

import com.intuit.karate.Runner;

public class ParallelRunner {

	@Test
	public void executeTest()
	{
		Runner.parallel(getClass(), 3);
		
	}
}
