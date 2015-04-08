package br.com.andebem.event
{
	import br.com.andebem.event.cadastro.CadastroEvent;
	
	public class MarcaEvent extends CadastroEvent
	{
		public static const LIST:String = "listMarcas";
		public static const GET:String = "getMarcas";
		public static const CREATE:String = "createMarcas";
		public static const UPDATE:String = "updateMarcas";
		public static const DELETE:String = "deleteMarcas";
		
		public function MarcaEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
	}
}