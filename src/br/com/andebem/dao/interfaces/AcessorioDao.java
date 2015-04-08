/**
 * 
 */
package br.com.andebem.dao.interfaces;

import java.util.List;

import br.com.andebem.entity.Acessorio;
import br.com.andebem.hibernate.interfaces.GenericDAO;

/**
 * @author Hans Jakob Emmel
 *
 */
public interface AcessorioDao extends GenericDAO<Acessorio, Long> {

	@Override
	public List<Acessorio> findAll();
	
}
