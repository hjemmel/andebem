package br.com.andebem.dto;

import java.util.Collection;

import br.com.andebem.entity.Alteracao;

public class RelatorioDTO {

	private String modelo;
	private String placa;
	private String cor;
	private Long laudo;
	private Collection<Alteracao> alteracoes;
	
	/**
	 * @return the modelo
	 */
	public String getModelo() {
		return modelo;
	}
	/**
	 * @param modelo the modelo to set
	 */
	public void setModelo(String modelo) {
		this.modelo = modelo;
	}
	/**
	 * @return the placa
	 */
	public String getPlaca() {
		return placa;
	}
	/**
	 * @param placa the placa to set
	 */
	public void setPlaca(String placa) {
		this.placa = placa;
	}
	/**
	 * @return the cor
	 */
	public String getCor() {
		return cor;
	}
	/**
	 * @param cor the cor to set
	 */
	public void setCor(String cor) {
		this.cor = cor;
	}
	/**
	 * @return the laudo
	 */
	public Long getLaudo() {
		return laudo;
	}
	/**
	 * @param laudo the laudo to set
	 */
	public void setLaudo(Long laudo) {
		this.laudo = laudo;
	}
	/**
	 * @return the alteracoes
	 */
	public Collection<Alteracao> getAlteracoes() {
		return alteracoes;
	}
	/**
	 * @param alteracoes the alteracoes to set
	 */
	public void setAlteracoes(Collection<Alteracao> alteracoes) {
		this.alteracoes = alteracoes;
	}
	
}
