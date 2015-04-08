package br.com.andebem.dao;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import br.com.andebem.dao.interfaces.UsuarioDao;
import br.com.andebem.entity.TipoUsuario;
import br.com.andebem.entity.Usuario;
import br.com.andebem.hibernate.GenericDaoImpl;

@Repository("usuarioDao")
public class UsuarioDaoImpl extends GenericDaoImpl<Usuario, Long> implements UsuarioDao {

	@Autowired(required=true)
	public UsuarioDaoImpl(SessionFactory sessionFactory) {
		super(sessionFactory);
	}

	@Override
	public void save(Usuario usuario) {
		super.save(usuario);
	}
	
	public Usuario getUser(String login, String pass)
	{
		Criteria c = createCriteria(Restrictions.eq("login", login),
									Restrictions.eq("senha", pass));
		
		Usuario user = (Usuario) c.uniqueResult();
		
		return user;
	}

	@Override
	public Usuario getUserByUsername(String login) {
		Criteria c = createCriteria(Restrictions.eq("login", login));

		Usuario user = (Usuario) c.uniqueResult();

		return user;
	}
	
	@SuppressWarnings("unchecked")
	public List<TipoUsuario> listarTipoUsuario() {
		Criteria criteria = super.getSession().createCriteria(TipoUsuario.class);
		return (List<TipoUsuario>) criteria.list();
	}

}