package br.com.karirirh.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.criterion.MatchMode;
import org.hibernate.criterion.Restrictions;

import br.com.karirirh.entidades.Usuario;
import br.com.karirirh.util.HibernateUtil;

public class GenericDAO<T> {
	
	private Session sessao;
	private Transaction transacao;
	private Class classe;
	
	public GenericDAO(Class classe){
		this.classe = classe;
	}
	
	public void salvar(T object){
        sessao = HibernateUtil.getSessionFactory().openSession();
        transacao = sessao.beginTransaction();
        sessao.save(object);
        transacao.commit();
        sessao.close();
        
    }
    
    
     public void editar(T object){
        sessao = HibernateUtil.getSessionFactory().openSession();
        transacao= sessao.beginTransaction(); //Inicia a transação
        sessao.update(object);//Atualiza
        transacao.commit();//Efetiar a ação no banco, pois ele salva as informações na memoria e quando comita efetiva ela realmente no bd
        sessao.close();//Fecha a conexão
    
    }
     
     public void excluir(T object){
        sessao = HibernateUtil.getSessionFactory().openSession();
        transacao= sessao.beginTransaction();
        sessao.delete(object);
        transacao.commit();
        sessao.close();
         
     }
        
     public List<T> pesquisarLike(String campo, String valor){
         sessao = HibernateUtil.getSessionFactory().openSession();
         List<T> object;
         object=(List<T>)sessao.createCriteria(classe).
        		 add(Restrictions.ilike(campo,valor,MatchMode.ANYWHERE)).list();
         sessao.close();
         return object;
     }
     
     public List<T> pesquisarEq(String campo, Object valor){
         sessao = HibernateUtil.getSessionFactory().openSession();
         List<T> object;
         object=(List<T>)sessao.createCriteria(classe).
        		 add(Restrictions.eq(campo,valor)).list();
         sessao.close();
         return object;
     }
     
     public List<T> listar(){
         sessao = HibernateUtil.getSessionFactory().openSession();
         List<T> object;
         object=(List<T>)sessao.createCriteria(classe).list();
         sessao.close();
         return object;
     }

	public Session getSessao() {
		return sessao;
	}

	public void setSessao(Session sessao) {
		this.sessao = sessao;
	}

	public Transaction getTransacao() {
		return transacao;
	}

	public void setTransacao(Transaction transacao) {
		this.transacao = transacao;
	}
     


}
