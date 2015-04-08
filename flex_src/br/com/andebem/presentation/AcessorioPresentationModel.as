package br.com.andebem.presentation
{
	import br.com.andebem.event.AcessorioEvent;
	import br.com.andebem.model.AcessorioModel;

	[Bindable]
	public class AcessorioPresentationModel extends CadastroPresentationModel
	{

		[Inject]
		public var model:AcessorioModel;
		
		public function AcessorioPresentationModel()
		{
			super.eventClass = AcessorioEvent;
		}
	}
}