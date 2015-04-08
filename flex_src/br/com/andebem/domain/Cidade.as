package br.com.andebem.domain
{
	[Bindable]
	[RemoteClass(alias="br.com.andebem.entity.Cidade")]
	public class Cidade
	{
		public var id:Object;
		public var nome:String;
		public var estado:Estado;
	}
}