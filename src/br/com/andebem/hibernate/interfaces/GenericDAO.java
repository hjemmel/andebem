package br.com.andebem.hibernate.interfaces;

import java.io.Serializable;
import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.criterion.Criterion;

public interface GenericDAO<T, PK extends Serializable> {

	public void save(T entity);

	void saveOrUpdate(T entity);

	public void merge(T entity);

	public void delete(T entity);

	public void delete(PK id);

	public List<T> findAll();

	public T get(final PK id);

	public List<T> find(String hql, Object... values);

	public List<T> findByCriteria(Criterion... criterion);

	public List<T> findByProperty(String propertyName, Object value);

	public T findUniqueByProperty(String propertyName, Object value);

	public Query createQuery(String queryString, Object... values);

	public Criteria createCriteria(Criterion... criterions);

	public boolean isPropertyUnique(String propertyName, Object newValue,
			Object orgValue);

}
