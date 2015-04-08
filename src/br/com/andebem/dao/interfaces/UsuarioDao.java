package br.com.andebem.dao.interfaces;

import java.util.List;

import br.com.andebem.entity.TipoUsuario;
import br.com.andebem.entity.Usuario;
import br.com.andebem.hibernate.interfaces.GenericDAO;

/**
 * @author hans
 *
 */
public interface UsuarioDao extends GenericDAO<Usuario, Long> {
	
	@Override
	public void save(Usuario usuario);
	
	@Override
	public void merge(Usuario usuario);
	
	@Override
	public void delete(Usuario usuario);
	
	public Usuario getUser(String login, String pass);
	
	public Usuario getUserByUsername(String login);
	
	public List<TipoUsuario> listarTipoUsuario();

}