package br.com.andebem.model
{
	import crud.collection.CrudCollection;

	[Bindable]
	public class MarcaModel extends BaseModel
	{
		public var listaMarcas:CrudCollection = new CrudCollection();
	}
}