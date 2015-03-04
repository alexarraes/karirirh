package br.com.karirirh.entidades;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

@Entity
public class HistoricoSetor {

	@Id
	@GeneratedValue
	@Column
	private int id;
	
	@Column(nullable=false)
	@Temporal(TemporalType.DATE)
	private Date dataInicio;
	
	@Column(nullable=false)
	@Temporal(TemporalType.DATE)
	private Date dataFim;
	
	@Column(length = 50, nullable=true)
	private String cargo;
	
	@ManyToOne
	private Setor setor;
	
	@ManyToOne
	private Colaborador colaborador;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public Date getDataInicio() {
		return dataInicio;
	}

	public void setDataInicio(Date dataInicio) {
		this.dataInicio = dataInicio;
	}

	public Date getDataFim() {
		return dataFim;
	}

	public void setDataFim(Date dataFim) {
		this.dataFim = dataFim;
	}

	public Setor getSetor() {
		return setor;
	}

	public void setSetor(Setor setor) {
		this.setor = setor;
	}

	public String getCargo() {
		return cargo;
	}

	public void setCargo(String cargo) {
		this.cargo = cargo;
	}

	public Colaborador getColaborador() {
		return colaborador;
	}

	public void setColaborador(Colaborador colaborador) {
		this.colaborador = colaborador;
	}
	
}
