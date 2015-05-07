package br.com.karirirh.relatorios;

import java.util.HashMap;

import javax.faces.bean.ManagedBean;
import javax.faces.context.FacesContext;

import org.primefaces.model.StreamedContent;


@ManagedBean(name="relatorioBean")
public class RelatorioBean {

	private StreamedContent report;

	public StreamedContent getReport() {
		FacesContext context =FacesContext.getCurrentInstance();
		RelatorioUtil relatUtil = new RelatorioUtil();
		HashMap parametros = new HashMap();
		try{
			this.report =relatUtil.geraRelatorio(parametros,"pedro", "text", 1);
		}catch(Exception e){
			System.out.println(e.getMessage());
		}
		return report;
	}
	
	
	
}
