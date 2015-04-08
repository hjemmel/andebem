package br.com.andebem.exception;

import java.io.Serializable;

import br.com.andebem.entity.Usuario;

public class InvalidLoginException extends RuntimeException implements Serializable {

	private static final long serialVersionUID = -1043966341807149793L;

	public InvalidLoginException(String message) {
		super(message);
	}
	
	public InvalidLoginException(Usuario usuario) {
		super("Login ("+usuario.getLogin()+") ou senha inválidos");
	}
	
}