/**
 * 
 */
package br.com.andebem.entity;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.SequenceGenerator;

import org.hibernate.annotations.Fetch;
import org.hibernate.annotations.FetchMode;

/**
 * @author Hans Jakob Emmel
 * 
 */
@Entity
@SequenceGenerator(name = "automovel_id_seq", sequenceName = "automovel_id_seq", initialValue = 1)
public class Automovel extends AbstractEntity implements Serializable {

	private static final long serialVersionUID = -2197029137501469799L;

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO, generator = "automovel_id_seq")
	private Long id;
	@ManyToOne
	@JoinColumn(name = "id_modelo", nullable = false, insertable = true)
	private Modelo modelo;
	private Integer ano;
	private String placa;
	private String chassi;
	private Double preco;
	private Date data_insert;
	private Date data_update;

	@ManyToOne
	@JoinColumn(name = "id_usuario_gravacao", nullable = false, insertable = true)
	private Usuario usuario;

	private String cor;
	@ManyToOne
	@JoinColumn(name = "id_combustivel", nullable = false, insertable = true)
	private Combustivel combustivel;
	private String renavam;
	private Date data_compra;
	private Long num_nota;

	@ManyToOne
	@JoinColumn(name = "id_categoria", nullable = false, insertable = true)
	private Categoria categoria;

	@Column(name = "num_portas", nullable = false)
	private Integer numeroPortas = 2;

	@ManyToOne
	@JoinColumn(name = "id_status", nullable = false, insertable = true)
	private Status status;
	
	@Fetch(FetchMode.SUBSELECT)
	@ManyToMany(cascade = {CascadeType.MERGE, CascadeType.PERSIST},fetch=FetchType.EAGER)
	@JoinTable(name="opcionais",
			joinColumns={@JoinColumn(name="id_automovel")},
			inverseJoinColumns={@JoinColumn(name="id_acessorio")})
	private List<Acessorio> acessorios;

	public List<Acessorio> getAcessorios() {
		return acessorios;
	}

	public void setAcessorios(List<Acessorio> acessorios) {
		this.acessorios = acessorios;
	}

	public Modelo getModelo() {
		return modelo;
	}

	public void setModelo(Modelo modelo) {
		this.modelo = modelo;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	@Column(name = "ano", nullable = false)
	public Integer getAno() {
		return ano;
	}

	public void setAno(Integer ano) {
		this.ano = ano;
	}

	@Column(name = "placa", nullable = false)
	public String getPlaca() {
		return placa;
	}

	public void setPlaca(String placa) {
		this.placa = placa;
	}

	@Column(name = "chassi")
	public String getChassi() {
		return chassi;
	}

	public void setChassi(String chassi) {
		this.chassi = chassi;
	}

	@Column(name = "preco", nullable = false)
	public Double getPreco() {
		return preco;
	}

	public void setPreco(Double preco) {
		this.preco = preco;
	}

	@Column(name = "data_insert", nullable = false)
	public Date getData_insert() {
		return data_insert;
	}

	public void setData_insert(Date dataInsert) {
		data_insert = dataInsert;
	}

	@Column(name = "data_update", nullable = false)
	public Date getData_update() {
		return data_update;
	}

	public void setData_update(Date dataUpdate) {
		data_update = dataUpdate;
	}

	@Column(name = "cor", nullable = false)
	public String getCor() {
		return cor;
	}

	public void setCor(String cor) {
		this.cor = cor;
	}

	public Combustivel getCombustivel() {
		return combustivel;
	}

	public void setCombustivel(Combustivel combustivel) {
		this.combustivel = combustivel;
	}

	@Column(name = "renavam", nullable = false)
	public String getRenavam() {
		return renavam;
	}

	public void setRenavam(String renavam) {
		this.renavam = renavam;
	}

	@Column(name = "data_compra", nullable = false)
	public Date getData_compra() {
		return data_compra;
	}

	public void setData_compra(Date dataCompra) {
		data_compra = dataCompra;
	}

	@Column(name = "num_nota", nullable = false)
	public Long getNum_nota() {
		return num_nota;
	}

	public void setNum_nota(Long numNota) {
		num_nota = numNota;
	}

	public void setUsuario(Usuario usuario) {
		this.usuario = usuario;
	}

	public Usuario getUsuario() {
		return usuario;
	}

	public void setStatus(Status status) {
		this.status = status;
	}

	public Status getStatus() {
		return status;
	}

	public Categoria getCategoria() {
		return categoria;
	}

	public void setCategoria(Categoria categoria) {
		this.categoria = categoria;
	}

	public Integer getNumeroPortas() {
		return numeroPortas;
	}

	public void setNumeroPortas(Integer numeroPortas) {
		this.numeroPortas = numeroPortas;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = prime;
		result = prime * result + ((ano == null) ? 0 : ano.hashCode());
		result = prime * result
				+ ((categoria == null) ? 0 : categoria.hashCode());
		result = prime * result + ((chassi == null) ? 0 : chassi.hashCode());
		result = prime * result
				+ ((combustivel == null) ? 0 : combustivel.hashCode());
		result = prime * result + ((cor == null) ? 0 : cor.hashCode());
		result = prime * result
				+ ((data_compra == null) ? 0 : data_compra.hashCode());
		result = prime * result
				+ ((data_insert == null) ? 0 : data_insert.hashCode());
		result = prime * result
				+ ((data_update == null) ? 0 : data_update.hashCode());
		result = prime * result + ((id == null) ? 0 : id.hashCode());
		result = prime * result + ((modelo == null) ? 0 : modelo.hashCode());
		result = prime * result
				+ ((num_nota == null) ? 0 : num_nota.hashCode());
		result = prime * result
				+ ((numeroPortas == null) ? 0 : numeroPortas.hashCode());
		result = prime * result + ((placa == null) ? 0 : placa.hashCode());
		result = prime * result + ((preco == null) ? 0 : preco.hashCode());
		result = prime * result + ((renavam == null) ? 0 : renavam.hashCode());
		result = prime * result + ((status == null) ? 0 : status.hashCode());
		result = prime * result + ((usuario == null) ? 0 : usuario.hashCode());
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (getClass() != obj.getClass())
			return false;
		Automovel other = (Automovel) obj;
		if (ano == null) {
			if (other.ano != null)
				return false;
		} else if (!ano.equals(other.ano))
			return false;
		if (categoria == null) {
			if (other.categoria != null)
				return false;
		} else if (!categoria.equals(other.categoria))
			return false;
		if (chassi == null) {
			if (other.chassi != null)
				return false;
		} else if (!chassi.equals(other.chassi))
			return false;
		if (combustivel == null) {
			if (other.combustivel != null)
				return false;
		} else if (!combustivel.equals(other.combustivel))
			return false;
		if (cor == null) {
			if (other.cor != null)
				return false;
		} else if (!cor.equals(other.cor))
			return false;
		if (data_compra == null) {
			if (other.data_compra != null)
				return false;
		} else if (!data_compra.equals(other.data_compra))
			return false;
		if (data_insert == null) {
			if (other.data_insert != null)
				return false;
		} else if (!data_insert.equals(other.data_insert))
			return false;
		if (data_update == null) {
			if (other.data_update != null)
				return false;
		} else if (!data_update.equals(other.data_update))
			return false;
		if (id == null) {
			if (other.id != null)
				return false;
		} else if (!id.equals(other.id))
			return false;
		if (modelo == null) {
			if (other.modelo != null)
				return false;
		} else if (!modelo.equals(other.modelo))
			return false;
		if (num_nota == null) {
			if (other.num_nota != null)
				return false;
		} else if (!num_nota.equals(other.num_nota))
			return false;
		if (numeroPortas == null) {
			if (other.numeroPortas != null)
				return false;
		} else if (!numeroPortas.equals(other.numeroPortas))
			return false;
		if (placa == null) {
			if (other.placa != null)
				return false;
		} else if (!placa.equals(other.placa))
			return false;
		if (preco == null) {
			if (other.preco != null)
				return false;
		} else if (!preco.equals(other.preco))
			return false;
		if (renavam == null) {
			if (other.renavam != null)
				return false;
		} else if (!renavam.equals(other.renavam))
			return false;
		if (status == null) {
			if (other.status != null)
				return false;
		} else if (!status.equals(other.status))
			return false;
		if (usuario == null) {
			if (other.usuario != null)
				return false;
		} else if (!usuario.equals(other.usuario))
			return false;
		return true;
	}

	@Override
	public String toString() {
		return "Automovel [ano=" + ano + ", categoria=" + categoria
				+ ", chassi=" + chassi + ", combustivel=" + combustivel
				+ ", cor=" + cor + ", data_compra=" + data_compra
				+ ", data_insert=" + data_insert + ", data_update="
				+ data_update + ", id=" + id + ", modelo=" + modelo
				+ ", num_nota=" + num_nota + ", numeroPortas=" + numeroPortas
				+ ", placa=" + placa + ", preco=" + preco + ", renavam="
				+ renavam + ", status=" + status + ", usuario=" + usuario + "]";
	}
}