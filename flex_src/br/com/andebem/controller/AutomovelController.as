package br.com.andebem.controller
{
	import br.com.andebem.domain.Automovel;
	import br.com.andebem.domain.Cliente;
	import br.com.andebem.event.AutomovelEvent;
	import br.com.andebem.model.AutomovelModel;
	import br.com.andebem.model.BaseModel;
	
	import mx.collections.ArrayCollection;
	import mx.collections.IList;
	import mx.controls.Alert;
	import mx.rpc.events.ResultEvent;
	import mx.rpc.remoting.RemoteObject;

	public class AutomovelController extends CadastroControllerBase
	{
		public function AutomovelController()
		{
			this.listCollectionProperty = "listaAutomoveis";
		}


		//--------------------------------------------------------------------------
		
		[Inject("automovelService")]
		override public function set service(value:RemoteObject):void
		{
			super.service = value;
		}
		
		//--------------------------------------------------------------------------
		
		[Inject("automovelModel")]
		override public function set model(value:BaseModel):void
		{
			super.model = value;
		}
		
		//--------------------------------------------------------------------------
		
		
		[EventHandler(event="AutomovelEvent.LIST")]
		override public function listService():void {
			super.listService();
		}
		
		[EventHandler(event="AutomovelEvent.CREATE", properties="vo")]
		override public function createService(vo:Object):void {
			super.createService(vo);
		}
		
		[EventHandler("AutomovelEvent.DELETE", properties="listaVOs")]
		override public function deleteService(listaVOs:IList):void {
			super.deleteService(listaVOs);
		}
		
		[EventHandler("AutomovelEvent.UPDATE", properties="vo")]
		override public function updateService(vo:Object):void {
			super.updateService(vo);
		}
		
		[EventHandler("AutomovelEvent.LISTAR_CATEGORIAS")]
		public function listarCategorias():void
		{
			serviceCall(service.listarCategorias(),listarCategoriaResult);
		}
		
		public function listarCategoriaResult(e:ResultEvent):void
		{
			AutomovelModel(model).listaCategorias = ArrayCollection(e.result);
		}
		
		[EventHandler("AutomovelEvent.LISTAR_MODELOS")]
		public function listarModelos():void
		{
			serviceCall(service.listarModelos(),listarModelosResult);
		}
		
		public function listarModelosResult(e:ResultEvent):void
		{
			AutomovelModel(model).listaModelos = ArrayCollection(e.result);
		}
		
		[EventHandler("AutomovelEvent.LISTAR_COMBUSTIVEIS")]
		public function listarCombustiveis():void
		{
			serviceCall(service.listarCombustiveis(),listarCombustiveisResult);
		}
		
		public function listarCombustiveisResult(e:ResultEvent):void
		{
			AutomovelModel(model).listaCombustiveis = ArrayCollection(e.result);
		}
		
		[EventHandler(event="AutomovelEvent.LISTAR_ALTERACOES", properties="vo")]
		public function listarAlteracoesPorId(vo:Automovel):void 
		{
			serviceCall(service.listarAlteracoesPorAutomovel(vo.id), listarAlteracoesPorAutomovelResult);
		}
		
		public function listarAlteracoesPorAutomovelResult(e:ResultEvent):void
		{
			AutomovelModel(model).listaAlteracoes = ArrayCollection(e.result);
		}
		
		[EventHandler(event="AutomovelEvent.SALVAR_ALTERACOES", properties="vo, listaVOs")]
		public function salvarAlteracoes(vo:Automovel, listaVOs:ArrayCollection):void 
		{
			serviceCall(service.salvarAlteracoes(listaVOs, vo), salvaAlteracoesResult);
		}
		
		public function salvaAlteracoesResult(e:ResultEvent):void
		{
		}
		
		[EventHandler(event="AutomovelEvent.LISTAR_ULTIMA_LOCACAO", properties="vo")]
		public function listarUltimaLocacao(vo:Automovel):void 
		{
			serviceCall(service.listarUltimaLocacaoPorAutomovel(vo), listarUltimaLocacaoResult);
		}
		
		public function listarUltimaLocacaoResult(e:ResultEvent):void
		{
			var event:AutomovelEvent = new AutomovelEvent(AutomovelEvent.LISTAR_ULTIMA_LOCACAO_REFRESH);
			event.vo = e.result;
			dispatcherSwizEvent(event);
		}
		
		[EventHandler(event="AutomovelEvent.LOCAR_AUTOMOVEL", properties="vo, cliente")]
		public function locarAutomovel(vo:Automovel, cliente:Cliente):void 
		{
			serviceCall(service.locarAltomovel(vo, cliente), locarAutomovelResult);
		}
		
		public function locarAutomovelResult(e:ResultEvent):void
		{
		}
		
		[EventHandler(event="AutomovelEvent.TROCAR_STATUS", properties="vo")]
		public function trocarStatus(vo:Automovel):void 
		{
			serviceCall(service.updateGet(vo), locarAutomovelResult);
		}
		
		public function trocarStatusResult(e:ResultEvent):void
		{
		}
		
		[EventHandler(event="AutomovelEvent.FINALIZAR_LOCACAO", properties="vo")]
		public function finalizarLocacao(vo:Automovel):void 
		{
			serviceCall(service.finalizarLocacao(vo), finalizarLocacaoResult);
		}
		
		public function finalizarLocacaoResult(e:ResultEvent):void
		{
		}
		
		[EventHandler("AutomovelEvent.SALVAR_AUTOMOVEL",properties="automovel")]
		public function salvarAutomovel(automovel:Automovel):void
		{
			serviceCall(service.insert(automovel),saveResult);
		}
		
		public function saveResult(e:ResultEvent):void
		{
			Alert.show("Inserido");
		}
	}
}