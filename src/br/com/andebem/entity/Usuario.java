package br.com.andebem.entity;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.SequenceGenerator;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.GrantedAuthorityImpl;
import org.springframework.security.core.userdetails.UserDetails;

/**
 * @author Hans Jakob Emmel
 * 
 */
@Entity
@SequenceGenerator(name = "usuario_id_seq", sequenceName = "usuario_id_seq", initialValue = 1)
public class Usuario extends AbstractEntity implements UserDetails, Serializable {

	private static final long serialVersionUID = -7875268673783651969L;

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO, generator = "usuario_id_seq")
	private Long id;

	@Column(length = 150, nullable = false)
	private String nome;

	@Column(length = 10, nullable = false, unique = true)
	private String login;

	@Column(length = 60, nullable = false)
	private String email;

	@Column(length = 10, nullable = false)
	private String senha;

	@OneToOne
	@JoinColumn(name = "id_tipo_usuario", nullable = false)
	private TipoUsuario tipoUsuario;

	/**
	 * @return the tipoUsuario
	 */
	public TipoUsuario getTipoUsuario() {
		return tipoUsuario;
	}

	/**
	 * @param tipoUsuario
	 *            the tipoUsuario to set
	 */
	public void setTipoUsuario(TipoUsuario tipoUsuario) {
		this.tipoUsuario = tipoUsuario;
	}

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

	public String getLogin() {
		return login;
	}

	public void setLogin(String login) {
		this.login = login;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getSenha() {
		return senha;
	}

	public void setSenha(String senha) {
		this.senha = senha;
	}

	// Metodos para serem usados pelo Spring Security
	@Override
	public List<GrantedAuthority> getAuthorities() {

		List<GrantedAuthority> authorities = new ArrayList<GrantedAuthority>();
		authorities.add(new GrantedAuthorityImpl("ROLE_USER"));

		return authorities;
	}

	@Override
	public String getPassword() {
		return getSenha();
	}

	@Override
	public String getUsername() {
		return getLogin();
	}

	@Override
	public boolean isAccountNonExpired() {
		return true;
	}

	@Override
	public boolean isAccountNonLocked() {
		return true;
	}

	@Override
	public boolean isCredentialsNonExpired() {
		return true;
	}

	@Override
	public boolean isEnabled() {
		return true;
	}
	
	@Override
	public String toString() {
		return "Usuario [email=" + email + ", id=" + id + ", login=" + login
				+ ", nome=" + nome + ", senha=" + senha + ", tipoUsuario="
				+ tipoUsuario + "]";
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((email == null) ? 0 : email.hashCode());
		result = prime * result + ((id == null) ? 0 : id.hashCode());
		result = prime * result + ((login == null) ? 0 : login.hashCode());
		result = prime * result + ((nome == null) ? 0 : nome.hashCode());
		result = prime * result + ((senha == null) ? 0 : senha.hashCode());
		result = prime * result
				+ ((tipoUsuario == null) ? 0 : tipoUsuario.hashCode());
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (getClass() != obj.getClass())
			return false;
		Usuario other = (Usuario) obj;
		if (email == null) {
			if (other.email != null)
				return false;
		} else if (!email.equals(other.email))
			return false;
		if (id == null) {
			if (other.id != null)
				return false;
		} else if (!id.equals(other.id))
			return false;
		if (login == null) {
			if (other.login != null)
				return false;
		} else if (!login.equals(other.login))
			return false;
		if (nome == null) {
			if (other.nome != null)
				return false;
		} else if (!nome.equals(other.nome))
			return false;
		if (senha == null) {
			if (other.senha != null)
				return false;
		} else if (!senha.equals(other.senha))
			return false;
		if (tipoUsuario == null) {
			if (other.tipoUsuario != null)
				return false;
		} else if (!tipoUsuario.equals(other.tipoUsuario))
			return false;
		return true;
	}

	
}