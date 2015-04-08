package br.com.andebem.service.interfaces
{
	import mx.rpc.AsyncToken;

	public interface IUsuarioDelegate
	{
		function channelLogin(username:String, password:String):AsyncToken;
		function getUsuarioByLogin(login:String):AsyncToken;
	}
}