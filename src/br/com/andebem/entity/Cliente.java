/**
 * 
 */
package br.com.andebem.entity;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.SequenceGenerator;

/**
 * @author Hans Jakob Emmel
 *
 */
@Entity(name="cliente")
@SequenceGenerator(name = "cliente_id_seq", sequenceName = "cliente_id_seq", initialValue = 1)
public class Cliente extends AbstractEntity implements Serializable {

	private static final long serialVersionUID = -1174815176384571218L;

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO, generator = "cliente_id_seq")
	private Long id;
	
	@Column(length = 50, nullable=false)
	private String nome;
	
	@Column(length = 16, name="cpf_cnpj", nullable=false)
	private String cpfCnpj;

	@Column(name="data_nasc", nullable=false)
	private Date dataNascimento;
	
	@Column(length = 150, nullable=false)
	private String endereco;
	
	@Column(name="tempo_carteira", nullable=false)
	private Integer tempoCarteira;
	
	@Column(name="seguro_opcional", nullable=false)
	private Boolean seguroOpcional = false;
	
	@OneToOne
	@JoinColumn(name = "id_cidade", nullable = false)
	private Cidade cidade;
	
	@OneToOne
	@JoinColumn(name = "id_tipo_pessoa", nullable = false)
	private TipoPessoa tipoPessoa;

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

	public String getCpfCnpj() {
		return cpfCnpj;
	}

	public void setCpfCnpj(String cpfCnpj) {
		this.cpfCnpj = cpfCnpj;
	}

	public Date getDataNascimento() {
		return dataNascimento;
	}

	public void setDataNascimento(Date dataNascimento) {
		this.dataNascimento = dataNascimento;
	}

	public String getEndereco() {
		return endereco;
	}

	public void setEndereco(String endereco) {
		this.endereco = endereco;
	}

	public Integer getTempoCarteira() {
		return tempoCarteira;
	}

	public void setTempoCarteira(Integer tempoCarteira) {
		this.tempoCarteira = tempoCarteira;
	}

	public Boolean getSeguroOpcional() {
		return seguroOpcional;
	}

	public void setSeguroOpcional(Boolean seguroOpcional) {
		this.seguroOpcional = seguroOpcional;
	}

	public Cidade getCidade() {
		return cidade;
	}

	public void setCidade(Cidade cidade) {
		this.cidade = cidade;
	}

	public TipoPessoa getTipoPessoa() {
		return tipoPessoa;
	}

	public void setTipoPessoa(TipoPessoa tipoPessoa) {
		this.tipoPessoa = tipoPessoa;
	}

	/* (non-Javadoc)
	 * @see java.lang.Object#hashCode()
	 */
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = prime;
		result = prime * result + ((cidade == null) ? 0 : cidade.hashCode());
		result = prime * result + ((cpfCnpj == null) ? 0 : cpfCnpj.hashCode());
		result = prime * result
				+ ((dataNascimento == null) ? 0 : dataNascimento.hashCode());
		result = prime * result
				+ ((endereco == null) ? 0 : endereco.hashCode());
		result = prime * result + ((id == null) ? 0 : id.hashCode());
		result = prime * result + ((nome == null) ? 0 : nome.hashCode());
		result = prime * result
				+ ((seguroOpcional == null) ? 0 : seguroOpcional.hashCode());
		result = prime * result
				+ ((tempoCarteira == null) ? 0 : tempoCarteira.hashCode());
		result = prime * result
				+ ((tipoPessoa == null) ? 0 : tipoPessoa.hashCode());
		return result;
	}

	/* (non-Javadoc)
	 * @see java.lang.Object#equals(java.lang.Object)
	 */
	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (getClass() != obj.getClass())
			return false;
		Cliente other = (Cliente) obj;
		if (cidade == null) {
			if (other.cidade != null)
				return false;
		} else if (!cidade.equals(other.cidade))
			return false;
		if (cpfCnpj == null) {
			if (other.cpfCnpj != null)
				return false;
		} else if (!cpfCnpj.equals(other.cpfCnpj))
			return false;
		if (dataNascimento == null) {
			if (other.dataNascimento != null)
				return false;
		} else if (!dataNascimento.equals(other.dataNascimento))
			return false;
		if (endereco == null) {
			if (other.endereco != null)
				return false;
		} else if (!endereco.equals(other.endereco))
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
		if (seguroOpcional == null) {
			if (other.seguroOpcional != null)
				return false;
		} else if (!seguroOpcional.equals(other.seguroOpcional))
			return false;
		if (tempoCarteira == null) {
			if (other.tempoCarteira != null)
				return false;
		} else if (!tempoCarteira.equals(other.tempoCarteira))
			return false;
		if (tipoPessoa == null) {
			if (other.tipoPessoa != null)
				return false;
		} else if (!tipoPessoa.equals(other.tipoPessoa))
			return false;
		return true;
	}

	@Override
	public String toString() {
		return "Cliente [cidade=" + cidade + ", cpfCnpj=" + cpfCnpj
				+ ", dataNascimento=" + dataNascimento + ", endereco="
				+ endereco + ", id=" + id + ", nome=" + nome
				+ ", seguroOpcional=" + seguroOpcional + ", tempoCarteira="
				+ tempoCarteira + ", tipoPessoa=" + tipoPessoa + "]";
	}
}