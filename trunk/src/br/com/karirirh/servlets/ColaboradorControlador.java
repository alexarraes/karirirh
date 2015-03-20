package br.com.karirirh.servlets;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import br.com.karirirh.dao.CargoDAO;
import br.com.karirirh.dao.ColaboradorDAO;
import br.com.karirirh.dao.DependenteDAO;
import br.com.karirirh.dao.SetorDAO;
import br.com.karirirh.dao.TelefoneDAO;
import br.com.karirirh.entidades.Cargo;
import br.com.karirirh.entidades.Colaborador;
import br.com.karirirh.entidades.Dependente;
import br.com.karirirh.entidades.Empresa;
import br.com.karirirh.entidades.Setor;
import br.com.karirirh.entidades.Telefone;
import br.com.karirirh.entidades.Usuario;

/**
 * 
 * @author Alex Jr Arraes
 *
 */
@WebServlet("/ColaboradorControlador")
public class ColaboradorControlador extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public ColaboradorControlador() {
		super();
	}

	protected void service(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

		Usuario usuario = (Usuario) request.getSession()
				.getAttribute("usuario");
		Empresa empresa = usuario.getEmpresa();
		Colaborador col = new Colaborador();
		ColaboradorDAO colDAO = new ColaboradorDAO();
		Dependente dep = new Dependente();
		DependenteDAO depDAO = new DependenteDAO();
		Telefone tel = new Telefone();
		TelefoneDAO telDAO = new TelefoneDAO();

		Cargo cargo = new Cargo();
		CargoDAO cargoDAO = new CargoDAO();
		Setor setor = new Setor();
		SetorDAO setorDAO = new SetorDAO();

		String acao = request.getParameter("acao");

		if (acao != null && acao.equals("salvar")) {
			String nomeCompleto = request.getParameter("nomeCompleto");
			String estCivil = request.getParameter("estCivil");
			Date dataNascimento =(new SimpleDateFormat(request.getParameter("dataNasc"))).format(new Date());
			String sexo = request.getParameter("sexo");
			int rg = Integer.parseInt(request.getParameter("rg"));
			String cpf = request.getParameter("cpf");
			String rua = request.getParameter("rua");
			int numero = Integer.parseInt(request.getParameter("numero"));
			String complemento = request.getParameter("complemento");
			String bairro = request.getParameter("bairro");
			String cidade = request.getParameter("cidade");
			String estado = request.getParameter("estado");
			String cep = request.getParameter("cep");
			String email = request.getParameter("email");
			String celular = request.getParameter("celular");
			String fixo = request.getParameter("fixo");
			int matricula;
			String ctps = request.getParameter("ctps");
			String pis = request.getParameter("pis");
			String tipoContrato = request.getParameter("tipoContrato");
			int car = Integer.parseInt(request.getParameter("cargo"));
			double salario = Double
					.parseDouble(request.getParameter("salario"));
			String escolaridade = request.getParameter("escolaridade");
			boolean status = true;
			// Dependentes
			int qtdItens = 5;
			String nome[] = new String[qtdItens];
			int aux = 1;
			for (int i = 0; i < qtdItens; i++) {
				nome[i] = "nome" + aux;
				aux++;
			}
			for (int i = 0; i < nome.length; i++) {
				nome[i] = request.getParameter(nome[i]);
			}
			for (int i = 0; i < nome.length; i++) {
				if (nome[i] == null) {
					System.out.println("Vazio");
				} else {
					System.out.println(" " + nome[i]);
				}

			}

			
			col.setNome(nomeCompleto);
			col.setEstadoCivil(estCivil);
			col.setSexo(sexo);
			col.setRg(rg);
			col.setCpf(cpf);
			col.setRua(rua);
			col.setNumero(numero);
			col.setComplemento(complemento);
			col.setBairro(bairro);
			col.setCidade(cidade);
			col.setUf(estado);
			col.setCep(cep);
			col.setEmail(email);
			col.setCtps(ctps);
			col.setPis(pis);
			col.setContrato(tipoContrato);
			col.setSalarioAtual(salario);//Obs.:
			col.setEscolaridade(escolaridade);
			col.setStatus(status);
			cargo = cargoDAO.pesquisarId(car).get(0);
			col.setCargo(cargo);
			col.setEmpresa(empresa);
			
			
		}
	}

}
