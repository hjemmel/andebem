package br.com.andebem.domain
{
	[Bindable]
	[RemoteClass(alias="br.com.andebem.entity.Cliente")]
	public class Cliente
	{
		public var id:Object;
		public var nome:String;
		public var cpfCnpj:String;
		public var dataNascimento:Date;
		public var endereco:String;
		public var tempoCarteira:int;
		public var seguroOpcional:Boolean
		public var cidade:Cidade;
		public var tipoPessoa:TipoPessoa;
		
		[Transient]
		public function get label():String
		{
			return nome;
		}
	}
}