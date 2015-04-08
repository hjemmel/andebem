/**
 * 
 */
package br.com.andebem.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.flex.remoting.RemotingDestination;
import org.springframework.security.access.annotation.Secured;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import br.com.andebem.dao.interfaces.AcessorioDao;
import br.com.andebem.entity.Acessorio;
import br.com.andebem.service.interfaces.AcessorioService;

/**
 * @author Hans Jakob Emmel
 * 
 */
@Secured( { "ROLE_USER" })
@Service("acessorioService")
@RemotingDestination(channels = { "my-amf" })
@Transactional
public class AcessorioServiceImpl extends CadastroServiceBaseImpl<Acessorio>
		implements AcessorioService {

	public AcessorioDao dao;

	@Autowired(required = true)
	public void setDao(AcessorioDao dao) {
		super.setDao(dao);
		this.dao = dao;
	}

}
