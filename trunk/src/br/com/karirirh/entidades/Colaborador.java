package br.com.karirirh.entidades;



import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.ManyToOne;

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
	
	@Column(length = 50, nullable = false)
    private String curso;
	
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
	
	@Column(length = 2, nullable=false)
	private String uf;
	
	@Column(length = 40)
	private String contrato;
	
	@ManyToOne
	private Empresa empresa;

	@ManyToOne
	private Cargo cargo;
	
	
	
	public String getContrato() {
		return contrato;
	}

	public void setContrato(String contrato) {
		this.contrato = contrato;
	}

	public String getUf() {
		return uf;
	}

	public void setUf(String uf) {
		this.uf = uf;
	}

	public Empresa getEmpresa() {
		return empresa;
	}

	public void setEmpresa(Empresa empresa) {
		this.empresa = empresa;
	}

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

	public int getRg() {
		return rg;
	}

	public void setRg(int rg) {
		this.rg = rg;
	}

	public String getCpf() {
		return cpf;
	}

	public void setCpf(String cpf) {
		this.cpf = cpf;
	}

	public String getCtps() {
		return ctps;
	}

	public void setCtps(String ctps) {
		this.ctps = ctps;
	}

	public String getPis() {
		return pis;
	}

	public void setPis(String pis) {
		this.pis = pis;
	}

	public Date getDataNascimento() {
		return dataNascimento;
	}

	public void setDataNascimento(Date dataNascimento) {
		this.dataNascimento = dataNascimento;
	}

	public String getSexo() {
		return sexo;
	}

	public void setSexo(String sexo) {
		this.sexo = sexo;
	}

	public double getSalarioAtual() {
		return salarioAtual;
	}

	public void setSalarioAtual(double salarioAtual) {
		this.salarioAtual = salarioAtual;
	}

	public boolean isStatus() {
		return status;
	}

	public void setStatus(boolean status) {
		this.status = status;
	}

	public String getEscolaridade() {
		return escolaridade;
	}

	public void setEscolaridade(String escolaridade) {
		this.escolaridade = escolaridade;
	}

	public String getEstadoCivil() {
		return estadoCivil;
	}

	public void setEstadoCivil(String estadoCivil) {
		this.estadoCivil = estadoCivil;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public Date getDataAdm() {
		return dataAdm;
	}

	public void setDataAdm(Date dataAdm) {
		this.dataAdm = dataAdm;
	}

	public Date getDataDem() {
		return dataDem;
	}

	public void setDataDem(Date dataDem) {
		this.dataDem = dataDem;
	}

	public int getMatricula() {
		return matricula;
	}

	public void setMatricula(int matricula) {
		this.matricula = matricula;
	}

	public String getRua() {
		return rua;
	}

	public void setRua(String rua) {
		this.rua = rua;
	}

	public String getCep() {
		return cep;
	}

	public void setCep(String cep) {
		this.cep = cep;
	}

	public int getNumero() {
		return numero;
	}

	public void setNumero(int numero) {
		this.numero = numero;
	}

	public String getComplemento() {
		return complemento;
	}

	public void setComplemento(String complemento) {
		this.complemento = complemento;
	}

	public String getBairro() {
		return bairro;
	}

	public void setBairro(String bairro) {
		this.bairro = bairro;
	}

	public String getCidade() {
		return cidade;
	}

	public void setCidade(String cidade) {
		this.cidade = cidade;
	}

	public Empresa getUsuario() {
		return empresa;
	}

	public void setUsuario(Empresa empresa) {
		this.empresa = empresa;
	}

	public Cargo getCargo() {
		return cargo;
	}

	public void setCargo(Cargo cargo) {
		this.cargo = cargo;
	}

	public String getCurso() {
		return curso;
	}

	public void setCurso(String curso) {
		this.curso = curso;
	}

}
