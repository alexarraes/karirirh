package br.com.karirirh.teste;

import java.util.List;

import br.com.karirirh.dao.ColaboradorDAO;
import br.com.karirirh.dao.TelefoneDAO;
import br.com.karirirh.dao.EmpresaDAO;
import br.com.karirirh.entidades.Colaborador;
import br.com.karirirh.entidades.Telefone;
import br.com.karirirh.entidades.Empresa;

public class TelefoneTeste implements Teste {
	Telefone tel = new Telefone();
	TelefoneDAO telDAO = new TelefoneDAO();
	
	Colaborador col = new Colaborador();
	ColaboradorDAO colDAO = new ColaboradorDAO();
	
	Empresa usu = new Empresa();
	EmpresaDAO usuDAO = new EmpresaDAO();
	
	@Override
	public void cadastrar() {
		tel.setFone("9999");
		tel.setTipo("Celular");
		col = colDAO.pesquisarId(1).get(0);
		tel.setColaborador(col);
		
	}

	@Override
	public Object buscar(String campo, String valor) {
		tel = telDAO.pesquisarEq(campo, valor).get(0);
		
		System.out.println(tel.getId()+" "+tel.getFone()+" "+tel.getTipo()+" "+tel.getColaborador().getNome()
			);
		
		
		return tel;
	}

	@Override
	public void excluir(int id) {
		tel =telDAO.pesquisarId(id).get(0);
		telDAO.excluir(tel);
		System.out.println("Excluido!");
	}

	@Override
	public void alterar(int id) {
		tel =telDAO.pesquisarId(id).get(0);
		tel.setFone("9999");
		tel.setTipo("Celular");
		telDAO.editar(tel);
		System.out.println("Atualizado");
	}

	@Override
	public void lista() {
		List<Telefone> t =telDAO.listar();
		for(Telefone tel: t){
			System.out.println(tel.getId()+" "+tel.getFone()+" "+tel.getTipo()+" "+tel.getColaborador().getNome()
					);
		}
	}

	public static void main(String[] args) {
		
	}
}
