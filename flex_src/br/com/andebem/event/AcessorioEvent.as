package br.com.andebem.event
{
	import br.com.andebem.event.cadastro.CadastroEvent;
	
	public class AcessorioEvent extends CadastroEvent
	{
		public static const LIST:String = "listAcessorios";
		public static const GET:String = "getAcessorios";
		public static const CREATE:String = "createAcessorios";
		public static const UPDATE:String = "updateAcessorios";
		public static const DELETE:String = "deleteAcessorios";
		
		public function AcessorioEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
	}
}