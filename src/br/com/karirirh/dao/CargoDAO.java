package br.com.karirirh.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.criterion.MatchMode;
import org.hibernate.criterion.Restrictions;

import br.com.karirirh.entidades.Cargo;
import br.com.karirirh.entidades.Cargo;
import br.com.karirirh.util.HibernateUtil;

public class CargoDAO extends GenericDAO<Cargo>{

	public CargoDAO() {
		super(Cargo.class);
	}
	
}
