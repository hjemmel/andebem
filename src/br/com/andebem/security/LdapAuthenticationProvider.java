package br.com.andebem.security;

import javax.naming.ldap.InitialLdapContext;

import org.springframework.ldap.core.DirContextOperations;
import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.ldap.authentication.LdapAuthenticator;

/**
 * Custom Spring Security authentication provider which tries to bind to an LDAP server with
 * the passed-in credentials; of note, when used with the custom {@link LdapAuthenticatorImpl},
 * does <strong>not</strong> require an LDAP username and password for initial binding.
 * 
 * @author Jason
 */
public class LdapAuthenticationProvider implements AuthenticationProvider {

        private LdapAuthenticator authenticator;
        private String defaultAuthority = "ROLE_NORMAL";

		public Authentication authenticate(Authentication auth) throws AuthenticationException {

                // Authenticate, using the passed-in credentials.
                DirContextOperations authAdapter = authenticator.authenticate(auth);

                // Creating an LdapAuthenticationToken (rather than using the existing Authentication
                // object) allows us to add the already-created LDAP context for our app to use later.
                LdapAuthenticationToken ldapAuth = new LdapAuthenticationToken(auth, defaultAuthority);
                InitialLdapContext ldapContext = (InitialLdapContext) authAdapter
                                .getObjectAttribute("ldapContext");
                if (ldapContext != null) {
                        ldapAuth.setContext(ldapContext);
                }

                return ldapAuth;
        }

        @SuppressWarnings("unchecked")
		public boolean supports(Class clazz) {
                return (UsernamePasswordAuthenticationToken.class.isAssignableFrom(clazz));
        }

        public LdapAuthenticator getAuthenticator() {
                return authenticator;
        }

        public void setAuthenticator(LdapAuthenticator authenticator) {
                this.authenticator = authenticator;
        }
        
        public String getDefaultAuthority() {
			return defaultAuthority;
		}

		public void setDefaultAuthority(String defaultAuthority) {
			this.defaultAuthority = defaultAuthority;
		}

}
