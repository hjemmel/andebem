package br.com.andebem.facade.interfaces;

import java.util.Collection;

import br.com.andebem.entity.Automovel;
import br.com.andebem.entity.Categoria;
import br.com.andebem.entity.Modelo;

public interface AutomovelFacade {

	public Collection<Categoria> listarCategorias() throws Exception;
	public Collection<Modelo> listarModelos() throws Exception;
	public void save(Automovel carro) throws Exception;
}
