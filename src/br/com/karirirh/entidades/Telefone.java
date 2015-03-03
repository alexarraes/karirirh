package br.com.karirirh.entidades;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;

@Entity
public class Telefone {
	
	@Id
	@GeneratedValue
	@Column
	private int id;
	
	@Column
	private String fone;
	
	@Column
	private String tipo;
}
