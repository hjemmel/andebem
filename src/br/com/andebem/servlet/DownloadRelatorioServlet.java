package br.com.andebem.servlet;

import java.io.IOException;
import java.io.OutputStream;
import java.util.LinkedList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;

import br.com.andebem.dto.GraficoDTO;
import br.com.andebem.utils.GeraRelatorioExcel;

/**
 * Servlet implementation class DownloadRelatorioServlet
 */
public class DownloadRelatorioServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public DownloadRelatorioServlet() {
		super();
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		JSONParser parser = new JSONParser();
		String strJson = request.getParameter("listReport");
		HSSFWorkbook wb = null;

		try {
			JSONArray listReportJson = (JSONArray) parser.parse(strJson);
			List<GraficoDTO> reportList = new LinkedList<GraficoDTO>();

			// Paerseando Lista
			for (Object obj : listReportJson) {
				JSONObject jsonObj = (JSONObject) obj;

				GraficoDTO grafico = new GraficoDTO();

				grafico.setLabel(jsonObj.get("label").toString());
				grafico.setValue((Long) jsonObj.get("value"));
				reportList.add(grafico);
			}

			// Gerando Excel
			GeraRelatorioExcel excel = new GeraRelatorioExcel(reportList);
			response
					.setHeader("Content-disposition", "filename=relatorio.xls;");
			response.setContentType("application/vnd.ms-excel");

			// geraReportExcel.setReportService(service);
			wb = excel.getExcel();

			OutputStream out = response.getOutputStream();
			wb.write(out);
			out.close();

		} catch (Exception e) {
			e.printStackTrace();
			throw new IOException(e);
		}
	}

}
