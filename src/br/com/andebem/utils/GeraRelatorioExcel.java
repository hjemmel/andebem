package br.com.andebem.utils;

import java.util.Iterator;
import java.util.List;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFCellStyle;
import org.apache.poi.hssf.usermodel.HSSFFont;
import org.apache.poi.hssf.usermodel.HSSFRichTextString;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.hssf.util.HSSFColor;

import br.com.andebem.dto.GraficoDTO;

public class GeraRelatorioExcel {


	HSSFWorkbook wb = null;
	HSSFCellStyle linha = null;
	HSSFCellStyle titulo = null;
	HSSFCellStyle label = null;
	HSSFCellStyle content = null;
	HSSFFont fontTitulo = null;
	HSSFFont fontContent = null;
	HSSFRichTextString texto = null;
	HSSFSheet sheet = null;
	HSSFRow row = null;
	HSSFCell col = null;
	List<GraficoDTO> listReport;
	
	public GeraRelatorioExcel(List<GraficoDTO> listReport) {
		
		wb = new HSSFWorkbook();

		// Definir o style dos objetos
		linha = wb.createCellStyle();
		linha.setBottomBorderColor( HSSFColor.BLACK.index );
		linha.setBorderBottom( HSSFCellStyle.BORDER_THIN );
		linha.setBorderLeft( HSSFCellStyle.BORDER_THIN );
		linha.setBorderRight( HSSFCellStyle.BORDER_THIN );

		titulo = wb.createCellStyle();
		titulo.setAlignment( HSSFCellStyle.ALIGN_CENTER );
		titulo.setFillBackgroundColor( HSSFColor.GREY_25_PERCENT.index );
		titulo.setBottomBorderColor( HSSFColor.BLACK.index );
		titulo.setBorderBottom( HSSFCellStyle.BORDER_THIN );
		titulo.setBorderTop( HSSFCellStyle.BORDER_THIN );
		titulo.setBorderLeft( HSSFCellStyle.BORDER_THIN );
		titulo.setBorderRight( HSSFCellStyle.BORDER_THIN );

		label = wb.createCellStyle();
		label.setAlignment( HSSFCellStyle.ALIGN_LEFT );
		label.setFillBackgroundColor( HSSFColor.GREY_25_PERCENT.index );
		label.setBottomBorderColor( HSSFColor.BLACK.index );
		label.setBorderBottom( HSSFCellStyle.BORDER_THIN );
		label.setBorderTop( HSSFCellStyle.BORDER_THIN );
		label.setBorderLeft( HSSFCellStyle.BORDER_THIN );
		label.setBorderRight( HSSFCellStyle.BORDER_THIN );
		
		content = wb.createCellStyle();
		content.setAlignment( HSSFCellStyle.ALIGN_LEFT );
		//content.setFillBackgroundColor( HSSFColor.GREEN.index );
		content.setBottomBorderColor( HSSFColor.BLACK.index );
		content.setBorderBottom( HSSFCellStyle.BORDER_THIN );
		content.setBorderTop( HSSFCellStyle.BORDER_THIN );
		content.setBorderLeft( HSSFCellStyle.BORDER_THIN );
		content.setBorderRight( HSSFCellStyle.BORDER_THIN );
		
		fontTitulo = wb.createFont();
		fontTitulo.setFontHeightInPoints( (short) 12 );
		fontTitulo.setColor( HSSFColor.BLACK.index );
		fontTitulo.setBoldweight( HSSFFont.BOLDWEIGHT_BOLD );
		
		fontContent = wb.createFont();
		fontContent.setFontHeightInPoints( (short) 12 );
		fontContent.setColor( HSSFColor.BLACK.index );
		fontContent.setBoldweight( HSSFFont.BOLDWEIGHT_NORMAL );
		
		titulo.setFont( fontTitulo );
		label.setFont( fontTitulo );
		content.setFont( fontContent );		

		this.listReport = listReport;
	}
	
	public HSSFWorkbook getExcel() throws Exception {

		this.setHead();
		this.setValues( listReport );
		return wb;
	}
	
	public static final String TITLE = "Relátorio";
	public static final String COLUMN_LABEL = "Áreas";
	public static final String COLUMN_VALUES = "Valores";

	private void setHead() {

		sheet = wb.createSheet( "Relatórios" );

		row = sheet.createRow( (short) 0 );
		col = row.createCell( 0 );

		texto = new HSSFRichTextString( TITLE );
		col.setCellStyle( label );
		col.setCellValue( texto );
		sheet.setColumnWidth( 0, (short) ( ( 60 * 18 ) / ( (double) 1 / 20 ) ) );

		row = sheet.createRow( (short) 1 );

		col = row.createCell( 0 );
		texto = new HSSFRichTextString( COLUMN_LABEL );
		col.setCellStyle( label );
		col.setCellValue( texto );
		sheet.setColumnWidth( 0, (short) ( ( 60 * 18 ) / ( (double) 1 / 20 ) ) );

		col = row.createCell( 1 );
		texto = new HSSFRichTextString( COLUMN_VALUES );
		col.setCellStyle( label );
		col.setCellValue( texto );
		sheet.setColumnWidth( 1, (short) ( ( 15 * 18 ) / ( (double) 1 / 20 ) ) );
	}
	
	private void setValues( List<GraficoDTO> listReport ) {

		int linha = 2;
		
		for(Iterator<GraficoDTO> iterator = listReport.iterator(); iterator.hasNext();){
			GraficoDTO report = (GraficoDTO) iterator.next();
			
			row = sheet.createRow( (short) linha );

			// Áreas
			texto = new HSSFRichTextString( report.getLabel() );
			col = row.createCell( 0 );
			col.setCellStyle( content );
			col.setCellValue( texto );
			sheet.setColumnWidth( 0, (short) ( ( 60 * 18 ) / ( (double) 1 / 20 ) ) );

			// Valores		
			col = row.createCell( 1 );
			col.setCellStyle( content );
			col.setCellValue( report.getValue() );
			sheet.setColumnWidth( 1, (short) ( ( 15 * 18 ) / ( (double) 1 / 20 ) ) );
			
			linha++;
			
		}
	}



}
