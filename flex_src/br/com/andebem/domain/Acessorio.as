package br.com.andebem.domain
{
	[Bindable]
	[RemoteClass(alias="br.com.andebem.entity.Acessorio")]
	public class Acessorio
	{
		public var id:Object;
		public var nome:String;
		
		public function get label():String
		{
			return nome;
		}
	}
}