package br.com.karirirh.util;

import org.hibernate.SessionFactory;
import org.hibernate.cfg.AnnotationConfiguration;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * 
 * @author Alex Jr Arraes
 *
 */
public class HibernateUtil {
	
	public static SessionFactory getSessionFactory(){
		return sessionFactory;
	}
	
	private static SessionFactory sessionFactory =
			buildSessionFactory();
	
	private static SessionFactory buildSessionFactory(){
		try {
			AnnotationConfiguration cfg = 
					new AnnotationConfiguration();
			cfg.configure("hibernate.cfg.xml");
			return cfg.buildSessionFactory();
		} catch (Throwable e) {
			// TODO: handle exception
			System.out.println("CriaÃ§Ã£o inicial do objeto" +
					" SessionFactory falhou. Erro: "+e);
			throw new ExceptionInInitializerError(e);
		}
	}

}
