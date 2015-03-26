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
import br.com.karirirh.dao.MedidaDisciplinarDAO;
import br.com.karirirh.entidades.Colaborador;
import br.com.karirirh.entidades.Empresa;
import br.com.karirirh.entidades.MedidaDisciplinar;
import br.com.karirirh.entidades.Usuario;
import br.com.karirirh.teste.Data;

/**
 * 
 * @author Alex Jr Arraes
 *
 */
@WebServlet("/MDControlador")
public class MDControlador extends HttpServlet {
	private static final long serialVersionUID = 1L;
  
    public MDControlador() {
        super();
        
    }

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		SimpleDateFormat fmt = new SimpleDateFormat("dd/MM/yyyy");      
		//Date data = fmt.parse("17/12/2007 19:30:20"); 
		Data dt = new Data();
		int ano = Integer.parseInt((new SimpleDateFormat("yyyy"))
				.format(new Date()));

		Usuario usuario = (Usuario) request.getSession().getAttribute(
				"usuario");
		Empresa empresa = usuario.getEmpresa();
		
		MedidaDisciplinar mD = new MedidaDisciplinar();
		MedidaDisciplinarDAO mDDAO = new MedidaDisciplinarDAO();
		Colaborador col = new Colaborador();
		ColaboradorDAO colDAO = new ColaboradorDAO();
		
		String acao = request.getParameter("acao");
		
		if(acao != null && acao.equals("menuListar")){
				List<Colaborador> colaboradores = colDAO.pesquisarEq("empresa",
						empresa);
				request.setAttribute("lista", colaboradores);
				RequestDispatcher saida = request
						.getRequestDispatcher("mDListar.jsp");
				saida.forward(request, response);

			
		}else if (acao != null && acao.equals("mDAdd")) {
			int id = Integer.parseInt(request.getParameter("id"));
			col = colDAO.pesquisarId(id).get(0);
			mD.setColaborador(col);
			//mD.setData(dt);
			mD.setMotivo(request.getParameter("motivo"));
			mD.setTipo(request.getParameter("tipo"));
			mDDAO.salvar(mD);
	
			request.setAttribute("col", col);
			request.setAttribute("msg", "Medida Disciplinar - Cadastrada com Sucesso!");
			RequestDispatcher saida = request
					.getRequestDispatcher("mDAdd.jsp");
			saida.forward(request, response);	
		}else if (acao != null && acao.equals("mDBtn")) {
			int id = Integer.parseInt(request.getParameter("id"));
			col = colDAO.pesquisarId(id).get(0);
	
			request.setAttribute("col", col);
			RequestDispatcher saida = request
					.getRequestDispatcher("mDAdd.jsp");
			saida.forward(request, response);	
		}
		
	}

}
