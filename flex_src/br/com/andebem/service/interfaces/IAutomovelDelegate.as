package br.com.andebem.service.interfaces
{
	import mx.rpc.AsyncToken;

	public interface IAutomovelDelegate
	{
		function listarCategoria():AsyncToken;
		function listarModelos():AsyncToken;
		
	}
}