package br.com.andebem.entity;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.SequenceGenerator;

@Entity(name="alteracoes")
@SequenceGenerator(name = "alteracoes_id_seq", sequenceName = "alteracoes_id_seq", initialValue = 1)
public class Alteracao extends AbstractEntity implements Serializable {

	private static final long serialVersionUID = 2866222286324478369L;
	 
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO, generator = "alteracoes_id_seq")
	private Long id;
	private String descricao;
	private Boolean ativa = false;

	@ManyToOne
	@JoinColumn(name = "id_automovel", nullable = false, insertable = true)
	private Automovel automovel;
	
	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getDescricao() {
		return descricao;
	}

	public void setDescricao(String descricao) {
		this.descricao = descricao;
	}

	public Boolean getAtiva() {
		return ativa;
	}

	public void setAtiva(Boolean ativa) {
		this.ativa = ativa;
	}

	public Automovel getAutomovel() {
		return automovel;
	}

	public void setAutomovel(Automovel automovel) {
		this.automovel = automovel;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = prime;
		result = prime * result + ((ativa == null) ? 0 : ativa.hashCode());
		result = prime * result
				+ ((automovel == null) ? 0 : automovel.hashCode());
		result = prime * result
				+ ((descricao == null) ? 0 : descricao.hashCode());
		result = prime * result + ((id == null) ? 0 : id.hashCode());
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (getClass() != obj.getClass())
			return false;
		Alteracao other = (Alteracao) obj;
		if (ativa == null) {
			if (other.ativa != null)
				return false;
		} else if (!ativa.equals(other.ativa))
			return false;
		if (automovel == null) {
			if (other.automovel != null)
				return false;
		} else if (!automovel.equals(other.automovel))
			return false;
		if (descricao == null) {
			if (other.descricao != null)
				return false;
		} else if (!descricao.equals(other.descricao))
			return false;
		if (id == null) {
			if (other.id != null)
				return false;
		} else if (!id.equals(other.id))
			return false;
		return true;
	}

	@Override
	public String toString() {
		return "Alteracao [ativa=" + ativa + ", automovel=" + automovel
				+ ", descricao=" + descricao + ", id=" + id + "]";
	}
}