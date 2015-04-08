package br.com.andebem.dao;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import br.com.andebem.entity.Modelo;
import br.com.andebem.hibernate.GenericDaoImpl;

@Repository("modeloDao")
public class ModeloDao extends GenericDaoImpl<Modelo, Long> implements
		br.com.andebem.dao.interfaces.ModeloDao {

	@Autowired(required = true)
	public ModeloDao(SessionFactory sessionFactory) {
		super(sessionFactory);
	}

}
