package br.com.andebem.entity;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.SequenceGenerator;

@Entity
@SequenceGenerator(name = "combustivel_id_seq", sequenceName = "combustivel_id_seq", initialValue = 1)
public class Combustivel extends AbstractEntity implements Serializable {

	private static final long serialVersionUID = -4718917730674227319L;
	
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO, generator = "combustivel_id_seq")
	private Long id;
	@Column(length = 30)
	private String nome;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	@Override
	public String toString() {
		return "Combustivel [id=" + id + ", nome=" + nome + "]";
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = prime;
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
		Combustivel other = (Combustivel) obj;
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
}