package br.com.andebem.exception;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.StringWriter;
import java.io.Writer;

import org.apache.log4j.Logger;

public class FlexMessageException extends RuntimeException {

	static Logger log = Logger.getLogger(FlexMessageException.class);
	
	private static final long serialVersionUID = -1936506001935487886L;
	
	private String stackTraceMessage;

	public FlexMessageException() {}

	public FlexMessageException(String message, Throwable cause) {
		super(message, cause);
		serializeStackTrace(cause);
	}

	public FlexMessageException(String message) {
		super(message);
		serializeStackTrace(this);
	}

	public FlexMessageException(Throwable cause) {
		super(cause.getMessage(), cause);
		serializeStackTrace(cause);
	}
	
	/**
	 * @return the stackTraceMessage
	 */
	public String getStackTraceMessage() {
		return stackTraceMessage;
	}

	/**
	 * @param stackTraceMessage the stackTraceMessage to set
	 */
	public void setStackTraceMessage(String stackTraceMessage) {
		this.stackTraceMessage = stackTraceMessage;
	}
	
	/**
	 * serializing the stacktrace on a strackTraceMessage attribute
	 * 
	 * @param cause Throwable cause
	 * @throws IOException 
	 */
	private void serializeStackTrace(Throwable cause)
	{
		Writer w = new StringWriter();
		PrintWriter pw = new PrintWriter(w);
		cause.printStackTrace(pw);
		
	    setStackTraceMessage(w.toString());
	    pw.close();
	    try
		{
			w.close();
		} catch (IOException e)
		{
			log.error("Error on serializing the stackTrace", e);
		}
	}

}
