package br.com.karirirh.servlets;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * 
 * @author Alex Jr Arraes
 *
 */
@WebServlet("/MenuControlador")
public class MenuControlador extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public MenuControlador() {
		super();
	}

	protected void service(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

		String acao = request.getParameter("acao");

		if (acao != null && acao.equals("home")) {
			RequestDispatcher saida = request.getRequestDispatcher("home.jsp");
			saida.forward(request, response);
		} else if (acao != null && acao.equals("cabecalho")) {
			RequestDispatcher saida = request
					.getRequestDispatcher("Cabecalho.jsp");
			saida.forward(request, response);

		}else if (acao != null && acao.equals("mundo")) {
			RequestDispatcher saida = request
					.getRequestDispatcher("login/mundo.jsp");
			saida.forward(request, response);

		}
		
		

	}
}
