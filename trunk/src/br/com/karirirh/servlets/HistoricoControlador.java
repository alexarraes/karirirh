package br.com.karirirh.servlets;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.JOptionPane;

import br.com.karirirh.dao.ColaboradorDAO;
import br.com.karirirh.entidades.Colaborador;
import br.com.karirirh.entidades.Empresa;
import br.com.karirirh.entidades.Usuario;

/**
 * 
 * @author Alex Jr Arraes
 *
 */
@WebServlet("/HistoricoControlador")
public class HistoricoControlador extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public HistoricoControlador() {
		super();
	}

	protected void service(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

		Usuario usuario = (Usuario) request.getSession()
				.getAttribute("usuario");
		Empresa empresa = usuario.getEmpresa();
		ColaboradorDAO colDAO = new ColaboradorDAO();
		String acao = request.getParameter("acao");

		if (acao != null && acao.equals("menuHistorico")) {
			List<Colaborador> colaboradores = colDAO.pesquisarEq("empresa",
					empresa);
			request.setAttribute("lista", colaboradores);
			RequestDispatcher saida = request
					.getRequestDispatcher("HistoricoListar.jsp");
			saida.forward(request, response);
		}else if (acao != null && acao.equals("Consultar")) {
			int id = Integer.parseInt(request.getParameter("id"));
			JOptionPane.showMessageDialog(null, "Entrou");
		}
	}

}
