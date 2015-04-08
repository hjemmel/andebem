package br.com.andebem.domain
{
	[Bindable]
	[RemoteClass(alias="br.com.andebem.entity.Modelo")]
	public class Modelo
	{
		public var id:Object;
		public var nome:String;
		public var marca:Marca;
		
		[Transient]
		public function get label():String
		{
			return nome + " ( "+marca.nome+" )";
		}
	}
}