package br.com.andebem.service.interfaces;

import java.util.Collection;

import org.hibernate.exception.ConstraintViolationException;
import org.springframework.dao.DataAccessException;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import br.com.andebem.entity.Alteracao;
import br.com.andebem.entity.Automovel;
import br.com.andebem.entity.Categoria;
import br.com.andebem.entity.Cliente;
import br.com.andebem.entity.Combustivel;
import br.com.andebem.entity.Locacao;
import br.com.andebem.entity.Modelo;

public interface AutomovelService extends CadastroServiceBase<Automovel> {

	@Transactional( readOnly = true )
	public Collection<Categoria> listarCategorias() throws Exception;
	
	@Transactional( readOnly = true )
	public Collection<Modelo> listarModelos() throws Exception;

	@Transactional( readOnly = true )
	Collection<Alteracao> listarAlteracoesPorAutomovel(Long id);

	@Transactional(readOnly = false, rollbackFor = {DataAccessException.class, DataIntegrityViolationException.class, ConstraintViolationException.class},
			propagation = Propagation.REQUIRED)
	void salvarAlteracoes(Collection<Alteracao> alteracoes, Automovel automovel)
			throws Exception;

	@Transactional(readOnly = false, rollbackFor = {DataAccessException.class, DataIntegrityViolationException.class, ConstraintViolationException.class},
			propagation = Propagation.REQUIRED)
	void locarAltomovel(Automovel automovel, Cliente cliente);

	@Transactional( readOnly = true )
	Locacao listarUltimaLocacaoPorAutomovel(Automovel automovel);

	@Transactional(readOnly = false, rollbackFor = {DataAccessException.class, DataIntegrityViolationException.class, ConstraintViolationException.class},
			propagation = Propagation.REQUIRED)
	void finalizarLocacao(Automovel automovel);

	@Transactional( readOnly = true )
	Collection<Combustivel> listarCombustiveis() throws Exception;
}
