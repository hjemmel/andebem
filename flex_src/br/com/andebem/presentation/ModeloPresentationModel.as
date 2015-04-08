package br.com.andebem.presentation
{
	import br.com.andebem.event.ModeloEvent;
	import br.com.andebem.model.MarcaModel;
	import br.com.andebem.model.ModeloModel;

	[Bindable]
	public class ModeloPresentationModel extends CadastroPresentationModel
	{
		
		[Inject]
		public var model:ModeloModel;
		
		[Inject]
		public var marcaModel:MarcaModel;
		
		public function ModeloPresentationModel()
		{
			eventClass = ModeloEvent;
		}
	}
}