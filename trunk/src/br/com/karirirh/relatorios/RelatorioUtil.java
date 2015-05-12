package br.com.karirirh.relatorios;


import java.io.*;
import java.sql.*;
import java.util.HashMap;

import javax.faces.context.FacesContext;
import javax.naming.*;
import javax.swing.JOptionPane;

import net.sf.jasperreports.engine.*;
import net.sf.jasperreports.engine.export.*;
import net.sf.jasperreports.engine.export.oasis.JROdtExporter;
import net.sf.jasperreports.engine.util.JRLoader;

import org.primefaces.model.DefaultStreamedContent;
import org.primefaces.model.StreamedContent;

import com.mysql.jdbc.Connection;

import br.com.karirirh.util.Conexao;


public class RelatorioUtil {
     
    public static final int RELATORIO_PDF = 1;
    public static final int RELATORIO_EXCEL = 2;
    public static final int RELATORIO_HTML = 3;
    public static final int RELATORIO_PLANILHA_OPEN_OFFICE = 4;
        
    public StreamedContent geraRelatorio(HashMap parametrosRelatorio, String nomeRelatorioJasper, String nomeRelatorioSaida, int tipoRelatorio) throws UtilException {
       
StreamedContent arquivoRetorno = null;
        
        try {
            FacesContext context = FacesContext.getCurrentInstance();
            Connection conexao = (Connection) new Conexao().getConnection();
            
           
            String caminhoRelatorio = "report";
            JOptionPane.showMessageDialog(null, caminhoRelatorio);
            String caminhoArquivoJasper = caminhoRelatorio + File.separator + nomeRelatorioJasper + ".jasper";
            
            String caminhoArquivoRelatorio = null;

            
            JasperReport relatorioJasper = (JasperReport) JRLoader.loadObject(caminhoArquivoJasper);
           
            JasperPrint impressoraJasper = JasperFillManager.fillReport(relatorioJasper, parametrosRelatorio, conexao);
            JRExporter tipoArquivoExportado = null;
            String extensaoArquivoExportado = "";
            File arquivoGerado = null;

            switch (tipoRelatorio) {
                case RelatorioUtil.RELATORIO_PDF:
                    tipoArquivoExportado = new JRPdfExporter();
                    extensaoArquivoExportado = "pdf";
                    break;
                case RelatorioUtil.RELATORIO_HTML:
                    tipoArquivoExportado = new JRHtmlExporter();
                    extensaoArquivoExportado = "html";
                    break;
                case RelatorioUtil.RELATORIO_EXCEL:
                    tipoArquivoExportado = new JRXlsExporter();
                    extensaoArquivoExportado = "xls";
                    break;
                case RelatorioUtil.RELATORIO_PLANILHA_OPEN_OFFICE:
                    tipoArquivoExportado = new JROdtExporter();
                    extensaoArquivoExportado = "ods";
                    break;
                default:
                    tipoArquivoExportado = new JRPdfExporter();
                    extensaoArquivoExportado = "pdf";
                    break;
            }
            
            caminhoArquivoRelatorio = caminhoRelatorio + File.separator + nomeRelatorioSaida + "." + extensaoArquivoExportado;
           
            arquivoGerado = new java.io.File(caminhoArquivoRelatorio);
            tipoArquivoExportado.setParameter(JRExporterParameter.JASPER_PRINT, impressoraJasper);
            tipoArquivoExportado.setParameter(JRExporterParameter.OUTPUT_FILE, arquivoGerado);
            tipoArquivoExportado.exportReport();
            arquivoGerado.deleteOnExit();

            InputStream conteudoRelatorio = new FileInputStream(arquivoGerado);
            arquivoRetorno = new DefaultStreamedContent(conteudoRelatorio, "application/" + extensaoArquivoExportado, nomeRelatorioSaida + "." + extensaoArquivoExportado);
        } catch (JRException e) {
            System.out.println(e.getMessage());
        } catch (FileNotFoundException e) {
            System.out.println(e.getMessage());
        } 
        return arquivoRetorno;
    }


}