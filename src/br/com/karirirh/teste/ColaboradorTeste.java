package br.com.karirirh.teste;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.persistence.criteria.CriteriaBuilder.In;

import br.com.karirirh.dao.CargoDAO;
import br.com.karirirh.dao.ColaboradorDAO;
import br.com.karirirh.dao.EmpresaDAO;
import br.com.karirirh.entidades.Cargo;
import br.com.karirirh.entidades.Colaborador;
import br.com.karirirh.entidades.Empresa;

public class ColaboradorTeste implements Teste {
	Colaborador col = new Colaborador();
	ColaboradorDAO colDAO = new ColaboradorDAO();
	
	Cargo cargo = new Cargo();
	CargoDAO cargoDAO = new CargoDAO();
	
	Empresa usu = new Empresa();
	EmpresaDAO usuDAO = new EmpresaDAO();
	 DateFormat formatter = new SimpleDateFormat("dd/MM/yyyy");  
	
	public void cadastrar() {
		//col.setId();
		col.setBairro("Aldeota");
		col.setCep("63300000");
		col.setCidade("Barbalha");
		col.setComplemento("Próximo a matriz");
		col.setCpf("000.000.000-00");
		col.setCtps("111111");
		col.setCurso("Informatica");
		col.setDataAdm(new Date());
		try {
			//col.setDataDem((java.util.Date)formatter.parse("20/02/2015"));
			col.setDataNascimento((java.util.Date)formatter.parse("31/01/1991"));
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		col.setEmail("exemplo@leao.com");
		col.setEscolaridade("Superior incompleto");
		col.setEstadoCivil("Casao");
		col.setMatricula(Integer.parseInt("2012341"));
		col.setNome("Frederico");
		col.setNumero(Integer.parseInt("200"));
		col.setPis("999999");
		col.setRg(Integer.parseInt("888888888"));
		col.setRua("Rua Pedro Basilio");
		col.setSalarioAtual(Double.parseDouble("800.00"));
		col.setSexo("Masculino");
		col.setStatus(true);
		cargo = (Cargo)cargoDAO.pesquisarId(1).get(0);
		col.setCargo(cargo);
		usu= (Empresa)usuDAO.pesquisarId(1).get(0);
		col.setUsuario(usu);
		
		colDAO.salvar(col);
	
	}

	@Override
	public Object buscar(String campo, String valor){
		
				col = (Colaborador)colDAO.pesquisarEq(campo, valor);
			System.out.println(
				col.getId() +" "+
				col.getBairro()+" "+
				col.getCep()+" "+
				col.getCidade()+" "+
				col.getComplemento()+" "+
				col.getCpf()+" "+
				col.getCtps()+" "+
				col.getCurso()+" "+
				col.getDataAdm()+" "+
				col.getDataDem()+" "+
				col.getDataNascimento()+" "+
				col.getEmail()+" "+
				col.getEscolaridade()+" "+
				col.getEstadoCivil()+" "+
				col.getMatricula()+" "+
				col.getNome()+" "+
				col.getNumero()+" "+
				col.getPis()+" "+
				col.getRg()+" "+
				col.getRua()+" "+
				col.getSalarioAtual()+" "+
				col.getSexo()+" "+
				col.isStatus()+" "+
				col.getCargo().getNome()+" "+
				col.getCargo().getId()+" "+
				col.getCargo().getSalario()+" "+
				col.getCargo().getSetor().getNome()+" "+
				col.getUsuario().getRazaoSociao()
		
					);
		
		return col;
	}

	@Override
	public void excluir(int id) {
		col = (Colaborador) colDAO.pesquisarId(id).get(0);
		colDAO.excluir(col);
		System.out.println("Excluido!");
	}

	@Override
	public void alterar(int id) {
	col = (Colaborador)colDAO.pesquisarId(id).get(0);
	
	col.setBairro("Centro");
	col.setCep("63260000");
	col.setCidade("Jati");
	col.setComplemento("Próximo ao Logos");
	col.setCpf("000.000.000-00");
	col.setCtps("111111");
	col.setCurso("Analista");
	col.setDataAdm(new Date());
	try {
		col.setDataDem((java.util.Date)formatter.parse("20/02/2015"));
		col.setDataNascimento((java.util.Date)formatter.parse("31/01/1991"));
	} catch (ParseException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	col.setEmail("exemplo@leao.com");
	col.setEscolaridade("Superior Completo");
	col.setEstadoCivil("Solteiro");
	col.setMatricula(Integer.parseInt("2012201200"));
	col.setNome("Alex Arraes");
	col.setNumero(Integer.parseInt("156"));
	col.setPis("999999");
	col.setRg(Integer.parseInt("888888888"));
	col.setRua("Rua Santa Terezinha	");
	col.setSalarioAtual(Double.parseDouble("798.00"));
	col.setSexo("Masculino");
	col.setStatus(true);
	cargo = (Cargo)cargoDAO.pesquisarId(2).get(0);
	col.setCargo(cargo);
	usu= (Empresa)usuDAO.pesquisarId(1).get(0);
	col.setUsuario(usu);
	
	colDAO.editar(col);
	
	}

	@Override
	public void lista() {
		List<Colaborador> c = colDAO.listar();
		for(Colaborador col: c){
			System.out.println(
					col.getId() +" "+
					col.getBairro()+" "+
					col.getCep()+" "+
					col.getCidade()+" "+
					col.getComplemento()+" "+
					col.getCpf()+" "+
					col.getCtps()+" "+
					col.getCurso()+" "+
					col.getDataAdm()+" "+
					col.getDataDem()+" "+
					col.getDataNascimento()+" "+
					col.getEmail()+" "+
					col.getEscolaridade()+" "+
					col.getEstadoCivil()+" "+
					col.getMatricula()+" "+
					col.getNome()+" "+
					col.getNumero()+" "+
					col.getPis()+" "+
					col.getRg()+" "+
					col.getRua()+" "+
					col.getSalarioAtual()+" "+
					col.getSexo()+" "+
					col.isStatus()+" "+
					col.getCargo().getNome()+" "+
					col.getCargo().getId()+" "+
					col.getCargo().getSalario()+" "+
					col.getCargo().getSetor().getNome()+" "+
					col.getUsuario().getRazaoSociao()
			
						);
		}
	
	}

	public static void main(String[] args) {
		ColaboradorTeste ct = new ColaboradorTeste();
		//ct.cadastrar();
		ct.alterar(2);
		
	}

}
