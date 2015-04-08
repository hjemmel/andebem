package br.com.andebem.controller
{
	import br.com.andebem.event.AcessorioEvent;
	import br.com.andebem.model.BaseModel;
	
	import mx.collections.IList;
	import mx.rpc.remoting.RemoteObject;

	public class AcessorioController extends CadastroControllerBase
	{
		public function AcessorioController()
		{
			super.listCollectionProperty = "listAcessorios";
		}
		
		//--------------------------------------------------------------------------
		
		[Inject("acessorioService")]
		override public function set service(value:RemoteObject):void
		{
			super.service = value;
		}
		
		//--------------------------------------------------------------------------
		
		[Inject("acessorioModel")]
		override public function set model(value:BaseModel):void
		{
			super.model = value;
		}
		
		//--------------------------------------------------------------------------
		
		[EventHandler(event="AcessorioEvent.LIST")]
		override public function listService():void {
			super.listService();
		}
		
		[EventHandler(event="AcessorioEvent.CREATE", properties="vo")]
		override public function createService(vo:Object):void {
			super.createService(vo);
		}

		[EventHandler("AcessorioEvent.UPDATE", properties="vo")]
		override public function updateService(vo:Object):void {
			super.updateService(vo);
		}
		
		[EventHandler("AcessorioEvent.DELETE", properties="listaVOs")]
		override public function deleteService(listaVOs:IList):void {
			super.deleteService(listaVOs);
		}
	}
}