package br.com.andebem.event
{
	import br.com.andebem.domain.Usuario;

	import flash.events.Event;

	public class LoginEvent extends Event
	{

		public static const LOGIN:String = "login";
		public static const LOGIN_COMPLETE:String = "loginComplete";
		public static const LOGIN_ERROR:String = "loginError";

		private var _usuario:String;
		private var _senha:String;

		public function get usuario():String
		{
			return _usuario;
		}

		public function get senha():String
		{
			return _senha;
		}

		public function LoginEvent(type:String, usuario:String = null, senha:String = null, bubbles:Boolean = false, cancelable:Boolean = false)
		{
			super(type, bubbles, cancelable);
			_usuario = usuario;
			_senha = senha;
		}

		public override function clone():Event
		{
			return new LoginEvent(type, usuario, senha, bubbles, cancelable);
		}
	}
}