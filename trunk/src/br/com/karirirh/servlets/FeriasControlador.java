package br.com.karirirh.servlets;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import br.com.karirirh.dao.ColaboradorDAO;
import br.com.karirirh.dao.FeriasDAO;
import br.com.karirirh.entidades.Colaborador;
import br.com.karirirh.entidades.Empresa;
import br.com.karirirh.entidades.Ferias;
import br.com.karirirh.entidades.Usuario;
import br.com.karirirh.teste.Data;

/**
 * 
 * @author Alex Jr Arraes
 *
 */
@WebServlet("/FeriasControlador")
public class FeriasControlador extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public FeriasControlador() {
		super();
	}

	protected void service(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		SimpleDateFormat fmt = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");
		Data dt = new Data();

		Usuario usuario = (Usuario) request.getSession()
				.getAttribute("usuario");
		Empresa empresa = usuario.getEmpresa();
		Ferias fr = new Ferias();
		FeriasDAO frDAO = new FeriasDAO();

		Colaborador col = new Colaborador();
		ColaboradorDAO colDAO = new ColaboradorDAO();
		String acao = request.getParameter("acao");

		if (acao != null && acao.equals("menuFerias")) {
			List<Colaborador> colaboradores = colDAO.listaAtivos(empresa);
			request.setAttribute("lista", colaboradores);
			RequestDispatcher saida = request
					.getRequestDispatcher("FeriasListar.jsp");
			saida.forward(request, response);
		} else if (acao != null && acao.equals("menuEmFerias")) {
			List<Ferias> ferias = frDAO.ListaEmFerias(empresa, new Date());
			request.setAttribute("lista", ferias);
			RequestDispatcher saida = request
					.getRequestDispatcher("FeriasEm.jsp");
			saida.forward(request, response);

		}  else if (acao != null && acao.equals("menuCadastradas")) {
			List<Ferias> ferias = frDAO.ListarFerias(empresa);
			request.setAttribute("lista", ferias);
			RequestDispatcher saida = request
					.getRequestDispatcher("FeriasCadastradas.jsp");
			saida.forward(request, response);

		} else if (acao != null && acao.equals("salvar")) {
			try {
				int matricula = Integer.parseInt(request
						.getParameter("matricula"));
				col = colDAO.pesquisarEq("matricula", matricula).get(0);
				if(frDAO.emFerias(col) != null){
					List<Colaborador> colaboradores = colDAO.pesquisarEq("empresa",
							empresa);
					request.setAttribute("msg", "Férias NÃO CADASTRADA. O Colaborador já encontra-se em Férias!");
					request.setAttribute("lista", colaboradores);
					RequestDispatcher saida = request
							.getRequestDispatcher("FeriasListar.jsp");
					saida.forward(request, response);
				}else{
					fr.setDataInicio(dt.formataData(request
							.getParameter("dataInicial")));
					fr.setDataFim(dt.formataData(request.getParameter("dataFinal")));
					fr.setColaborador(col);
					frDAO.salvar(fr);
					response.sendRedirect("FeriasControlador?acao=menuCadastradas");
				}
			} catch (Exception e) {
				e.printStackTrace();
			}

		}
	}

}
