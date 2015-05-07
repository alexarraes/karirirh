package br.com.karirirh.servlets;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import br.com.karirirh.dao.EmpresaDAO;
import br.com.karirirh.dao.UsuarioDAO;
import br.com.karirirh.entidades.Empresa;
import br.com.karirirh.entidades.Usuario;
import br.com.karirirh.relatorios.RelatorioBean;

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
		Empresa emp = new Empresa();
		Usuario usu = new Usuario();
		EmpresaDAO empDAO = new EmpresaDAO();
		UsuarioDAO usuDAO = new UsuarioDAO();
		
		Usuario usuario = (Usuario) request.getSession().getAttribute("usuario");
		Empresa empresa = usuario.getEmpresa();
		
		String acao = request.getParameter("acao");

		if (acao != null && acao.equals("home")) {
			//RelatorioBean rB = new RelatorioBean();
			//rB.getArquivoRetorno(usuario);
			
			RequestDispatcher saida = request.getRequestDispatcher("home.jsp");
			saida.forward(request, response);
		}else if (acao != null && acao.equals("config")) {
			request.setAttribute("usuario", usuario);
			request.setAttribute("empresa", empresa);
			RequestDispatcher saida = request.getRequestDispatcher("ConfigDados.jsp");
			saida.forward(request, response);
		}else if (acao != null && acao.equals("alterar")) {
			
			int id = Integer.parseInt(request.getParameter("idEmpresa"));
			emp = empDAO.pesquisarId(id).get(0);
			String login = request.getParameter("login");
			usu = usuDAO.pesquisarEq("login", login).get(0);
			
			emp.setRazaoSociao(request.getParameter("razaoSocial"));
			emp.setEnderecoCompleto(request.getParameter("enderecoCompleto"));
			emp.setFone(request.getParameter("fone"));
			emp.setCnpj(request.getParameter("cnpj"));
			empDAO.editar(emp);
			
			usu.setSenha(request.getParameter("senha"));
			usuDAO.editar(usu);
			
			request.setAttribute("usuario", usu);
			request.setAttribute("empresa", emp);
			request.setAttribute("msg", "<h3>Dados Alterados!</h3>");
			RequestDispatcher saida = request.getRequestDispatcher("ConfigDados.jsp");
			saida.forward(request, response);
		}else if (acao != null && acao.equals("DownRelat")){
			 request.getRequestDispatcher("Relatorios.jsp").forward(request, response);
			
		}else if (acao != null && acao.equals("Sobre")){
			 request.getRequestDispatcher("Sobre.jsp").forward(request, response);
				
		}
		
		
		
		

	}
}
