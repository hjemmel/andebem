package br.com.andebem.dao;

import java.util.Collection;

import org.hibernate.Criteria;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import br.com.andebem.dao.interfaces.ClienteDao;
import br.com.andebem.entity.Cidade;
import br.com.andebem.entity.Cliente;
import br.com.andebem.entity.TipoPessoa;
import br.com.andebem.hibernate.GenericDaoImpl;

@Repository("clienteDao")
public class ClienteDaoImpl extends GenericDaoImpl<Cliente, Long> implements ClienteDao {

	@Autowired(required = true)
	public ClienteDaoImpl(SessionFactory sessionFactory) {
		super(sessionFactory);
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public Collection<Cidade> listarCidades() {
		 Criteria c = getSession().createCriteria(Cidade.class);  
		 return c.list();  
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public Collection<TipoPessoa> listarTiposPessoa() {
	
		Criteria c = getSession().createCriteria(TipoPessoa.class);
		return c.list();
		
	}
}
