package br.com.andebem.presentation
{
	import br.com.andebem.domain.Automovel;
	import br.com.andebem.domain.Cliente;
	import br.com.andebem.domain.Status;
	import br.com.andebem.event.AutomovelEvent;
	import br.com.andebem.event.ClienteEvent;
	import br.com.andebem.event.cadastro.CadastroEvent;
	import br.com.andebem.helper.AndebemConstants;
	import br.com.andebem.model.AutomovelModel;
	import br.com.andebem.model.ClienteModel;
	
	import mx.collections.ArrayCollection;
	
	[Bindable]
	public class LocacaoPresentationModel extends PresentationBase
	{
		[Inject]
		public var autoModel:AutomovelModel;
		
		[Inject]
		public var clienteModel:ClienteModel;
		
		public function colocarComoPassivo(automovel:Automovel):void
		{
			trocarStatus(automovel, AndebemConstants.PASSIVO_LOCACAO_STATUS);
		}
		
		public function colocarComoDisponivel(automovel:Automovel):void
		{
			trocarStatus(automovel, AndebemConstants.DISPONIVEL_STATUS);
		}
		
		public function colocarAutomovelComoManutencao(automovel:Automovel):void
		{
			trocarStatus(automovel, AndebemConstants.MANUTENCAO_STATUS);
		}
		
		private function trocarStatus(automovel:Automovel, status:Status):void
		{
			automovel.status = status;
			
			var updateEvent:AutomovelEvent = new AutomovelEvent(AutomovelEvent.TROCAR_STATUS);
			updateEvent.vo = automovel;
			swizDispatcher(updateEvent);	
		}
		
		public function listarClientes():void
		{
			var listEvent:ClienteEvent = new ClienteEvent(ClienteEvent.LIST);
			swizDispatcher(listEvent);
		}
		
		public function listarAlteracoes(automovel:Automovel):void
		{
			var listEvent:AutomovelEvent = new AutomovelEvent(AutomovelEvent.LISTAR_ALTERACOES);
			listEvent.vo = automovel;
			swizDispatcher(listEvent);
		}
		
		public function locarAutomovel(automovel:Automovel, cliente:Cliente):void
		{
			automovel.status = AndebemConstants.LOCACAO_STATUS;
			
			var updateEvent:AutomovelEvent = new AutomovelEvent(AutomovelEvent.LOCAR_AUTOMOVEL);
			updateEvent.vo = automovel;
			updateEvent.cliente = cliente;
			swizDispatcher(updateEvent);
		}
		
		public function finalizarLocacaoAutomovel(automovel:Automovel):void
		{
			automovel.status = AndebemConstants.DISPONIVEL_STATUS;
			
			var updateEvent:AutomovelEvent = new AutomovelEvent(AutomovelEvent.FINALIZAR_LOCACAO);
			updateEvent.vo = automovel;
			swizDispatcher(updateEvent);
		}
		
		public function salvarAlteracoes(alteracoes:ArrayCollection, automovel:Automovel):void
		{
			var listEvent:AutomovelEvent = new AutomovelEvent(AutomovelEvent.SALVAR_ALTERACOES);
			listEvent.vo = automovel;
			listEvent.listaVOs = alteracoes;
			swizDispatcher(listEvent);
		}
		
		public function listarUltimaLocacao(automovel:Automovel):void
		{
			var listEvent:AutomovelEvent = new AutomovelEvent(AutomovelEvent.LISTAR_ULTIMA_LOCACAO);
			listEvent.vo = automovel;
			swizDispatcher(listEvent);
		}
		
		public function tipoAcaoHabilita(tipoAcao:String, selectedItem:Automovel):Boolean
		{
			var result:Boolean = false;
			
			if( selectedItem==null )
				return result;
			
			switch( tipoAcao )
			{
				case AndebemConstants.RESERVAR:
					if( selectedItem.status.id==AndebemConstants.DISPONIVEL_STATUS.id )
						result = true;
					break;
				case AndebemConstants.ALUGAR:
					if( selectedItem.status.id==AndebemConstants.PASSIVO_LOCACAO_STATUS.id )
						result = true;
					break;
				case AndebemConstants.FINALIZAR:
					if( selectedItem.status.id==AndebemConstants.LOCACAO_STATUS.id )
						result = true;
					break;
			}
			
			return result;
		}
	}
}