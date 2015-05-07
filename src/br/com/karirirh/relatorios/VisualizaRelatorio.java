package br.com.karirirh.relatorios;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.jasperreports.engine.JasperFillManager;
import net.sf.jasperreports.engine.JasperPrint;
import net.sf.jasperreports.view.JasperViewer;
import com.mysql.jdbc.Connection;

import br.com.karirirh.util.Conexao;

/**
 * Servlet implementation class VisualizaRelatorio
 */
@WebServlet("/VisualizaRelatorio")
public class VisualizaRelatorio extends HttpServlet {
	private static final long serialVersionUID = 1L;
  
    public VisualizaRelatorio() {
        super();
       
    }

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.setContentType("text/html;charset-UTF-8");
		PrintWriter out = response.getWriter();
		try{
			Connection con = (Connection) new Conexao().getConnection();
			HashMap parametros = new HashMap();
			ServletContext sc = getServletContext();
			JasperPrint jp = JasperFillManager.fillReport(sc.getRealPath("Relatorios/RelatorioTeste.jasper"), parametros, con);
			JasperViewer jrv = new JasperViewer(jp);
			jrv.setVisible(true);
			out.println("<html>");
			out.println("<head>");
			out.println("<title>Visualiza Relatorio</title>");
			out.println("</head>");
			out.println("<body>");
			out.println("</body>");
			out.println("</html>");
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			out.close();
		}
		
	}

}
