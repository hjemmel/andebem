package br.com.andebem.model
{
	import crud.collection.CrudCollection;

	[Bindable]
	public class AcessorioModel extends BaseModel
	{
		public var listAcessorios:CrudCollection = new CrudCollection();
	}
}