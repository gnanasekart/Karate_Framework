package com.api.automation_resource;

import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.Test;

import com.intuit.karate.Results;
import com.intuit.karate.Runner;
import com.intuit.karate.Runner.Builder;
import com.intuit.karate.core.Result;

public class ParallelRunner {

	@Test
	public void executeTest()
	{
		
//		Runner.parallel(getClass(), 3);
	
		Builder aRun = new Builder();
		aRun.path("classpath:com/api/basicAuths");
		aRun.tags("@full");
		aRun.parallel(4);
		
		Results result = Runner.parallel(aRun);
		System.out.println("Total pass count = "+result.getPassCount());
		System.out.println("Total fail count = "+result.getFailCount());
		System.out.println("Total scenario count = "+result.getScenarioCount());
		System.out.println("Total feature count = "+result.getFeatureCount());
		
		Assertions.assertEquals(0, result.getFailCount(), "This scenario has failed cases");
		
	}
}
