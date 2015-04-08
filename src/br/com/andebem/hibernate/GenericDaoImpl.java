package br.com.andebem.hibernate;

import java.io.Serializable;
import java.lang.reflect.ParameterizedType;
import java.util.List;

import org.apache.log4j.Logger;
import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Criterion;
import org.hibernate.criterion.Restrictions;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;
import org.springframework.util.Assert;

import br.com.andebem.hibernate.interfaces.GenericDAO;


@SuppressWarnings("unchecked")
public class GenericDaoImpl<T, PK extends Serializable> extends
		HibernateDaoSupport implements GenericDAO<T, PK> {

	protected Logger logger = Logger.getLogger(getClass());

	protected SessionFactory sessionFactory;
	protected Session session;

	protected Class<?> entityClass;

	public GenericDaoImpl() {
		this.entityClass = (Class<?>) ((ParameterizedType) getClass()
				.getGenericSuperclass()).getActualTypeArguments()[0];
	}

	public GenericDaoImpl(SessionFactory sessionFactory, Class<T> entityClass) {
		super.setSessionFactory(sessionFactory);
		this.entityClass = entityClass;
	}

	public GenericDaoImpl(SessionFactory sessionFactory) {
		super.setSessionFactory(sessionFactory);
		this.entityClass = (Class<?>) ((ParameterizedType) getClass()
				.getGenericSuperclass()).getActualTypeArguments()[0];
	}

	@Override
	public Criteria createCriteria(Criterion... criterions) {
		Criteria criteria = super.getSession().createCriteria(entityClass);
		for (Criterion c : criterions) {
			criteria.add(c);
		}
		return criteria;
	}

	@Override
	public Query createQuery(String queryString, Object... values) {
		Assert.hasText(queryString);
		super.getSession().createQuery(queryString);
		Query queryObject = super.getSession().createQuery(queryString);
		if (values != null) {
			for (int i = 0; i < values.length; i++) {
				queryObject.setParameter(i, values[i]);
			}
		}
		return queryObject;
	}

	@Override
	public void delete(T entity) {
		Assert.notNull(entity);
		super.getHibernateTemplate().delete(entity);
		super.getHibernateTemplate().flush();
		logger.info("delete entity: " + entity);
	}

	@Override
	public void delete(PK id) {
		Assert.notNull(id);
		delete(get(id));
	}

	@Override
	public List<T> find(String hql, Object... values) {
		return createQuery(hql, values).list();
	}

	@Override
	public List<T> findAll() {
		return findByCriteria();
	}

	@Override
	public List<T> findByCriteria(Criterion... criterion) {
		return createCriteria(criterion).list();
	}

	@Override
	public List<T> findByProperty(String propertyName, Object value) {
		Assert.hasText(propertyName);
		return createCriteria(Restrictions.eq(propertyName, value)).list();
	}

	@Override
	public T findUniqueByProperty(String propertyName, Object value) {
		Assert.hasText(propertyName);
		return (T) createCriteria(Restrictions.eq(propertyName, value))
				.uniqueResult();
	}

	@Override
	public T get(PK id) {
		return (T) super.getHibernateTemplate().get(entityClass, id);
	}

	@Override
	public boolean isPropertyUnique(String propertyName, Object newValue,
			Object orgValue) {
		if (newValue == null || newValue.equals(orgValue))
			return true;

		Object object = findUniqueByProperty(propertyName, newValue);
		return (object == null);

	}

	@Override
	public void save(T entity) {
		saveOrUpdate(entity);
	}

	@Override
	public void saveOrUpdate(T entity) {
		getHibernateTemplate().saveOrUpdate(entity);
		logger.info("save entity: " + entity);
	}

	@Override
	public void merge(T entity) {
		getHibernateTemplate().merge(entity);
		logger.info("save entity: " + entity);
	}

}
