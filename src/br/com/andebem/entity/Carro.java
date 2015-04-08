package br.com.andebem.entity;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.SequenceGenerator;

/**
 * @author hans
 * 
 */
@Entity
@SequenceGenerator(name = "carro_id_seq", sequenceName = "carro_id_seq", initialValue = 1)
public class Carro {

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO, generator = "carro_id_seq")
	private Long id;
	private Integer ano;
	private String placa;
	private String cor;
	private Double preco;
	private Double kilometros;

//	@OneToMany(mappedBy = "carro", fetch = FetchType.LAZY, cascade = CascadeType.ALL)
//	@Cascade( { org.hibernate.annotations.CascadeType.DELETE_ORPHAN })
//	private List<Acessorio> acessorios;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public Integer getAno() {
		return ano;
	}

	public void setAno(Integer ano) {
		this.ano = ano;
	}

	public String getPlaca() {
		return placa;
	}

	public void setPlaca(String placa) {
		this.placa = placa;
	}

	public String getCor() {
		return cor;
	}

	public void setCor(String cor) {
		this.cor = cor;
	}

	public Double getPreco() {
		return preco;
	}

	public void setPreco(Double preco) {
		this.preco = preco;
	}

	public Double getKilometros() {
		return kilometros;
	}

	public void setKilometros(Double kilometros) {
		this.kilometros = kilometros;
	}

//	public List<Acessorio> getAcessorios() {
//		return this.acessorios;
//	}
//
//	public void setAcessorios(List<Acessorio> acessorios) {
//		this.acessorios = acessorios;
//	}
}