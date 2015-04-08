package br.com.andebem.presentation
{
	import br.com.andebem.event.ClienteEvent;
	import br.com.andebem.model.ClienteModel;

	[Bindable]
	public class ClientePresentationModel extends CadastroPresentationModel
	{
		[Inject]
		public var model:ClienteModel;

		public function ClientePresentationModel()
		{
			this.eventClass = ClienteEvent;
		}

		public function listTipoPessoa():void
		{
			swizDispatcher(new ClienteEvent(ClienteEvent.LIST_TIPO_PESSOA));	
		}

		public function listCidade():void
		{
			swizDispatcher(new ClienteEvent(ClienteEvent.LIST_TIPO_CIDADE));	
		}
	}
}