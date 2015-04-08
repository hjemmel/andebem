package br.com.andebem.domain
{
	
	[Bindable]
	[RemoteClass(alias="br.com.andebem.entity.Usuario")]
	public class Usuario
	{
		public var id:Object;
		public var nome:String;
		public var login:String;
		public var email:String;
		public var senha:String;
		public var tipoUsuario:TipoUsuario;
		
		[Transient]
		public function get label():String
		{
			return nome + " ( " +login+ " )";
		}
	}
}