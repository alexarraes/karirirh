package br.com.karirirh.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.criterion.MatchMode;
import org.hibernate.criterion.Restrictions;

import br.com.karirirh.entidades.Cargo;
import br.com.karirirh.entidades.Cargo;
import br.com.karirirh.util.HibernateUtil;

public class CargoDAO {
	
	private Session sessao;
	private Transaction transacao;

	public void salvar(Cargo cargo) {
		sessao = HibernateUtil.getSessionFactory().openSession();
		transacao = sessao.beginTransaction();
		sessao.save(cargo);
		transacao.commit();
		sessao.close();
	}

	public void editar(Cargo cargo) {
		sessao = HibernateUtil.getSessionFactory().openSession();
		transacao = sessao.beginTransaction();
		sessao.update(cargo);
		transacao.commit();
		sessao.close();
	}

	public void excluir(Cargo cargo) {
		sessao = HibernateUtil.getSessionFactory().openSession();
		transacao = sessao.beginTransaction();
		sessao.delete(cargo);
		transacao.commit();
		sessao.close();

	}

	   public Cargo pesquisarCodigo(int id){
	         sessao = HibernateUtil.getSessionFactory().openSession();
	         Cargo cargo;	     
	         cargo=(Cargo)sessao.createCriteria(Cargo.class).add(Restrictions.eq("id", id)).uniqueResult();
	         sessao.close();
	         return cargo;
	     }
	
	public List<Cargo> ListarSetores() {
		sessao = HibernateUtil.getSessionFactory().openSession();
		List<Cargo> cargo;
		cargo = (List<Cargo>) sessao.createCriteria(Cargo.class).list();
		sessao.close();
		return cargo;
	}

	public List<Cargo> buscaNome(String nome) {
		sessao = HibernateUtil.getSessionFactory().openSession();
		List<Cargo> cargo;
		cargo = (List<Cargo>) sessao.createCriteria(Cargo.class)
				.add(Restrictions.ilike("nome", nome, MatchMode.ANYWHERE))
				.list();
		sessao.close();
		return cargo;
	}

	public Cargo buscarNomeEspecifico(String nome){
		sessao = HibernateUtil.getSessionFactory().openSession();
		Cargo cargo;
		cargo = (Cargo) sessao.createCriteria(Cargo.class).add(Restrictions.eq(nome, "nome")).uniqueResult();
		sessao.close();
		return cargo;
	}
}
