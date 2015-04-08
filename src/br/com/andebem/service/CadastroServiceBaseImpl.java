package br.com.andebem.service;

import java.util.List;

import org.springframework.dao.DataIntegrityViolationException;

import br.com.andebem.hibernate.interfaces.GenericDAO;
import br.com.andebem.service.interfaces.CadastroServiceBase;

public class CadastroServiceBaseImpl<E> implements CadastroServiceBase<E> {

	private GenericDAO<E, Long> dao;

	public GenericDAO<E, Long> getDao() {
		return dao;
	}

	public void setDao(GenericDAO<E, Long> dao) {
		this.dao = dao;
	}

	@Override
	public void delete(E entity) {
		try{
			dao.delete(entity);
		} catch (DataIntegrityViolationException e){
			throw new DataIntegrityViolationException("Registro não pode ser removido pois está associoado a outro registro");
		}
	}

	@Override
	public void deleteBatch(List<E> entities) {

		for (E e : entities) {
			delete(e);
		}

	}

	@Override
	public E get(Long id) {
		return dao.get(id);
	}

	@Override
	public E insert(E entity) {
		dao.save(entity);
		return entity;
	}

	@Override
	public List<E> list() {
		return dao.findAll();
	}

	@Override
	public E updateGet(E entity) {
		dao.merge(entity);
		return entity;
	}
}
