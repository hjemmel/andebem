package br.com.andebem.event
{
	import br.com.andebem.domain.GraficoDTO;
	import br.com.andebem.domain.GraficoFiltros;
	
	import flash.events.Event;

	/**
	 *
	 * @author Hans Jakob Emmel
	 *
	 */
	public class RelatorioEvent extends Event
	{
		public static const LISTAR_RELATORIO:String = "listarRelatorio";
		public static const FILTRAR_RELATORIO:String = "filtrarRelatorio";
		public static const MENU_RELATORIO_CARREGADO:String = "menuRelatorioCarregado";
		
		private var _filtro:GraficoFiltros;
		
		public function get filtro():GraficoFiltros
		{
			return _filtro;
		}
		
		public function RelatorioEvent(type:String, filtro:GraficoFiltros, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
			_filtro=filtro;
		}
		
		public override function clone():Event
		{
			return new RelatorioEvent(type, _filtro, bubbles, cancelable);
		}
	
	
	}
}