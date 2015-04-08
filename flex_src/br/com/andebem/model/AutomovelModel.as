package br.com.andebem.model
{
	import crud.collection.CrudCollection;
	
	import mx.collections.ArrayCollection;

	[Bindable]
	public class AutomovelModel extends BaseModel
	{
		public var listaAutomoveis:CrudCollection = new CrudCollection();
		
		[ArrayElementType("br.com.andebem.domain.Categoria")]
		public var listaCategorias:ArrayCollection;
		
		[ArrayElementType("br.com.andebem.domain.Modelo")]
		public var listaModelos:ArrayCollection;
		
		[ArrayElementType("br.com.andebem.domain.Alteracao")]
		public var listaAlteracoes:ArrayCollection;
		
		[ArrayElementType("br.com.andebem.domain.Combustivel")]
		public var listaCombustiveis:ArrayCollection;
	}
}