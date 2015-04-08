package br.com.andebem.event
{
	import br.com.andebem.domain.Automovel;
	import br.com.andebem.domain.Cliente;
	import br.com.andebem.event.cadastro.CadastroEvent;
	
	import flash.events.Event;
	
	import mx.collections.ArrayCollection;
	
	public class AutomovelEvent extends CadastroEvent
	{
		public static const LIST:String = "listAutomoveis";
		public static const GET:String = "getAutomoveis";
		public static const CREATE:String = "createAutomoveis";
		public static const UPDATE:String = "updateAutomoveis";
		public static const DELETE:String = "deleteAutomoveis";
		
		public static const SALVAR_AUTOMOVEL:String = "salvarAutomovel";
		public static const TROCAR_STATUS:String = "trocarStatus";
		public static const LISTAR_CATEGORIAS:String = "listarCategorias";
		public static const LISTAR_MODELOS:String = "listarModelos";
		public static const LISTAR_COMBUSTIVEIS:String = "listarCombustiveis";
		public static const LISTAR_ALTERACOES:String = "listarAlteracoes";
		public static const SALVAR_ALTERACOES:String = "salvarAlteracoes";
		public static const LOCAR_AUTOMOVEL:String = "locarAutomovel";
		public static const FINALIZAR_LOCACAO:String = "finalizarLocacao";
		public static const LISTAR_ULTIMA_LOCACAO:String = "listarUltimaLocacao";
		public static const LISTAR_ULTIMA_LOCACAO_REFRESH:String = "listarUltimaLocacaoRefresh";
		
		public var cliente:Cliente;
		public var automovel:Automovel;
		
		public function AutomovelEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
	}
}