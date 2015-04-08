package br.com.andebem.controller
{
	import br.com.andebem.event.MarcaEvent;
	import br.com.andebem.model.BaseModel;
	
	import mx.collections.IList;
	import mx.rpc.remoting.RemoteObject;

	public class MarcaController extends CadastroControllerBase
	{
		public function MarcaController()
		{
			super.listCollectionProperty = "listaMarcas";
		}
		
		//--------------------------------------------------------------------------
		
		[Inject("marcaService")]
		override public function set service(value:RemoteObject):void
		{
			super.service = value;
		}
		
		//--------------------------------------------------------------------------
		
		[Inject("marcaModel")]
		override public function set model(value:BaseModel):void
		{
			super.model = value;
		}
		
		//--------------------------------------------------------------------------
		
		[EventHandler(event="MarcaEvent.LIST")]
		override public function listService():void {
			super.listService();
		}
		
		[EventHandler(event="MarcaEvent.CREATE", properties="vo")]
		override public function createService(vo:Object):void {
			super.createService(vo);
		}
		
		[EventHandler("MarcaEvent.UPDATE", properties="vo")]
		override public function updateService(vo:Object):void {
			super.updateService(vo);
		}
		
		[EventHandler("MarcaEvent.DELETE", properties="listaVOs")]
		override public function deleteService(listaVOs:IList):void {
			super.deleteService(listaVOs);
		}
	}
}