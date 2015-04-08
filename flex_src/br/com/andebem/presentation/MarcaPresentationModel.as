package br.com.andebem.presentation
{
	import br.com.andebem.event.MarcaEvent;
	import br.com.andebem.model.MarcaModel;

	[Bindable]
	public class MarcaPresentationModel extends CadastroPresentationModel
	{
		[Inject]
		public var model:MarcaModel;
		
		public function MarcaPresentationModel()
		{
			this.eventClass = MarcaEvent;
		}
	}
}