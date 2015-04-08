package br.com.andebem.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

import br.com.andebem.dao.interfaces.UsuarioDao;

public class UserDetailsServiceImpl implements UserDetailsService {

	@Autowired
	private UsuarioDao dao;

	@Override
	public UserDetails loadUserByUsername(String username)
			throws UsernameNotFoundException, DataAccessException {

		UserDetails user = dao.getUserByUsername(username);

		if(user==null)
		{
			throw new UsernameNotFoundException(username+" can't be found");
		}

		return user;
	}

}
