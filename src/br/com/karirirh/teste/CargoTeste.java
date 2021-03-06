package br.com.karirirh.teste;

import java.util.List;

import br.com.karirirh.dao.CargoDAO;
import br.com.karirirh.dao.EmpresaDAO;
import br.com.karirirh.dao.SetorDAO;
import br.com.karirirh.entidades.Cargo;
import br.com.karirirh.entidades.Empresa;
import br.com.karirirh.entidades.Setor;

public class CargoTeste implements Teste {

	Cargo cargo = new Cargo();
	CargoDAO cargoDAO = new CargoDAO();

	Setor setor = new Setor();
	SetorDAO setorDAO = new SetorDAO();

	@Override
	public void cadastrar() {
		// cargo.setId();
		cargo.setNome("Analista");
		cargo.setSalario(Double.parseDouble("100.00"));
		cargo.setDescricao("Analisa");
		setor =(Setor) setorDAO.pesquisarId(1).get(0);
		cargo.setSetor(setor);

		cargoDAO.salvar(cargo);
		System.out.println("Cargo Salvo");
	}

	@Override
	public Object buscar(String campo, String valor) {
		cargo = (Cargo) cargoDAO.pesquisarEq(campo, valor).get(0);
		System.out.println(cargo.getId() + " " + cargo.getNome() + " "
				+ cargo.getDescricao() + " " + cargo.getSalario() + " "
				+ cargo.getSetor().getNome());

		return cargo;
	}

	@Override
	public void excluir(int id) {	
		cargo = (Cargo) cargoDAO.pesquisarEq("id", 1).get(0);
		cargoDAO.excluir(cargo);
		System.out.println("Excluido!");
	}

	@Override
	public void alterar(int id) {
		cargo = cargoDAO.pesquisarId(id).get(0);
		cargo.setNome("Limpesa");
		cargo.setSalario(1000.00);
		cargo.setDescricao("dasdadsadasdas");
		cargoDAO.editar(cargo);
		System.out.println("Alterado");
	}

	@Override
	public void lista() {
		List<Cargo> c = cargoDAO.listar();
		for(Cargo cargo: c){
			System.out.println(cargo.getId() + " " + cargo.getNome() + " "
					+ cargo.getDescricao() + " " + cargo.getSalario() + " "
					+ cargo.getSetor().getNome());
		}	
	}

	public void listaCargoLike(){
		
		 EmpresaDAO empDAO = new EmpresaDAO();
		 
			Empresa emp = empDAO.pesquisarId(12).get(0);

			setor = setorDAO.pesquisarId(2).get(0);
			List<Cargo> cargos = cargoDAO.ListaCargosPorSetores(emp, setor , "u");
	
			for(Cargo c: cargos){
				System.out.println(c.getNome()+" "+c.getSetor().getNome());
			}
			
	}
	
	public static void main(String[] args) {
		CargoTeste ct = new CargoTeste();
		
		ct.listaCargoLike();
		//ct.cadastrar();

		//ct.buscar("nome", "Programador");
	}

}
