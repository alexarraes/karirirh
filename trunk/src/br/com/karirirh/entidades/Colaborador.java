package br.com.karirirh.entidades;



import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;

@Entity
public class Colaborador {

	@Id// Chave Primaria
	@GeneratedValue // AutoIncremento
	@Column
	private int id;

	@Column(length = 50, nullable = false)
	private String nome;
	
	@Column(length = 25, nullable = false)
    private int rg;
	
	@Column(length = 14, nullable = false)
	private String cpf;
	
	@Column(length = 30, nullable = false)
	private String ctps;
	
	@Column(length = 50, nullable = false)
    private String pis;
	
	@Column(nullable = false)
    private Date dataNascimento;
	
	@Column(length = 9,  nullable = false)
	private String sexo;
	
	@Column(nullable = false)
	private double salarioAtual;
	
	@Column(nullable = false)
	private boolean status;
	
	@Column(length = 50, nullable = false)
    private String escolaridade;
	
	@Column(length = 20, nullable=false)
	private String estadoCivil;
	
	@Column(length = 50, nullable = false)
    private String email;	
	
	@Column(nullable=false)
	private Date dataAdm;
	
	@Column(nullable=true)
	private Date dataDem;
	
	@Column(length = 8, nullable = false)
    private int matricula;
	
	@Column(length = 50, nullable=false)
	private String rua;
	
	@Column(length = 8, nullable=false)
	private String cep;
	
	@Column(length = 11)
	private int numero;
	
	@Column(length = 20)
	private String complemento;
	
	@Column(length = 40, nullable=false)
	private String bairro;
	
	@Column(length = 50, nullable=false)
	private String cidade;
	

}
