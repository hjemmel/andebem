package br.com.andebem.facade;

import java.util.Collection;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.flex.remoting.RemotingDestination;
import org.springframework.security.access.annotation.Secured;
import org.springframework.stereotype.Service;

import br.com.andebem.entity.Automovel;
import br.com.andebem.entity.Categoria;
import br.com.andebem.entity.Modelo;
import br.com.andebem.facade.interfaces.AutomovelFacade;
import br.com.andebem.service.interfaces.AutomovelService;

@Service("automovelFacade")
@Secured( { "ROLE_USER" })
@RemotingDestination(channels = { "my-amf" })
public class AutomovelFacadeImpl implements AutomovelFacade {

	@Override
	public Collection<Categoria> listarCategorias() throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Collection<Modelo> listarModelos() throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void save(Automovel carro) throws Exception {
		// TODO Auto-generated method stub
		
	}

//	@Autowired(required = true)
//	private AutomovelService service;
//	
//	@Override
//	public void save(Automovel carro) throws Exception
//	{
//		service.save(carro);
//	}
//	
//	@Override
//	public Collection<Categoria> listarCategorias() throws Exception {
//
//		return service.listarCategorias();
//	}
//	
//	@Override
//	public Collection<Modelo> listarModelos() throws Exception {
//
//		return service.listarModelos();
//	}
	

}
