package br.com.karirirh.dao;

import java.util.List;
import java.util.Set;

import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.criterion.MatchMode;
import org.hibernate.criterion.Restrictions;

import br.com.karirirh.entidades.Setor;
import br.com.karirirh.entidades.Setor;
import br.com.karirirh.entidades.Setor;
import br.com.karirirh.util.HibernateUtil;

public class SetorDAO extends GenericDAO<Setor> {

	public SetorDAO() {
		super(Setor.class);
	}

	public Setor pesquisarCodigo(int id) {
		setSessao(HibernateUtil.getSessionFactory().openSession());
		Setor setor;
		setor = (Setor) getSessao().createCriteria(Setor.class)
				.add(Restrictions.eq("id", id)).uniqueResult();
		getSessao().close();
		return setor;
	}

	public List<Setor> ListarSetores() {
		setSessao(HibernateUtil.getSessionFactory().openSession());
		List<Setor> setor;
		setor = (List<Setor>) getSessao().createCriteria(Setor.class).list();
		getSessao().close();
		return setor;
	}

	public List<Setor> buscaNome(String nome) {
		setSessao(HibernateUtil.getSessionFactory().openSession());
		List<Setor> setor;
		setor = (List<Setor>) getSessao().createCriteria(Setor.class)
				.add(Restrictions.ilike("nome", nome, MatchMode.ANYWHERE))
				.list();
		getSessao().close();
		return setor;
	}

	public Setor buscarNomeEspecifico(String nome) {
		setSessao(HibernateUtil.getSessionFactory().openSession());
		Setor setor;
		setor = (Setor) getSessao()
				.createCriteria(Setor.class)
				.add(Restrictions.eq(nome, "nome")).uniqueResult();
		getSessao().close();
		return setor;
	}
}
