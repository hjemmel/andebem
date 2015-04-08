package br.com.andebem.model
{
	import crud.collection.CrudCollection;
	
	import mx.collections.ArrayCollection;

	[Bindable]
	public class UsuarioModel extends BaseModel
	{
		public var listUsuarios:CrudCollection = new CrudCollection();
		
		public var listaTipoUsuario:ArrayCollection;
	}
}