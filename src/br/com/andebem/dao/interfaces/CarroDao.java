package br.com.andebem.dao.interfaces;

import br.com.andebem.entity.Carro;
import br.com.andebem.hibernate.interfaces.GenericDAO;

public interface CarroDao extends GenericDAO<Carro, Long> {

	@Override
	public void save(Carro carro);
	
	@Override
	public void delete(Carro carro);
	
	public void merge(Carro carro);
	
}
