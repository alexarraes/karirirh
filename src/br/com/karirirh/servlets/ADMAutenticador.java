package br.com.karirirh.servlets;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import br.com.karirirh.dao.AdminDAO;
import br.com.karirirh.dao.UsuarioDAO;
import br.com.karirirh.entidades.Admin;
import br.com.karirirh.entidades.Usuario;

@WebServlet("/ADMAutenticador")
public class ADMAutenticador extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public ADMAutenticador() {
		super();

	}

	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		HttpSession sessao = request.getSession(false);
		if (sessao != null) {
			sessao.invalidate();
		}
		response.sendRedirect("UsuarioADMLogar.jsp");
	}

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

		String sLogin = request.getParameter("login");
		String sSenha = request.getParameter("senha");

		AdminDAO adminDAO = new AdminDAO();
		Admin adminAutenticado = adminDAO.autenticador(sLogin, sSenha);
		
		if (adminAutenticado != null) {
			HttpSession sessao = request.getSession();
			sessao.setAttribute("adminAutenticado", adminAutenticado);
			sessao.setMaxInactiveInterval(3000);

			request.getRequestDispatcher("UsuarioCadastro.jsp").forward(
					request, response);
		} else {
			request.getSession().setAttribute("msg", "Dados Incorretos!");
			response.sendRedirect("erroLogin.jsp");
		}
	}

}
