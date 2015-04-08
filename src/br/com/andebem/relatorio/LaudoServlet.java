package br.com.andebem.relatorio;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.Map;
import java.util.ResourceBundle;

import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.jasperreports.engine.JRDataSource;
import net.sf.jasperreports.engine.JRException;
import net.sf.jasperreports.engine.JasperExportManager;
import net.sf.jasperreports.engine.JasperFillManager;
import net.sf.jasperreports.engine.JasperPrint;
import net.sf.jasperreports.engine.data.JRBeanCollectionDataSource;

import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;

import br.com.andebem.dto.RelatorioDTO;
import br.com.andebem.entity.Alteracao;
import br.com.andebem.entity.Automovel;
import br.com.andebem.service.interfaces.AutomovelService;

/**
 * Servlet implementation class LaudoServlet
 */
public class LaudoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public LaudoServlet() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		Long automovelId = Long.parseLong(request.getParameter("automovelId"));
		
		WebApplicationContext springContext = WebApplicationContextUtils.getWebApplicationContext(getServletContext());
		
		AutomovelService automovelService = (AutomovelService) springContext.getBean("automovelService");
	
		Automovel automovel = automovelService.get(automovelId);
		Collection<Alteracao> alteracoes = automovelService.listarAlteracoesPorAutomovel(automovelId);
		
		byte[] buffer = null;
		try {
			buffer = generatePdfFile(automovel, alteracoes);
		} catch (JRException e) {
			e.printStackTrace();
		}
		
		response.setContentType( "application/pdf" );
		response.setHeader("Content-Disposition", "attachment; filename=" + "laudo.pdf");
		response.setContentLength( buffer.length );
		ServletOutputStream outputStream = response.getOutputStream();
		
		for ( int i = 0; i < buffer.length; i++ ) {
			outputStream.write( buffer[i] );
			outputStream.flush();
		}
		
		outputStream.close();
	}
	
	private byte[] generatePdfFile(Automovel automovel, Collection<Alteracao> alteracoes) throws JRException 
	{
		ResourceBundle bundle = ResourceBundle.getBundle("application"); 
		
		String reportPath = getClass().getResource( bundle.getString("resource.folder") ).getFile();
		
		Map<String, Object> parameters = new HashMap<String, Object>();
		parameters.put("SUBREPORT_DIR", reportPath.toString());
		parameters.put("IMAGES_DIR", reportPath.toString());
		
		RelatorioDTO relatorio = new RelatorioDTO();
		relatorio.setCor(automovel.getCor());
		relatorio.setLaudo(automovel.getId() + 1000);
		relatorio.setModelo(automovel.getModelo().getNome());
		relatorio.setPlaca(automovel.getPlaca());
		relatorio.setAlteracoes(alteracoes);
		
		Collection<RelatorioDTO> infosRelatorio = new ArrayList<RelatorioDTO>();
		infosRelatorio.add(relatorio);
		
		
        JRDataSource jrds = new JRBeanCollectionDataSource(infosRelatorio);
		JasperPrint jasperPrint = JasperFillManager.fillReport( reportPath + bundle.getString("laudo.report"), parameters, jrds);
		
		byte[] buffer = JasperExportManager.exportReportToPdf(jasperPrint);
		return buffer;
	}

}
