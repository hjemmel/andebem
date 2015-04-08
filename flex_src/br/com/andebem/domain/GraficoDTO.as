package br.com.andebem.domain
{
	[Bindable]
	[RemoteClass(alias="br.com.andebem.dto.GraficoDTO")]
	public class GraficoDTO
	{
		public var label:String;
		public var value:Number;
	}
}