package br.com.karirirh.entidades;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.ManyToOne;

@Entity
public class Dependente {

	@Id
	@GeneratedValue
	@Column
	private int id;
	
	@Column(length = 50)
	private String tipo;
	
	@Column(length = 50)
	private String nomeDependete;
	
	@ManyToOne
	private Colaborador colaborador;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getTipo() {
		return tipo;
	}

	public void setTipo(String tipo) {
		this.tipo = tipo;
	}

	public String getNomeDependete() {
		return nomeDependete;
	}

	public void setNomeDependete(String nomeDependete) {
		this.nomeDependete = nomeDependete;
	}

	public Colaborador getColaborador() {
		return colaborador;
	}

	public void setColaborador(Colaborador colaborador) {
		this.colaborador = colaborador;
	}

	
}
