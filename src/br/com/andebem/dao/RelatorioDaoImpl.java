/**
 * 
 */
package br.com.andebem.dao;

import java.util.Date;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.hibernate.transform.Transformers;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate3.HibernateTemplate;
import org.springframework.stereotype.Repository;

import br.com.andebem.dao.interfaces.RelatorioDao;
import br.com.andebem.dto.GraficoDTO;
import br.com.andebem.utils.RelatorioConstantes;

/**
 * @author Hans Jakob Emmel
 *
 */
@Repository("relatorioDao")
public class RelatorioDaoImpl implements RelatorioDao  {

	private HibernateTemplate hibernateTemplate;
	
	@Autowired( required = true )
	public RelatorioDaoImpl(SessionFactory sessionFactory) {
		this.hibernateTemplate = new HibernateTemplate( sessionFactory );
	}
	
	public void listaCarrosMaisAlugados() {
		
		Query q = this.hibernateTemplate.getSessionFactory().getCurrentSession().getNamedQuery("mySqlQuery");
		q.list();
	}
	
	public List<GraficoDTO> listaLocacoesPorMes(Date dataInicio, Date dataFim)
	{
		return getListaRelatorio(dataInicio, dataFim, RelatorioConstantes.LISTA_LOCACOES_POR_MES);
	}
	
	public List<GraficoDTO> listaLocacoesPorModelo(Date dataInicio, Date dataFim)
	{
		return getListaRelatorio(dataInicio, dataFim, RelatorioConstantes.LISTA_LOCACOES_POR_MODELO);
	}
	
	public List<GraficoDTO> listaLocacoesPorCliente(Date dataInicio, Date dataFim)
	{
		return getListaRelatorio(dataInicio, dataFim, RelatorioConstantes.LISTA_LOCACOES_POR_CLIENTE);
	}
	
	@SuppressWarnings("unchecked")
	private List<GraficoDTO> getListaRelatorio(Date dataInicio, Date dataFim, String queryName)
	{
		Query query = getNamedQuery(queryName);
		query.setParameter("dataInicio",dataInicio);
		query.setParameter("dataFim",dataFim);
		query.setResultTransformer(Transformers.aliasToBean(GraficoDTO.class));
		return (List<GraficoDTO>) query.list();
	}
	
	private Query getNamedQuery(String queryName) {
		Query query = this.hibernateTemplate.getSessionFactory().getCurrentSession().getNamedQuery(queryName);
		return query;
	}

}
