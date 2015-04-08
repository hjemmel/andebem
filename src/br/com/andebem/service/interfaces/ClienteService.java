package br.com.andebem.service.interfaces;

import java.util.Collection;

import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import br.com.andebem.entity.Cidade;
import br.com.andebem.entity.Cliente;
import br.com.andebem.entity.TipoPessoa;

public interface ClienteService extends CadastroServiceBase<Cliente> {

	@Transactional(readOnly = true, propagation = Propagation.SUPPORTS)
	Collection<Cidade> listarCidades() throws Exception;

	@Transactional(readOnly = true, propagation = Propagation.SUPPORTS)
	Collection<TipoPessoa> listarTiposPessoa() throws Exception;

}
