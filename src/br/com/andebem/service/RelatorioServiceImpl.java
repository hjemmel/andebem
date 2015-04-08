/**
 * 
 */
package br.com.andebem.service;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.flex.remoting.RemotingDestination;
import org.springframework.security.access.annotation.Secured;
import org.springframework.stereotype.Service;

import br.com.andebem.dao.interfaces.RelatorioDao;
import br.com.andebem.dto.GraficoDTO;
import br.com.andebem.service.interfaces.RelatorioService;

/**
 * @author Hans Jakob Emmel
 * 
 */
@Secured( { "ROLE_USER" })
@Service("relatorioService")
@RemotingDestination(channels = { "my-amf" })
public class RelatorioServiceImpl implements RelatorioService {

	@Autowired(required = true)
	private RelatorioDao dao;

	public List<GraficoDTO> listaLocacoesPorMes(Date dataInicio, Date dataFim) {
		return dao.listaLocacoesPorMes(dataInicio, dataFim);
	}

	public List<GraficoDTO> listaLocacoesPorModelo(Date dataInicio, Date dataFim) {
		return dao.listaLocacoesPorModelo(dataInicio, dataFim);
	}
	
	public List<GraficoDTO> listaLocacoesPorCliente(Date dataInicio, Date dataFim) {
		return dao.listaLocacoesPorCliente(dataInicio, dataFim);
	}
}