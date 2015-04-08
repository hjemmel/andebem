package br.com.andebem.service;

import java.util.Collection;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.flex.remoting.RemotingDestination;
import org.springframework.security.access.annotation.Secured;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import br.com.andebem.dao.interfaces.ClienteDao;
import br.com.andebem.entity.Cidade;
import br.com.andebem.entity.Cliente;
import br.com.andebem.entity.TipoPessoa;
import br.com.andebem.service.interfaces.ClienteService;

@Secured( { "ROLE_USER" })
@Service("clienteService")
@RemotingDestination(channels = { "my-amf" })
@Transactional
public class ClienteServiceImpl extends CadastroServiceBaseImpl<Cliente> implements
		ClienteService {

	public ClienteDao dao;

	@Autowired(required = true)
	public void setDao(ClienteDao dao) {
		super.setDao(dao);
		this.dao = dao;
	}
	
	@Override
	public Collection<Cidade> listarCidades() throws Exception {
		return dao.listarCidades();
	}
	
	@Override
	public Collection<TipoPessoa> listarTiposPessoa() throws Exception {
		return dao.listarTiposPessoa();
	}
}
