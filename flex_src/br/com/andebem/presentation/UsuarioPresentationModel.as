package br.com.andebem.presentation
{
	import br.com.andebem.event.UsuarioEvent;
	import br.com.andebem.model.UsuarioModel;

	[Bindable]
	public class UsuarioPresentationModel extends CadastroPresentationModel
	{

		[Inject]
		public var model:UsuarioModel;
		
		public function UsuarioPresentationModel()
		{
			this.eventClass = UsuarioEvent;
		}
		
		public function listTipoUsuario():void
		{
			swizDispatcher(new UsuarioEvent(UsuarioEvent.LIST_TIPO_USUARIO));	
		}
	}
}