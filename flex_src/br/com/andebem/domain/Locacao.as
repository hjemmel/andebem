package br.com.andebem.domain
{
	[Bindable]
	[RemoteClass(alias="br.com.andebem.entity.Locacao")]
	public class Locacao
	{
		public var id:Object;
		public var automovel:Automovel;
		public var cliente:Cliente;
		public var dataSaida:Date;
		public var dataEntrada:Date;
		public var tempoLocacao:int;
	}
}