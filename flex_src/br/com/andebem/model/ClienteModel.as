package br.com.andebem.model
{
	import crud.collection.CrudCollection;
	
	import mx.collections.ArrayCollection;

	[Bindable]
	public class ClienteModel extends BaseModel
	{
		public var listClientes:CrudCollection = new CrudCollection();
		
		public var listaTipoPessoa:ArrayCollection;
		
		public var listaCidades:ArrayCollection;
	}
}