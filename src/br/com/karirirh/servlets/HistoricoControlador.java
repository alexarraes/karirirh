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
import br.com.karirirh.dao.DependenteDAO;
import br.com.karirirh.dao.FeriasDAO;
import br.com.karirirh.dao.HistoricoAfastamentoDAO;
import br.com.karirirh.dao.HistoricoSalarioDAO;
import br.com.karirirh.dao.HistoricoSetorDAO;
import br.com.karirirh.dao.MedidaDisciplinarDAO;
import br.com.karirirh.dao.TelefoneDAO;
import br.com.karirirh.entidades.Colaborador;
import br.com.karirirh.entidades.Dependente;
import br.com.karirirh.entidades.Empresa;
import br.com.karirirh.entidades.Ferias;
import br.com.karirirh.entidades.HistoricoAfastamento;
import br.com.karirirh.entidades.HistoricoSalario;
import br.com.karirirh.entidades.HistoricoSetor;
import br.com.karirirh.entidades.MedidaDisciplinar;
import br.com.karirirh.entidades.Telefone;
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
		DependenteDAO depDAO = new DependenteDAO();
		TelefoneDAO telDAO = new TelefoneDAO();
		HistoricoSalarioDAO hSalarioDAO = new HistoricoSalarioDAO();
		HistoricoSetorDAO hSetorDAO = new HistoricoSetorDAO();
		FeriasDAO feriasDAO = new FeriasDAO();
		HistoricoAfastamentoDAO hAfastamentoDAO = new HistoricoAfastamentoDAO();
		MedidaDisciplinarDAO mDDAO = new MedidaDisciplinarDAO();
		String acao = request.getParameter("acao");

		if (acao != null && acao.equals("menuHistorico")) {
			List<Colaborador> colaboradores = colDAO.pesquisarEq("empresa",
					empresa);
			request.setAttribute("lista", colaboradores);
			RequestDispatcher saida = request
					.getRequestDispatcher("HistoricoListar.jsp");
			saida.forward(request, response);
		} else if (acao != null && acao.equals("Consultar")) {
			Colaborador col = new Colaborador();
			
			int id = Integer.parseInt(request.getParameter("id"));
			col = colDAO.pesquisarId(id).get(0);
			List<Telefone> tels = telDAO.pesquisarEq("colaborador", col);
			List<Dependente> deps = depDAO.pesquisarEq("colaborador", col);
			List<HistoricoSalario> hSalarios = hSalarioDAO.pesquisarEq("colaborador", col);
			List<HistoricoSetor> hSetores = hSetorDAO.pesquisarEq("colaborador", col);
			List<Ferias> ferias = feriasDAO.pesquisarEq("colaborador", col);
			List<HistoricoAfastamento> hAfastamento = hAfastamentoDAO.pesquisarEq("colaborador", col);
			List<MedidaDisciplinar> mD = mDDAO.pesquisarEq("colaborador", col);
			
			//JOptionPane.showMessageDialog(null, "Entrou");
			request.setAttribute("mD", mD);
			request.setAttribute("hAfastamento", hAfastamento);
			request.setAttribute("ferias",  ferias);
			request.setAttribute("hSetor", hSetores);
			request.setAttribute("hSalarios", hSalarios);
			request.setAttribute("dependente", deps);
			request.setAttribute("colaborador", col);
			request.setAttribute("empresa", empresa);
			request.setAttribute("telefone", tels);
			RequestDispatcher saida = request
					.getRequestDispatcher("Historico.jsp");
			saida.forward(request, response);
		}
	}

}
