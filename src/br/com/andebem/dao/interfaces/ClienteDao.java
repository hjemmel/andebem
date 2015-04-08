package br.com.andebem.dao.interfaces;

import java.util.Collection;

import br.com.andebem.entity.Cidade;
import br.com.andebem.entity.Cliente;
import br.com.andebem.entity.TipoPessoa;
import br.com.andebem.hibernate.interfaces.GenericDAO;

public interface ClienteDao extends GenericDAO<Cliente, Long> {

	Collection<Cidade> listarCidades();

	Collection<TipoPessoa> listarTiposPessoa();

}
