package br.com.andebem.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.flex.remoting.RemotingDestination;
import org.springframework.security.access.annotation.Secured;
import org.springframework.stereotype.Service;

import br.com.andebem.dao.interfaces.UsuarioDao;
import br.com.andebem.entity.TipoUsuario;
import br.com.andebem.entity.Usuario;
import br.com.andebem.exception.InvalidLoginException;
import br.com.andebem.service.interfaces.UsuarioService;

@Service("usuarioService")
@Secured( { "ROLE_USER" })
@RemotingDestination(channels = { "my-amf" })
public class UsuarioServiceImpl extends CadastroServiceBaseImpl<Usuario> implements UsuarioService {

	private UsuarioDao dao;
	
	@Autowired(required = true)
	public void setDao(UsuarioDao dao) {
		super.setDao(dao);
		this.dao = dao;
	}

	@Override
	public void verificarLogin(String login, String senha)
			throws InvalidLoginException {

		Usuario usuario = dao.getUser(login, senha);

		if (usuario == null) {
			throw new InvalidLoginException("Usuário (" + login
					+ ") ou senha informados Invalido");
		}
	}

	@Override
	public Usuario getUsuarioByLogin(String login) {
		return dao.getUserByUsername(login);
	}
	
	public List<TipoUsuario> listarTipoUsuario() {
		return dao.listarTipoUsuario();
	}

}