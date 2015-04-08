package br.com.andebem.entity;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.SequenceGenerator;

/**
 * @author Hans Jakob Emmel
 *
 */
@Entity(name="locacao")
@SequenceGenerator(name = "locacao_id_seq", sequenceName = "locacao_id_seq", initialValue = 1)
public class Locacao extends AbstractEntity implements Serializable {

	private static final long serialVersionUID = -4852510333832761259L;

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO, generator = "locacao_id_seq")
	private Long id;
	
	@ManyToOne
	@JoinColumn(name = "id_automovel", nullable = false, insertable = true)
	private Automovel automovel;
	
	@ManyToOne
	@JoinColumn(name = "id_cliente", nullable = false, insertable = true)
	private Cliente cliente;
	
	@Column(name="data_saida")
	private Date dataSaida;
	
	@Column(name="data_entrada")
	private Date dataEntrada;
	
	@Column(name="tempo_locacao")
	private Integer tempoLocacao;
	
	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public Automovel getAutomovel() {
		return automovel;
	}

	public void setAutomovel(Automovel automovel) {
		this.automovel = automovel;
	}

	public Cliente getCliente() {
		return cliente;
	}

	public void setCliente(Cliente cliente) {
		this.cliente = cliente;
	}

	public Date getDataSaida() {
		return dataSaida;
	}

	public void setDataSaida(Date dataSaida) {
		this.dataSaida = dataSaida;
	}

	public Date getDataEntrada() {
		return dataEntrada;
	}

	public void setDataEntrada(Date dataEntrada) {
		this.dataEntrada = dataEntrada;
	}

	public Integer getTempoLocacao() {
		return tempoLocacao;
	}

	public void setTempoLocacao(Integer tempoLocacao) {
		this.tempoLocacao = tempoLocacao;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = prime;
		result = prime * result
				+ ((automovel == null) ? 0 : automovel.hashCode());
		result = prime * result + ((cliente == null) ? 0 : cliente.hashCode());
		result = prime * result
				+ ((dataEntrada == null) ? 0 : dataEntrada.hashCode());
		result = prime * result
				+ ((dataSaida == null) ? 0 : dataSaida.hashCode());
		result = prime * result + ((id == null) ? 0 : id.hashCode());
		result = prime * result
				+ ((tempoLocacao == null) ? 0 : tempoLocacao.hashCode());
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (getClass() != obj.getClass())
			return false;
		Locacao other = (Locacao) obj;
		if (automovel == null) {
			if (other.automovel != null)
				return false;
		} else if (!automovel.equals(other.automovel))
			return false;
		if (cliente == null) {
			if (other.cliente != null)
				return false;
		} else if (!cliente.equals(other.cliente))
			return false;
		if (dataEntrada == null) {
			if (other.dataEntrada != null)
				return false;
		} else if (!dataEntrada.equals(other.dataEntrada))
			return false;
		if (dataSaida == null) {
			if (other.dataSaida != null)
				return false;
		} else if (!dataSaida.equals(other.dataSaida))
			return false;
		if (id == null) {
			if (other.id != null)
				return false;
		} else if (!id.equals(other.id))
			return false;
		if (tempoLocacao == null) {
			if (other.tempoLocacao != null)
				return false;
		} else if (!tempoLocacao.equals(other.tempoLocacao))
			return false;
		return true;
	}

	@Override
	public String toString() {
		return "Locacao [automovel=" + automovel + ", cliente=" + cliente
				+ ", dataEntrada=" + dataEntrada + ", dataSaida=" + dataSaida
				+ ", id=" + id + ", tempoLocacao=" + tempoLocacao + "]";
	}
}