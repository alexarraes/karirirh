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
import br.com.karirirh.dao.HistoricoAfastamentoDAO;
import br.com.karirirh.entidades.Cargo;
import br.com.karirirh.entidades.Colaborador;
import br.com.karirirh.entidades.Dependente;
import br.com.karirirh.entidades.Empresa;
import br.com.karirirh.entidades.HistoricoAfastamento;
import br.com.karirirh.entidades.Telefone;
import br.com.karirirh.entidades.Usuario;
import br.com.karirirh.teste.Data;

/**
 * 
 * @author Alex Jr Arraes
 *
 */
@WebServlet("/AfastamentoControlador")
public class AfastamentoControlador extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public AfastamentoControlador() {
		super();

	}

	protected void service(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		Data dt = new Data();
		Usuario usuario = (Usuario) request.getSession()
				.getAttribute("usuario");
		Empresa empresa = usuario.getEmpresa();
		Colaborador col = new Colaborador();
		ColaboradorDAO colDAO = new ColaboradorDAO();
		HistoricoAfastamento hA = new HistoricoAfastamento();
		HistoricoAfastamentoDAO hADAO = new HistoricoAfastamentoDAO();

		String acao = request.getParameter("acao");

		if (acao != null && acao.equals("menuAfastamento")) {
			List<Colaborador> colaboradores = colDAO.pesquisarEq("empresa",
					empresa);
			request.setAttribute("lista", colaboradores);
			RequestDispatcher saida = request
					.getRequestDispatcher("AfastamentoListar.jsp");
			saida.forward(request, response);
		} else if (acao != null && acao.equals("btnAfastar")) {
			int id = Integer.parseInt(request.getParameter("id"));
			col = colDAO.pesquisarId(id).get(0);
			request.setAttribute("col", col);
			request.getRequestDispatcher("AfastamentoCadastro.jsp").forward(
					request, response);
		} else if (acao != null && acao.equals("Salvar")) {
			int matricula = Integer.parseInt(request.getParameter("matricula"));
			col = colDAO.pesquisarEq("matricula", matricula).get(0);
			if (hADAO.emAfastamento(col) != null) {
				JOptionPane.showMessageDialog(null, "Nao cadastrado");
				request.setAttribute("msg", "Não Afastado, o Colaborador já se encotra Afastado!");
				request.setAttribute("col", col);
				request.getRequestDispatcher("AfastamentoCadastro.jsp")
						.forward(request, response);
				
			} else {
				hA.setCodDoenca(Integer.parseInt(request.getParameter("cod")));
				try {
					hA.setDataInicio(dt.formataData(request
							.getParameter("dataInicial")));
					hA.setDataFim(dt.formataData(request
							.getParameter("dataFinal")));
				} catch (Exception e) {
					e.printStackTrace();
				}
				hA.setTipo(request.getParameter("obs"));
				hA.setColaborador(col);
				hADAO.salvar(hA);
				JOptionPane.showMessageDialog(null, " cadastrado");
				request.setAttribute("msg", "Afastado com Sucesso!");
				request.setAttribute("col", col);
				request.getRequestDispatcher("AfastamentoCadastro.jsp")
						.forward(request, response);
			}

		}

	}

}
