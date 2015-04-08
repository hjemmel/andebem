package br.com.andebem.event
{
	import br.com.andebem.event.cadastro.CadastroEvent;
	
	public class ModeloEvent extends CadastroEvent
	{
		public static const LIST:String = "listModelos";
		public static const GET:String = "getModelos";
		public static const CREATE:String = "createModelos";
		public static const UPDATE:String = "updateModelos";
		public static const DELETE:String = "deleteModelos";
		
		public function ModeloEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
	}
}