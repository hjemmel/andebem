/**
 * 
 */
package br.com.andebem.entity;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.SequenceGenerator;

/**
 * @author Hans Jakob Emmel
 * 
 */
@Entity
@SequenceGenerator(name = "status_id_seq", sequenceName = "status_id_seq", initialValue = 1)
public class Status extends AbstractEntity implements Serializable {

	private static final long serialVersionUID = -5212901740973485515L;

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO, generator = "status_id_seq")
	private Long id;
	@Column(length = 25, nullable = false)
	private String nome;
	@Column(nullable = false)
	private Boolean disponivel = Boolean.FALSE;

	/**
	 * @return the id
	 */
	public Long getId() {
		return id;
	}

	/**
	 * @param id the id to set
	 */
	public void setId(Long id) {
		this.id = id;
	}

	/**
	 * @return the nome
	 */
	public String getNome() {
		return nome;
	}

	/**
	 * @param nome the nome to set
	 */
	public void setNome(String nome) {
		this.nome = nome;
	}

	/**
	 * @return the disponivel
	 */
	public Boolean getDisponivel() {
		return disponivel;
	}

	/**
	 * @param disponivel the disponivel to set
	 */
	public void setDisponivel(Boolean disponivel) {
		this.disponivel = disponivel;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result
				+ ((disponivel == null) ? 0 : disponivel.hashCode());
		result = prime * result + ((id == null) ? 0 : id.hashCode());
		result = prime * result + ((nome == null) ? 0 : nome.hashCode());
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (getClass() != obj.getClass())
			return false;
		Status other = (Status) obj;
		if (disponivel == null) {
			if (other.disponivel != null)
				return false;
		} else if (!disponivel.equals(other.disponivel))
			return false;
		if (id == null) {
			if (other.id != null)
				return false;
		} else if (!id.equals(other.id))
			return false;
		if (nome == null) {
			if (other.nome != null)
				return false;
		} else if (!nome.equals(other.nome))
			return false;
		return true;
	}

	@Override
	public String toString() {
		return "Status [disponivel=" + disponivel + ", id=" + id + ", nome="
				+ nome + "]";
	}
	
	
}