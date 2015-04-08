package br.com.andebem.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.flex.remoting.RemotingDestination;
import org.springframework.flex.remoting.RemotingInclude;
import org.springframework.security.access.annotation.Secured;
import org.springframework.stereotype.Service;

import br.com.andebem.dao.interfaces.RelatorioDao;
import br.com.andebem.service.interfaces.TestService;


@Service("testService")
@Secured({"ROLE_USER"})
@RemotingDestination(channels={"my-amf"})
public class TestServiceImpl implements TestService {
	
	@Autowired
	public RelatorioDao dao; 
	
	@RemotingInclude
	public String helloWord(String message) {
		return "Hello Word: " + message;
	}
	
	@RemotingInclude
	public String helloTeste(String message) {
		return "Hello Teste: " + message;
	}
	
	public void test()
	{
		//dao.listaCarrosMaisAlugados();
	}
}
