package br.com.karirirh.entidades;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;

@Entity
public class Ferias {

	@Id
	@GeneratedValue
	@Column
	private int id;
	
	@Column
	private Date entradaPFerias;
	
	@Column
	private Date terminoFerias;

}
