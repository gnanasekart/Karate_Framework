package com.api.automation_resource;

import org.junit.jupiter.api.Test;	
import com.intuit.karate.Runner.Builder;

public class ParallelBuilder
{

	@Test
	public void executeKarateTest()
	{
		Builder aRun = new Builder();
		aRun.path("classpath:com/api/basicAuths");
		aRun.parallel(4);
	}
}
