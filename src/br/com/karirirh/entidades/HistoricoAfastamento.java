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
public class HistoricoAfastamento {

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
	
	@Column(nullable=true)
	private int codDoenca;
	
	@Column(length = 20, nullable=true)
	private String tipo;
	
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

	public int getCodDoenca() {
		return codDoenca;
	}

	public void setCodDoenca(int codDoenca) {
		this.codDoenca = codDoenca;
	}

	public String getTipo() {
		return tipo;
	}

	public void setTipo(String tipo) {
		this.tipo = tipo;
	}

	public Colaborador getColaborador() {
		return colaborador;
	}

	public void setColaborador(Colaborador colaborador) {
		this.colaborador = colaborador;
	}
	
	
	
}
