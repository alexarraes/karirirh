package br.com.karirirh.servlets;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import br.com.karirirh.dao.CargoDAO;
import br.com.karirirh.dao.SetorDAO;
import br.com.karirirh.entidades.Cargo;
import br.com.karirirh.entidades.Setor;
import br.com.karirirh.entidades.Cargo;


@WebServlet("/CargoControlador")
public class CargoControlador extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
    public CargoControlador() {
        super();
    }


	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Cargo cargo = new Cargo();
		CargoDAO cargoDAO = new CargoDAO();
		
		Setor setor = new Setor();
		SetorDAO setorDAO = new SetorDAO();
		
		String acao = request.getParameter("acao");
		
		if (acao != null && acao.equals("salvar")) {
			//If verifica se já existe setor com esse nome
			String nome = request.getParameter("nome");
			if(cargoDAO.buscarNomeEspecifico(nome) == null){
				cargo.setNome(nome);
				cargo.setSalario(Double.parseDouble(request.getParameter("salario")));
				cargo.setDescricao(request.getParameter("descricao"));
				cargo.setSetor(setorDAO.buscarNomeEspecifico(request.getParameter("setor")));
				
				cargoDAO.salvar(cargo);
				String msg= "Cargo "+nome+" cadastrado com sucesso!";
				request.setAttribute("msg", msg);
				RequestDispatcher saida = request
						.getRequestDispatcher("CargoCadastro.jsp");
				saida.forward(request, response);
			}else
				response.sendRedirect("CarNaoCadastrado.jsp");
	
		} else if (acao != null && acao.equals("excluir")) {
			cargo = cargoDAO.pesquisarCodigo(Integer.parseInt(request.getParameter("id")));
			cargoDAO.excluir(cargo);
			response.sendRedirect("CargoControlador?acao=lista");

		}else if (acao != null && acao.equals("alterarCadastro")) {
			cargo = cargoDAO.pesquisarCodigo(Integer.parseInt(request
					.getParameter("id")));
			
			setor = setorDAO.pesquisarCodigo((Integer.parseInt(request
					.getParameter("idSetor"))));
			
			cargo.setNome(request.getParameter("nome"));
			cargo.setSalario(Double.parseDouble(request.getParameter("salario")));
			cargo.setDescricao(request.getParameter("descricao"));
			cargo.setSetor(setor);
			
			cargoDAO.editar(cargo);
			
			request.setAttribute("cargo", cargo);
			request.getRequestDispatcher("CargoAlterar.jsp").forward(request,
					response);
		}else if (acao != null && acao.equals("alterar")) {
			cargo = cargoDAO.pesquisarCodigo(Integer.parseInt(request
					.getParameter("id")));
			request.setAttribute("cargo", cargo);
			request.getRequestDispatcher("CargoAlterar.jsp").forward(request,
					response);

		}else if (acao != null && acao.equals("buscar")) {
			List<Cargo> lista = cargoDAO.buscaNome(request
					.getParameter("nome"));
			request.setAttribute("lista", lista);
			RequestDispatcher saida = request
					.getRequestDispatcher("CargoLista.jsp");
			saida.forward(request, response);
		}
	}

}
