package br.com.andebem.exception;

import org.springframework.flex.core.ExceptionTranslator;

import flex.messaging.MessageException;

public class FlexExceptionTranslator implements ExceptionTranslator {

	@Override
	public boolean handles(Class<?> klass) {
		return Boolean.TRUE;
	}

	@Override
	public MessageException translate(Throwable t) {
		MessageException messageException = new MessageException();
		FlexMessageException flexException = new FlexMessageException(t);
		messageException.setMessage(t.getMessage());
		messageException.setRootCause(flexException);
		return messageException;
	}

}
