package br.com.andebem.controller
{
	import br.com.andebem.domain.GraficoFiltros;
	import br.com.andebem.model.RelatorioModel;
	
	import mx.collections.ArrayCollection;
	import mx.rpc.events.ResultEvent;
	import mx.rpc.remoting.RemoteObject;

	public class RelatorioController extends ControllerBase
	{
		[Inject("relatorioService")]
		public var service:RemoteObject
		
		[Inject]
		public var model:RelatorioModel;
		
		[EventHandler("RelatorioEvent.LISTAR_RELATORIO", properties="filtro")]
		public function listaRelatorio(filtro:GraficoFiltros):void
		{
			serviceCall(service[filtro.service].send.apply(null,[filtro.dataInicial,filtro.dataFinal]), listaRelatorioResult);
		}
		
		public function listaRelatorioResult(e:ResultEvent):void
		{
			model.listaRelatorio = ArrayCollection(e.result);
		}
		
	}
}