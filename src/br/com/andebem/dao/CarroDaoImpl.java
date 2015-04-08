package br.com.andebem.dao;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import br.com.andebem.dao.interfaces.CarroDao;
import br.com.andebem.entity.Carro;
import br.com.andebem.hibernate.GenericDaoImpl;

@Repository("carroDao")
public class CarroDaoImpl extends GenericDaoImpl<Carro, Long> implements
		CarroDao {

	@Autowired(required = true)
	public CarroDaoImpl(SessionFactory sessionFactory) {
		super(sessionFactory);
	}

	@Override
	public void save(Carro carro) {
		super.save(carro);
	}

	public void merge(Carro carro) {
		super.merge(carro);
	}

	@Override
	public void delete(Carro carro) {
		super.delete(carro);
	}
}