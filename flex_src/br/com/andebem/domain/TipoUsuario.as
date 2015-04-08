package br.com.andebem.domain
{

	[Bindable]
	[RemoteClass(alias="br.com.andebem.entity.TipoUsuario")]
	public class TipoUsuario
	{
		public function TipoUsuario(id:Number=0, nome:String=null)
		{
			this.id = id;  
			this.nome = nome;  
		}

		public var id:Number;
		public var nome:String;
	}
}