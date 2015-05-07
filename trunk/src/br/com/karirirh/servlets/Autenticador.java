package br.com.karirirh.servlets;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import br.com.karirirh.dao.UsuarioDAO;
import br.com.karirirh.entidades.Usuario;

@WebServlet("/Autenticador")
public class Autenticador extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public Autenticador() {
		super();
	}

	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		HttpSession sessao = request.getSession(false);
		if (sessao != null) {
			sessao.invalidate();
		}
		response.sendRedirect("login.jsp");
	}

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

		String sLogin = request.getParameter("login");
		String sSenha = request.getParameter("senha");
		HttpSession sessao = null;
		Usuario usu = new Usuario();
		UsuarioDAO usuDAO = new UsuarioDAO();

		usu = usuDAO.autenticador(sLogin, sSenha);

		if (usu == null) {
			response.sendRedirect("login.jsp");	
		} else if (usu.isAdmin()) {
			sessao = request.getSession();
			sessao.setAttribute("administrador", usu);
			//sessao.setMaxInactiveInterval(3000);

			request.getRequestDispatcher("EmpresaCadastro.jsp").forward(
					request, response);
		} else {
			sessao = request.getSession();
			sessao.setAttribute("usuario", usu);
			sessao.setMaxInactiveInterval(3000);
			request.getRequestDispatcher("home.jsp").forward(request,
					response);
		}
		
		String acao = request.getParameter("acao");
		if(acao != null && acao.equals("sair")){
			sessao.invalidate();  
			response.sendRedirect("login.jsp");
		}

	}

}
