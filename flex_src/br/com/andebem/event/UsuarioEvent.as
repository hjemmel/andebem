package br.com.andebem.event
{
	import br.com.andebem.event.cadastro.CadastroEvent;
	
	public class UsuarioEvent extends CadastroEvent
	{
		public static const LIST:String = "listUsuarios";
		public static const GET:String = "getUsuarios";
		public static const CREATE:String = "createUsuarios";
		public static const UPDATE:String = "updateUsuarios";
		public static const DELETE:String = "deleteUsuarios";
		
		public static const LIST_TIPO_USUARIO:String = "listTipoUsuario";
		
		public function UsuarioEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
	}
}