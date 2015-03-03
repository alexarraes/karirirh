/*filterName="UsuarioFiltro", urlPatterns = {"/UsuarioRodape.jsp",
"UsuarioAlterar.jsp", "UsuarioBuscar.jsp", "UsuarioCabecalho.jsp", "UsuarioCadastro.jsp",
"UsuarioLista.jsp"}*/
/*
package br.com.karirirh.servlets;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebFilter("/*")
public class UsuarioFiltro implements Filter {

    public UsuarioFiltro() {
        
    }

	public void destroy() {
	}


	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		HttpServletRequest httpServletRequest = (HttpServletRequest) request;
		
		String url = httpServletRequest .getRequestURI();
		
		HttpSession sessao = httpServletRequest .getSession();
		
		if (sessao.getAttribute("adminAutenticado")!=null || url.lastIndexOf("UsuarioADMLogar.jsp")>-1 ||
		url.lastIndexOf("ADMAutenticador") >-1 ){
		chain.doFilter(request, response); 
		
		}else{
			//chain.doFilter(request, response);
		((HttpServletResponse) response).sendRedirect("UsuarioADMLogar.jsp");
		}
	}

	public void init(FilterConfig fConfig) throws ServletException {
	}

} */
