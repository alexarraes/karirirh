package br.com.karirirh.relatorios;

public class UtilException extends Exception {

	
	    public UtilException() {
	        // default
	    }

	    public UtilException(String message) {
	        super(message);
	    }

	    public UtilException(Throwable cause) {
	        super(cause);
	    }

	    public UtilException(String message, Throwable cause) {
	        super(message, cause);
	    }
	
}
