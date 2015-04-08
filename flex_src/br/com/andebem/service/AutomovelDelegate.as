package br.com.andebem.service
{
	import br.com.andebem.service.interfaces.IAutomovelDelegate;
	
	import mx.rpc.AsyncToken;
	
	public class AutomovelDelegate implements IAutomovelDelegate
	{
		[Inject]
		public var channelSet:ChannelSet;
		
		[Inject("automovelService")]
		public var automovelService:RemoteObject;
		
		
		public function channelLogin(username:String, password:String):AsyncToken
		{
			return channelSet.login(username, password);
		}
		
		public function listarCategorias():AsyncToken
		{
			return automovelService.listarCategorias();
		}
		
		public function listarModelos():AsyncToken
		{
			return automovelService.listarModelos();
		}
	}