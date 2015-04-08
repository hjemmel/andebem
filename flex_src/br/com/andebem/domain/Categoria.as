package br.com.andebem.domain
{
	[Bindable]
	[RemoteClass(alias="br.com.andebem.entity.Categoria")]
	public class Categoria
	{
		public var id:Object;
		public var nome:String;
	}
}