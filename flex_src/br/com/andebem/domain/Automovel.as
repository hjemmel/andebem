package br.com.andebem.domain
{
	import mx.collections.ArrayCollection;

	[Bindable]
	[RemoteClass(alias="br.com.andebem.entity.Automovel")]
	public class Automovel
	{
		public var id:Object;
		public var ano:int;
		public var placa:String;
		public var chassi:String;
		public var preco:Number;
		public var cor:String;
		public var combustivel:Combustivel;
		public var renavam:String;
		public var modelo:Modelo;
		public var data_insert:Date;
		public var data_update :Date;
		public var usuario :Usuario;
		public var data_compra:Date;
		public var num_nota:Object;
		public var categoria:Categoria;
		public var numeroPortas:int = 2;
		public var status:Status;
		[ArrayElementType("br.com.andebem.domain.Acessorio")]
		public var acessorios:ArrayCollection;
		
		public function get modeloLabel():String
		{
			return modelo.label;
		}
		
		public function get statusLabel():String
		{
			return status.nome;
		}
	}
}