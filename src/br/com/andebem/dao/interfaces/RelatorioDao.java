package br.com.andebem.dao.interfaces;

import java.util.Date;
import java.util.List;

import br.com.andebem.dto.GraficoDTO;

public interface RelatorioDao {
	List<GraficoDTO> listaLocacoesPorMes(Date dataInicio, Date dataFim);
	List<GraficoDTO> listaLocacoesPorModelo(Date dataInicio, Date dataFim);
	List<GraficoDTO> listaLocacoesPorCliente(Date dataInicio, Date dataFim);
}