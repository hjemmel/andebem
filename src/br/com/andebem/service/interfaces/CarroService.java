package br.com.andebem.service.interfaces;

import br.com.andebem.entity.Carro;

public interface CarroService {

	void save(Carro carro);
	
	void delete(Carro carro);
	
	void merge(Carro carro);
	
}