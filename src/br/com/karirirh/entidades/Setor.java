package br.com.karirirh.entidades;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;

@Entity
public class Setor {
	
	@Id
	@GeneratedValue
	@Column
	private int id;
	
	@Column(length = 30, nullable=false)
	private String nome;
	
	@Column(length = 5)
	private int qtdFuncionarios;
	
	@Column(length = 5)
	private int qtdFerias;
	
	@Column(length = 5)
	private int numDemitidos;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public int getQtdFuncionarios() {
		return qtdFuncionarios;
	}

	public void setQtdFuncionarios(int qtdFuncionarios) {
		this.qtdFuncionarios = qtdFuncionarios;
	}

	public int getQtdFerias() {
		return qtdFerias;
	}

	public void setQtdFerias(int qtdFerias) {
		this.qtdFerias = qtdFerias;
	}

	public int getNumDemitidos() {
		return numDemitidos;
	}

	public void setNumDemitidos(int numDemitidos) {
		this.numDemitidos = numDemitidos;
	}

}
