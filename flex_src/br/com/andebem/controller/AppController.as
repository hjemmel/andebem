
package br.com.andebem.controller
{
	import br.com.andebem.domain.Usuario;
	import br.com.andebem.event.LoginEvent;
	import br.com.andebem.service.interfaces.IUsuarioDelegate;
	
	import mx.rpc.AsyncToken;
	import mx.rpc.events.FaultEvent;
	import mx.rpc.events.ResultEvent;
	
	public class AppController extends ControllerBase
	{
		[Inject]
		public var usuarioDelegate:IUsuarioDelegate;
		
		[EventHandler(event="LoginEvent.LOGIN", properties="usuario, senha")]
		public function loginHandler(usuario:String, senha:String):void
		{
			var call:AsyncToken = usuarioDelegate.channelLogin(usuario, senha);
			serviceCall(call, loginResultHandler, faultHandler);
		}
		
		private function loginResultHandler(event:ResultEvent):void
		{
			serviceCall(usuarioDelegate.getUsuarioByLogin(event.result.name), getUsuarioByLoginResult);
		}
		
		private function getUsuarioByLoginResult(event:ResultEvent):void
		{
			appModel.usuario = Usuario(event.result);
			dispatcherSwizEvent(new LoginEvent(LoginEvent.LOGIN_COMPLETE));
		}
		
		private function faultHandler(event:FaultEvent):void
		{
			dispatcherSwizEvent(new LoginEvent(LoginEvent.LOGIN_ERROR));
		}
	
	}
}