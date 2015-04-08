package br.com.andebem.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.flex.remoting.RemotingDestination;
import org.springframework.security.access.annotation.Secured;
import org.springframework.stereotype.Service;

import br.com.andebem.dao.interfaces.MarcaDao;
import br.com.andebem.entity.Marca;
import br.com.andebem.service.interfaces.MarcaService;

@Secured( { "ROLE_USER" })
@Service("marcaService")
@RemotingDestination(channels = { "my-amf" })
public class MarcaServiceImpl extends CadastroServiceBaseImpl<Marca> implements
		MarcaService {

	public MarcaDao dao;
	
	@Autowired(required=true)
	public void setDao(MarcaDao dao) {
		super.setDao(dao);
		
		this.dao = dao;
	}
}