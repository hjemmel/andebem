package br.com.andebem.controller
{
	import br.com.andebem.event.AcessorioEvent;
	import br.com.andebem.event.UsuarioEvent;
	import br.com.andebem.model.BaseModel;
	import br.com.andebem.model.UsuarioModel;
	
	import mx.collections.ArrayCollection;
	import mx.collections.IList;
	import mx.rpc.events.ResultEvent;
	import mx.rpc.remoting.RemoteObject;

	public class UsuarioController extends CadastroControllerBase
	{
		public function UsuarioController()
		{
			super.listCollectionProperty = "listUsuarios";
		}
		
		//--------------------------------------------------------------------------
		
		[Inject("usuarioService")]
		override public function set service(value:RemoteObject):void
		{
			super.service = value;
		}
		
		//--------------------------------------------------------------------------
		
		[Inject("usuarioModel")]
		override public function set model(value:BaseModel):void
		{
			super.model = value;
		}
		
		//--------------------------------------------------------------------------
		
		[EventHandler(event="UsuarioEvent.LIST")]
		override public function listService():void {
			super.listService();
		}
		
		[EventHandler(event="UsuarioEvent.CREATE", properties="vo")]
		override public function createService(vo:Object):void {
			super.createService(vo);
		}
		
		[EventHandler("UsuarioEvent.UPDATE", properties="vo")]
		override public function updateService(vo:Object):void {
			super.updateService(vo);
		}
		
		[EventHandler("UsuarioEvent.DELETE", properties="listaVOs")]
		override public function deleteService(listaVOs:IList):void {
			super.deleteService(listaVOs);
		}
		
		[EventHandler("UsuarioEvent.LIST_TIPO_USUARIO")]
		public function listarTipoUsuario():void
		{
			serviceCall(service.listarTipoUsuario(), listarTipoUsuarioResult);
		}
		
		public function listarTipoUsuarioResult(e:ResultEvent):void
		{
			UsuarioModel(model).listaTipoUsuario = e.result as ArrayCollection;
		}
	}
}