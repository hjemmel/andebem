package br.com.andebem.service
{
	import br.com.andebem.service.interfaces.IUsuarioDelegate;

	import mx.messaging.ChannelSet;
	import mx.rpc.AsyncToken;
	import mx.rpc.remoting.RemoteObject;

	public class UsuarioDelegate implements IUsuarioDelegate
	{
		[Inject]
		public var channelSet:ChannelSet;

		[Inject("usuarioService")]
		public var usuarioService:RemoteObject;

		public function channelLogin(username:String, password:String):AsyncToken
		{
			return channelSet.login(username, password);
		}

		public function getUsuarioByLogin(login:String):AsyncToken
		{
			return usuarioService.getUsuarioByLogin(login);
		}
	}
}