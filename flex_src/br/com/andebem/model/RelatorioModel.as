package br.com.andebem.model
{
	import mx.collections.ArrayCollection;

	[Bindable]
	public class RelatorioModel
	{

		[ArrayElementType("br.com.andebem.domain.GraficoDTO")]
		public var listaRelatorio:ArrayCollection;
		
	}
}