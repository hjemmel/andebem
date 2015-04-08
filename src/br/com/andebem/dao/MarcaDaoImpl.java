package br.com.andebem.dao;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import br.com.andebem.dao.interfaces.MarcaDao;
import br.com.andebem.entity.Marca;
import br.com.andebem.hibernate.GenericDaoImpl;

@Repository("marcaDao")
public class MarcaDaoImpl extends GenericDaoImpl<Marca, Long> implements
		MarcaDao {

	@Autowired(required = true)
	public MarcaDaoImpl(SessionFactory sessionFactory) {
		super(sessionFactory);
	}
}