package br.com.andebem.presentation
{
	import br.com.andebem.domain.Automovel;
	import br.com.andebem.event.AcessorioEvent;
	import br.com.andebem.event.AutomovelEvent;
	import br.com.andebem.model.AcessorioModel;
	import br.com.andebem.model.AutomovelModel;

	[Bindable]
	public class AutomovelPresentationModel extends CadastroPresentationModel
	{
		[Inject]
		public var model:AutomovelModel;
		
		[Inject]
		public var acessorioModel:AcessorioModel;
		
		public function AutomovelPresentationModel()
		{
			eventClass = AutomovelEvent;
		}
		
		public function listarCategorias():void
		{
			swizDispatcher(new AutomovelEvent(AutomovelEvent.LISTAR_CATEGORIAS));
		}
		
		public function listarModelos():void
		{
			swizDispatcher(new AutomovelEvent(AutomovelEvent.LISTAR_MODELOS));
		}
		
		public function listarCombustiveis():void
		{
			swizDispatcher(new AutomovelEvent(AutomovelEvent.LISTAR_COMBUSTIVEIS));
		}
		
		public function listarAcessorios():void
		{
			swizDispatcher(new AcessorioEvent(AcessorioEvent.LIST));
		}
	}
}