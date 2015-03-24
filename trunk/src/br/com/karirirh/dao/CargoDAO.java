package br.com.karirirh.dao;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SharedSessionContract;
import org.hibernate.Transaction;
import org.hibernate.criterion.Conjunction;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.MatchMode;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;
import org.hibernate.criterion.Subqueries;

import br.com.karirirh.entidades.Cargo;
import br.com.karirirh.entidades.Cargo;
import br.com.karirirh.entidades.Empresa;
import br.com.karirirh.entidades.Setor;
import br.com.karirirh.entidades.Usuario;
import br.com.karirirh.util.HibernateUtil;

public class CargoDAO extends GenericDAO<Cargo> {
	private Session sessao;

	public CargoDAO() {
		super(Cargo.class);
	}

	public List<Cargo> CargosComSeusSetores(Empresa empresa) {
		CargoDAO cargoDAO = new CargoDAO();
		List<Cargo> cargos = cargoDAO.listar();
		sessao = HibernateUtil.getSessionFactory().openSession();
		Criteria criteria = sessao.createCriteria(Cargo.class, "c");
		Conjunction e = Restrictions.conjunction();
		for (Cargo c : cargos) {
			e.add(Subqueries.exists(DetachedCriteria.forClass(Setor.class, "s")
					.setProjection(Projections.id())
					.add(Restrictions.eqProperty("c.setor", "s.id"))
					.add(Restrictions.eq("s.empresa", empresa))));
		}
		criteria.add(e);
		return criteria.list();
	}

	public List<Cargo> ListaCargosPorSetores(Empresa empresa, Setor setor,
			String nome) {
		CargoDAO cargoDAO = new CargoDAO();
		List<Cargo> cargos = cargoDAO.listar();
		sessao = HibernateUtil.getSessionFactory().openSession();
		Criteria criteria = sessao.createCriteria(Cargo.class, "c");
		Conjunction e = Restrictions.conjunction();
		for (Cargo c : cargos) {
			e.add(Subqueries.exists(DetachedCriteria
					.forClass(Setor.class, "s")
					.setProjection(Projections.id())
					.add(Restrictions.eqProperty("c.setor", "s.id"))
					.add(Restrictions.eq("s.empresa", empresa))
					.add(Restrictions.eq("c.setor", setor))
					.add(Restrictions.ilike("c.nome", nome, MatchMode.ANYWHERE))));
		}
		criteria.add(e);
		return criteria.list();
	}

	public List<Cargo> ListaCargosDoSetor(Empresa empresa, Setor setor) {
		CargoDAO cargoDAO = new CargoDAO();
		List<Cargo> cargos = cargoDAO.listar();
		sessao = HibernateUtil.getSessionFactory().openSession();
		Criteria criteria = sessao.createCriteria(Cargo.class, "c");
		Conjunction e = Restrictions.conjunction();
		for (Cargo c : cargos) {
			e.add(Subqueries.exists(DetachedCriteria.forClass(Setor.class, "s")
					.setProjection(Projections.id())
					.add(Restrictions.eqProperty("c.setor", "s.id"))
					.add(Restrictions.eq("s.empresa", empresa))
					.add(Restrictions.eq("c.setor", setor))));
		}
		criteria.add(e);
		return criteria.list();
	}

}
