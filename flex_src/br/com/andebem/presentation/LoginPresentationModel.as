package br.com.andebem.presentation
{
	import br.com.andebem.domain.Usuario;
	import br.com.andebem.event.LoginEvent;
	
	import flash.events.IEventDispatcher;
	import flash.net.sendToURL;
	
	import mx.events.ValidationResultEvent;
	import mx.validators.StringValidator;
	
	public class LoginPresentationModel extends PresentationBase
	{
		
		[Bindable]
		public var usernameError:String;
		
		[Bindable]
		public var passwordError:String;
		
		[Bindable]
		public var loginInProgress:Boolean = false;
		
		public function login(username:String, password:String):void
		{
			if( validLoginData(username, password) )
			{
				var event:LoginEvent = new LoginEvent(LoginEvent.LOGIN, username, password);
				
				swizDispatcher(event);
				
				loginInProgress = true;
			}
		}
		
		protected var stringValidator:StringValidator;
		
		private function validLoginData(username:String, password:String):Boolean
		{
			var valid:Boolean = false;
			
			stringValidator ||= new StringValidator();
			
			var stringValidation:ValidationResultEvent = stringValidator.validate(username);
			var validUserName:Boolean = stringValidation.results == null;
			usernameError = (validUserName) ? "" : "Insira seu usuário, por favor!";
			
			stringValidation = stringValidator.validate(password);
			var validPassword:Boolean = stringValidation.results == null;
			passwordError = (validPassword) ? "" : "Insira sua senha, por favor!";
			
			return validUserName && validPassword;
		}
		
		[EventHandler("LoginEvent.LOGIN_ERROR")]
		public function onLoginError():void
		{
			loginInProgress=false;
		}
		
		[EventHandler("LoginEvent.LOGIN_COMPLETE")]
		public function onLoginComplete():void
		{
			loginInProgress=false;
		}
	}
}