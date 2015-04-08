package br.com.andebem.controller
{
	import br.com.andebem.event.ModeloEvent;
	import br.com.andebem.model.BaseModel;
	
	import mx.collections.IList;
	import mx.rpc.remoting.RemoteObject;

	public class ModeloController extends CadastroControllerBase
	{
		public function ModeloController()
		{
			super.listCollectionProperty = "listaModelos";
		}
		
		//--------------------------------------------------------------------------
		
		[Inject("modeloService")]
		override public function set service(value:RemoteObject):void
		{
			super.service = value;
		}
		
		//--------------------------------------------------------------------------
		
		[Inject("modeloModel")]
		override public function set model(value:BaseModel):void
		{
			super.model = value;
		}
		
		//--------------------------------------------------------------------------
		
		[EventHandler(event="ModeloEvent.LIST")]
		override public function listService():void {
			super.listService();
		}
		
		[EventHandler(event="ModeloEvent.CREATE", properties="vo")]
		override public function createService(vo:Object):void {
			super.createService(vo);
		}
		
		[EventHandler("ModeloEvent.UPDATE", properties="vo")]
		override public function updateService(vo:Object):void {
			super.updateService(vo);
		}
		
		[EventHandler("ModeloEvent.DELETE", properties="listaVOs")]
		override public function deleteService(listaVOs:IList):void {
			super.deleteService(listaVOs);
		}
	}
}