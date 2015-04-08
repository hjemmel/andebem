package br.com.andebem.service.interfaces;

import java.util.List;

import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import br.com.andebem.entity.TipoUsuario;
import br.com.andebem.entity.Usuario;
import br.com.andebem.exception.InvalidLoginException;

public interface UsuarioService extends CadastroServiceBase<Usuario> {

	@Transactional(readOnly = true, propagation = Propagation.SUPPORTS)
	void verificarLogin(String usuario, String senha) throws InvalidLoginException;

	@Transactional(readOnly = true, propagation = Propagation.SUPPORTS)
	Usuario getUsuarioByLogin(String login);
	
	@Transactional(readOnly = true, propagation = Propagation.SUPPORTS)
	List<TipoUsuario> listarTipoUsuario();
}
