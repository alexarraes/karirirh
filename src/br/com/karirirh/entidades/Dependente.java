package br.com.karirirh.entidades;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;

@Entity
public class Dependente {

	@Id
	@GeneratedValue
	@Column
	private int id;
	
	@Column(length = 50, nullable = false)
	private String nomeMae;
	
	@Column(length = 50)
	private String nomePai;
	
	@Column(length = 50)
	private String tipo;
	
	@Column(length = 50)
	private String nomeDependete;
	

	
	
	
	
	
}
