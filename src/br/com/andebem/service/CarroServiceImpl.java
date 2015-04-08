package br.com.andebem.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import br.com.andebem.dao.interfaces.CarroDao;
import br.com.andebem.entity.Carro;
import br.com.andebem.service.interfaces.CarroService;

@Service("carroService")
@Transactional
public class CarroServiceImpl implements CarroService {

	@Autowired
	private CarroDao dao;
	public void save(Carro carro) {
		dao.save(carro);
	}

	public void merge(Carro carro) {
		dao.merge(carro);
	}

	public void delete(Carro carro) {
		dao.delete(carro);
	}

}