package br.com.andebem.dao;

import java.util.Collection;
import java.util.Date;

import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import br.com.andebem.dao.interfaces.AutomovelDao;
import br.com.andebem.entity.Alteracao;
import br.com.andebem.entity.Automovel;
import br.com.andebem.entity.Categoria;
import br.com.andebem.entity.Combustivel;
import br.com.andebem.entity.Locacao;
import br.com.andebem.entity.Modelo;
import br.com.andebem.hibernate.GenericDaoImpl;

@Repository("automovelDao")
public class AutomovelDaoImpl extends GenericDaoImpl<Automovel, Long> implements
		AutomovelDao {

	@Autowired(required = true)
	public AutomovelDaoImpl(SessionFactory sessionFactory) {
		super(sessionFactory);
	}

	@SuppressWarnings("unchecked")
	@Override
	public Collection<Categoria> listarCategorias() {

		Criteria c = getSession().createCriteria(Categoria.class);
		return c.list();

	}

	@SuppressWarnings("unchecked")
	@Override
	public Collection<Modelo> listarModelos() {
		Criteria c = getSession().createCriteria(Modelo.class);
		return c.list();
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public Collection<Combustivel> listarCombustiveis() {
		Criteria c = getSession().createCriteria(Combustivel.class);
		return c.list();
	}

	@SuppressWarnings("unchecked")
	@Override
	public Collection<Alteracao> listarAlteracoesPorAutomovel(Long id) {
		Criteria c = getSession().createCriteria(Alteracao.class);
		c.add(Restrictions.eq("automovel.id", id));
		return c.list();
	}
	
	@Override
	public void salvarAlteracoes(Collection<Alteracao> alteracoes, Automovel automovel)
	{
		String sql = "delete from ahc.alteracoes where id_automovel = :id";
        Query query = getSession().createSQLQuery(sql);
        query.setParameter("id", automovel.getId());
        query.executeUpdate();
        
        if(alteracoes!=null)
			for (Alteracao alteracao : alteracoes) {
				getSession().save(alteracao);
			}
	}
	
	@Override
	public void locarAutomovel(Locacao locacao)
	{
		getSession().saveOrUpdate(locacao);
	}
	
	@Override
	public Locacao listarUltimaLocacaoPorAutomovel(Automovel automovel)
	{
		Criteria c = getSession().createCriteria(Locacao.class);
		c.add(Restrictions.eq("automovel.id", automovel.getId()));
		c.add(Restrictions.isNull("dataEntrada"));
		return (Locacao) c.uniqueResult();
	}
	
	@Override
	public void finalizarLocacao(Automovel automovel)
	{
		Locacao locacao = listarUltimaLocacaoPorAutomovel(automovel);
		locacao.setDataEntrada(new Date());
		locarAutomovel(locacao);
	}
}