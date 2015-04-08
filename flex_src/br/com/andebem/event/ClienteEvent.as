package br.com.andebem.event
{
	import br.com.andebem.event.cadastro.CadastroEvent;
	
	public class ClienteEvent extends CadastroEvent
	{
		public static const LIST:String = "listCliente";
		public static const GET:String = "getCliente";
		public static const CREATE:String = "createCliente";
		public static const UPDATE:String = "updateCliente";
		public static const DELETE:String = "deleteCliente";
		
		public static const LIST_TIPO_PESSOA:String = "listTipoPessoa";
		public static const LIST_TIPO_CIDADE:String = "listCidade";
		
		public function ClienteEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
	}
}