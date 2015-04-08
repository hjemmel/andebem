/**
 * 
 */
package br.com.andebem.dao;

import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import br.com.andebem.dao.interfaces.AcessorioDao;
import br.com.andebem.entity.Acessorio;
import br.com.andebem.hibernate.GenericDaoImpl;

/**
 * @author Hans Jakob Emmel
 * 
 */
@Repository("acessorioDao")
public class AcessorioDaoImpl extends GenericDaoImpl<Acessorio, Long> implements
		AcessorioDao {

	@Autowired(required = true)
	public AcessorioDaoImpl(SessionFactory sessionFactory) {
		super(sessionFactory);
	}

	@Override
	public List<Acessorio> findAll() {
		return super.findAll();
	}
}
