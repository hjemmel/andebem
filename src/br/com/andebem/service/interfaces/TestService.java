package br.com.andebem.service.interfaces;

import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

public interface TestService {
	
	String helloWord(String message);

	@Transactional( propagation = Propagation.SUPPORTS )
	void test();

}
