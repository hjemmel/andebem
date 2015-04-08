package br.com.andebem.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.flex.remoting.RemotingDestination;
import org.springframework.security.access.annotation.Secured;
import org.springframework.stereotype.Service;

import br.com.andebem.dao.interfaces.ModeloDao;
import br.com.andebem.entity.Modelo;
import br.com.andebem.service.interfaces.ModeloService;

@Secured( { "ROLE_USER" })
@Service("modeloService")
@RemotingDestination(channels = { "my-amf" })
public class ModeloServiceImpl extends CadastroServiceBaseImpl<Modelo>
		implements ModeloService {

	public ModeloDao dao;
	
	@Autowired(required = true)
	public void setDao(ModeloDao dao) {
		super.setDao(dao);
		this.dao = dao;
	}


}
