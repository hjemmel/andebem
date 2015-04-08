package br.com.andebem.controller
{
	import br.com.andebem.event.ClienteEvent;
	import br.com.andebem.model.BaseModel;
	import br.com.andebem.model.ClienteModel;
	
	import mx.collections.ArrayCollection;
	import mx.collections.IList;
	import mx.rpc.events.ResultEvent;
	import mx.rpc.remoting.RemoteObject;

	public class ClienteController extends CadastroControllerBase
	{
		public function ClienteController()
		{
			super.listCollectionProperty = "listClientes";
		}
		
		//--------------------------------------------------------------------------
		
		[Inject("clienteService")]
		override public function set service(value:RemoteObject):void
		{
			super.service = value;
		}
		
		//--------------------------------------------------------------------------
		
		[Inject("clienteModel")]
		override public function set model(value:BaseModel):void
		{
			super.model = value;
		}
		
		//--------------------------------------------------------------------------
		
		[EventHandler(event="ClienteEvent.LIST")]
		override public function listService():void {
			super.listService();
		}
		
		[EventHandler(event="ClienteEvent.CREATE", properties="vo")]
		override public function createService(vo:Object):void {
			super.createService(vo);
		}
		
		[EventHandler("ClienteEvent.UPDATE", properties="vo")]
		override public function updateService(vo:Object):void {
			super.updateService(vo);
		}
		
		[EventHandler("ClienteEvent.DELETE", properties="listaVOs")]
		override public function deleteService(listaVOs:IList):void {
			super.deleteService(listaVOs);
		}
		
		[EventHandler("ClienteEvent.LIST_TIPO_PESSOA")]
		public function listarTiposPessoa():void
		{
			serviceCall(service.listarTiposPessoa(), listarTiposPessoaResult);
		}
		
		public function listarTiposPessoaResult(e:ResultEvent):void
		{
			ClienteModel(model).listaTipoPessoa = e.result as ArrayCollection;
		}
		
		[EventHandler("ClienteEvent.LIST_TIPO_CIDADE")]
		public function listarCidade():void
		{
			serviceCall(service.listarCidades(), listarCidadeResult);
		}
		
		public function listarCidadeResult(e:ResultEvent):void
		{
			ClienteModel(model).listaCidades = e.result as ArrayCollection;
		}
	}
}