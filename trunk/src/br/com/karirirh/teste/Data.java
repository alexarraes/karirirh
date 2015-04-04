package br.com.karirirh.teste;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import br.com.karirirh.dao.ColaboradorDAO;
import br.com.karirirh.dao.FeriasDAO;
import br.com.karirirh.entidades.Colaborador;


public class Data {

	public static void main(String[] args) {
		ColaboradorDAO colDAO = new ColaboradorDAO();
		Colaborador col = colDAO.pesquisarEq("matricula", 20152).get(0);
		FeriasDAO frDAO = new FeriasDAO();
		if(frDAO.emFerias(col) != null){
			System.out.println("Não Cadastra");
		}else{
			System.out.println("Cadastra");
		}
		
	}
	
	public Date formataData(String data) throws Exception {   
		new SimpleDateFormat("dd 'de' MMMM 'de' yyyy").format(new Date());
        if (data == null || data.equals(""))  
            return null;  
          
        Date date = null;  
        try {  
            DateFormat formatter = new SimpleDateFormat("dd/MM/yyyy");  
            date = (java.util.Date)formatter.parse(data);  
        } catch (ParseException e) {              
            throw e;  
        }  
        return date;  
    }
}
