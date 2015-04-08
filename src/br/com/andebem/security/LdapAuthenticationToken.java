package br.com.andebem.security;

import java.util.ArrayList;
import java.util.List;

import javax.naming.ldap.InitialLdapContext;

import org.springframework.security.authentication.AbstractAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.GrantedAuthorityImpl;

/**
 * <p>
 * Authentication token to use when an app needs further access to the LDAP context used to
 * authenticate the user.
 * </p>
 * 
 * <p>
 * When this is the Authentication object stored in the Spring Security context, an application
 * can retrieve the current LDAP context thusly:
 * </p>
 * 
 * <pre>
 * LdapAuthenticationToken ldapAuth = (LdapAuthenticationToken) SecurityContextHolder
 *              .getContext().getAuthentication();
 * InitialLdapContext ldapContext = ldapAuth.getContext();
 * </pre>
 * 
 * @author Jason
 * 
 */
public class LdapAuthenticationToken extends AbstractAuthenticationToken {

		private static final long serialVersionUID = -5040340622950665401L;

        private Authentication auth;
        transient private InitialLdapContext context;
        private List<GrantedAuthority> authorities = new ArrayList<GrantedAuthority>();
        
        /**
         * Construct a new LdapAuthenticationToken, using an existing Authentication object and
         * granting all users a default authority.
         * 
         * @param auth
         * @param defaultAuthority
         */
        public LdapAuthenticationToken(Authentication auth, GrantedAuthority defaultAuthority) {
        		super(auth.getAuthorities());
        		this.auth = auth;
                if (auth.getAuthorities() != null) {
                        this.authorities.addAll(auth.getAuthorities());
                }
                if (defaultAuthority != null) {
                        this.authorities.add(defaultAuthority);
                }
                super.setAuthenticated(true);
                
        }
        
        /**
         * Construct a new LdapAuthenticationToken, using an existing Authentication object and
         * granting all users a default authority.
         * 
         * @param auth
         * @param defaultAuthority
         */
        public LdapAuthenticationToken(Authentication auth, String defaultAuthority) {
                this(auth, new GrantedAuthorityImpl(defaultAuthority));
        }

        public List<GrantedAuthority> getAuthorities() {
                return authorities;
        }

        public void addAuthority(GrantedAuthority authority) {
                this.authorities.add(authority);
        }

        public Object getCredentials() {
                return auth.getCredentials();
        }

        public Object getPrincipal() {
                return auth.getPrincipal();
        }

        /**
         * Retrieve the LDAP context attached to this user's authentication object.
         * 
         * @return the LDAP context
         */
        public InitialLdapContext getContext() {
                return context;
        }

        /**
         * Attach an LDAP context to this user's authentication object.
         * 
         * @param context
         *          the LDAP context
         */
        public void setContext(InitialLdapContext context) {
                this.context = context;
        }

}
