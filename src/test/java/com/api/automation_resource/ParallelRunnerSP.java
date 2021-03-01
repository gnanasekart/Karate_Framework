package com.api.automation_resource;

import java.util.Arrays;
import java.util.List;

import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.Test;

import com.intuit.karate.Results;
import com.intuit.karate.Runner;
import com.intuit.karate.Runner.Builder;

public class ParallelRunnerSP {

	private static final String CLASS_PATH = "classpath:";
	@Test
	public void executeTest()
	{

		//		Runner.parallel(getClass(), 3);

		Builder aRun = new Builder();
		aRun.path("classpath:com/api/basicAuths");
		aRun.tags(getTags());
		aRun.parallel(4);

		Results result = Runner.parallel(aRun);
		System.out.println("Total pass count = "+result.getPassCount());
		System.out.println("Total fail count = "+result.getFailCount());
		System.out.println("Total scenario count = "+result.getScenarioCount());
		System.out.println("Total feature count = "+result.getFeatureCount());

		Assertions.assertEquals(0, result.getFailCount(), "This scenario has failed cases");

	}

	private List<String> getTags(){
		String atags = System.getProperty("tags", "@Smoke");
		List<String> ataglist = Arrays.asList(atags);
		System.out.println(ataglist);
		return ataglist;
	}


	private List<String> getLocation(){
		String aLocation = System.getProperty("location", "com/api/automation");
		List<String> aLocationList = Arrays.asList(CLASS_PATH + aLocation);
		System.out.println(aLocationList);
		return aLocationList;
	}
}
