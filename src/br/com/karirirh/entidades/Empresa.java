package br.com.karirirh.entidades;

import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToMany;


@Entity
public class Empresa {

	@Id
	@GeneratedValue
	private int id;

	@Column(length = 18, nullable = false)
	private String cnpj;
	
	@Column(length = 45, nullable = false)
	private String razaoSociao;
	
	@Column(length = 100)
	private String enderecoCompleto;
	
	@Column(length = 45)
	private String fone;
	
	@Column()
	@OneToMany(mappedBy="empresa")
	private List<Usuario> usuario;
	
	
	public List<Usuario> getUsuario() {
		return usuario;
	}

	public void setUsuario(List<Usuario> usuario) {
		this.usuario = usuario;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getCnpj() {
		return cnpj;
	}

	public void setCnpj(String cnpj) {
		this.cnpj = cnpj;
	}

	public String getRazaoSociao() {
		return razaoSociao;
	}

	public void setRazaoSociao(String razaoSociao) {
		this.razaoSociao = razaoSociao;
	}

	public String getEnderecoCompleto() {
		return enderecoCompleto;
	}

	public void setEnderecoCompleto(String enderecoCompleto) {
		this.enderecoCompleto = enderecoCompleto;
	}

	public String getFone() {
		return fone;
	}

	public void setFone(String fone) {
		this.fone = fone;
	}

}
