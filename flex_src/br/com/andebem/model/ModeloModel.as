package br.com.andebem.model
{
	import crud.collection.CrudCollection;

	[Bindable]
	public class ModeloModel extends BaseModel
	{
		public var listaModelos:CrudCollection = new CrudCollection;
	}
}