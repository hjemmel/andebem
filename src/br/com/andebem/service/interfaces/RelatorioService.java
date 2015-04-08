package br.com.andebem.service.interfaces;

import java.util.Date;
import java.util.List;

import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import br.com.andebem.dto.GraficoDTO;

public interface RelatorioService {

	@Transactional(propagation = Propagation.SUPPORTS, readOnly = true)
	List<GraficoDTO> listaLocacoesPorMes(Date dataInicio, Date dataFim);

	@Transactional(propagation = Propagation.SUPPORTS, readOnly = true)
	List<GraficoDTO> listaLocacoesPorModelo(Date dataInicio, Date dataFim);

	@Transactional(propagation = Propagation.SUPPORTS, readOnly = true)
	List<GraficoDTO> listaLocacoesPorCliente(Date dataInicio, Date dataFim);
}