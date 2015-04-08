package br.com.andebem.dao.interfaces;

import java.util.Collection;

import br.com.andebem.entity.Alteracao;
import br.com.andebem.entity.Automovel;
import br.com.andebem.entity.Categoria;
import br.com.andebem.entity.Combustivel;
import br.com.andebem.entity.Locacao;
import br.com.andebem.entity.Modelo;
import br.com.andebem.hibernate.interfaces.GenericDAO;

public interface AutomovelDao extends GenericDAO<Automovel, Long> {

	@Override
	public void save(Automovel carro);
	
	@Override
	public void delete(Automovel carro);
	
	public void merge(Automovel carro);
	
	public Collection<Categoria> listarCategorias();
	
	public Collection<Modelo> listarModelos();

	Collection<Alteracao> listarAlteracoesPorAutomovel(Long id);

	void salvarAlteracoes(Collection<Alteracao> alteracoes, Automovel automovel);

	void locarAutomovel(Locacao locacao);

	Locacao listarUltimaLocacaoPorAutomovel(Automovel automovel);

	void finalizarLocacao(Automovel automovel);

	Collection<Combustivel> listarCombustiveis();
}
