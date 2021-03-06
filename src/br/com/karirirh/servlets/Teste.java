package br.com.karirirh.servlets;

import java.io.IOException;
import java.util.Collection;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import br.com.karirirh.entidades.Dependente;

/**
 * Servlet implementation class Teste
 */
@WebServlet("/Teste")
public class Teste extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public Teste() {
		super();
		// TODO Auto-generated constructor stub
	}

	protected void service(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

		Dependente dep = new Dependente();

		String acao = request.getParameter("acao");

		if (acao != null && acao.equals("login")) {
			 request.getRequestDispatcher("login.jsp").forward(request, response);

		}

	}

}
