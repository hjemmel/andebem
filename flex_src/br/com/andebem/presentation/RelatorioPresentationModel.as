package br.com.andebem.presentation
{
	import br.com.andebem.domain.GraficoFiltros;
	import br.com.andebem.event.RelatorioEvent;
	import br.com.andebem.helper.ServicesConstants;
	import br.com.andebem.model.RelatorioModel;
	
	import flash.events.Event;
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	import flash.net.URLRequestMethod;
	import flash.net.URLVariables;
	import flash.net.navigateToURL;

	[Bindable]
	public class RelatorioPresentationModel extends PresentationBase
	{
		[Inject]
		public var relatorioModel:RelatorioModel;
		
		public function listaRelatorio(filtro:GraficoFiltros):void
		{
			swizDispatcher(new RelatorioEvent(RelatorioEvent.LISTAR_RELATORIO, filtro));
		}
		
		protected var _callback:Function;
		
		public function downloadRelatorio(json:String, callback:Function):void
		{
			_callback = callback;
			var requester:URLRequest = new URLRequest();
			requester.method = URLRequestMethod.POST;
			requester.url = ServicesConstants.RELATORIO_DONWLOAD_URL;
			
			var variables:URLVariables = new URLVariables();
			variables.listReport = json;
			requester.data = variables;
			var loader:URLLoader = new URLLoader();
			loader.load(requester);
			navigateToURL(requester, "_blank");
			loader.addEventListener(Event.COMPLETE,onComplete);
		}

		private function onComplete(event:Event):void
		{
			event.target.removeEventListener( Event.COMPLETE, onComplete );
			_callback();
		}
	}
}