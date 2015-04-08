package br.com.andebem.service;

import java.util.Collection;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.flex.remoting.RemotingDestination;
import org.springframework.security.access.annotation.Secured;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import br.com.andebem.dao.interfaces.AutomovelDao;
import br.com.andebem.entity.Alteracao;
import br.com.andebem.entity.Automovel;
import br.com.andebem.entity.Categoria;
import br.com.andebem.entity.Cliente;
import br.com.andebem.entity.Combustivel;
import br.com.andebem.entity.Locacao;
import br.com.andebem.entity.Modelo;
import br.com.andebem.service.interfaces.AutomovelService;

@Service("automovelService")
@RemotingDestination(channels = { "my-amf" })
public class AutomovelServiceImpl extends CadastroServiceBaseImpl<Automovel> implements AutomovelService {

	public AutomovelDao dao;

	@Autowired(required = true)
	public void setDao(AutomovelDao dao) {
		super.setDao(dao);
		this.dao = dao;
	}

	@Override
	@Secured( { "ROLE_USER" })
	public Collection<Categoria> listarCategorias() throws Exception {
		Collection<Categoria> categoria = dao.listarCategorias();
		return categoria;
	}

	@Secured( { "ROLE_USER" })
	@Transactional( readOnly = true )
	public Collection<Modelo> listarModelos() throws Exception
	{
		Collection<Modelo> modelo = dao.listarModelos();
		return modelo;
	}
	
	@Secured( { "ROLE_USER" })
	@Override
	public Collection<Combustivel> listarCombustiveis() throws Exception
	{
		return dao.listarCombustiveis();
	}
	
	@Override
	public Collection<Alteracao> listarAlteracoesPorAutomovel(Long id)
	{
		Collection<Alteracao> alteracoes = dao.listarAlteracoesPorAutomovel(id);
		return alteracoes;
	}
	
	@Secured( { "ROLE_USER" })
	@Override
	public void salvarAlteracoes(Collection<Alteracao> alteracoes, Automovel automovel) throws Exception
	{
		dao.salvarAlteracoes(alteracoes, automovel);
	}
	
	@Secured( { "ROLE_USER" })
	@Override
	public void locarAltomovel(Automovel automovel, Cliente cliente)
	{
		dao.save(automovel);

		Locacao locacao = new Locacao();
		locacao.setAutomovel(automovel);
		locacao.setCliente(cliente);
		locacao.setDataSaida(new Date());
		locacao.setTempoLocacao(0);
		
		dao.locarAutomovel(locacao);
	}
	
	@Secured( { "ROLE_USER" })
	@Override
	public Locacao listarUltimaLocacaoPorAutomovel(Automovel automovel)
	{
		return dao.listarUltimaLocacaoPorAutomovel(automovel);
	}
	
	@Secured( { "ROLE_USER" })
	@Override
	public void finalizarLocacao(Automovel automovel) {
		dao.save(automovel);
		
		dao.finalizarLocacao(automovel);
	}
}