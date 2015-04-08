package br.com.andebem.service.interfaces;

import java.util.List;

import javax.persistence.EntityNotFoundException;

import org.hibernate.exception.ConstraintViolationException;
import org.springframework.dao.DataAccessException;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

@Transactional(readOnly = true, rollbackFor = DataAccessException.class, propagation = Propagation.SUPPORTS)
public interface CadastroServiceBase<E> {

	@Transactional(readOnly = false, rollbackFor = DataAccessException.class,
			propagation = Propagation.REQUIRED)
	E insert(E entity) throws EntityNotFoundException;;

	@Transactional(readOnly = false, rollbackFor = DataAccessException.class,
			propagation = Propagation.REQUIRED)
	E updateGet(E entity) throws EntityNotFoundException;
	
	@Transactional(readOnly = false, rollbackFor = {DataAccessException.class, DataIntegrityViolationException.class, ConstraintViolationException.class},
			propagation = Propagation.REQUIRED)
	void delete(final E entity) throws EntityNotFoundException, DataIntegrityViolationException;

	@Transactional(readOnly = false, rollbackFor = {DataAccessException.class, DataIntegrityViolationException.class, ConstraintViolationException.class},
			propagation = Propagation.REQUIRED)
	void deleteBatch(final List<E> entities) throws EntityNotFoundException, DataIntegrityViolationException;
	
	@Transactional(readOnly = true, propagation = Propagation.SUPPORTS)
	List<E> list();

	@Transactional(readOnly = true, propagation = Propagation.SUPPORTS)
	E get(Long id);
}