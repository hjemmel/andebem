package br.com.andebem.components
{
	import br.com.andebem.event.LoginEvent;

	import flash.events.MouseEvent;

	import mx.events.ValidationResultEvent;
	import mx.validators.StringValidator;

	import spark.components.Button;
	import spark.components.SkinnableContainer;
	import spark.components.TextInput;

	[Event(name="login", type="br.com.andebem.event.LoginEvent")]
	[SkinState("invalidLogin")]
	[SkinState("normal")]
	public class LoginBox extends SkinnableContainer
	{

		public var currentSkinState:String = "normal";

		[SkinPart(required="true")]
		public var usernameInput:TextInput;

		[SkinPart(required="true")]
		public var passwordInput:TextInput;

		[SkinPart(required="true")]
		public var okButton:Button;

		[Bindable]
		public var usernameError:String;

		[Bindable]
		public var passwordError:String;

		protected var stringValidator:StringValidator;

		protected override function partAdded(partName:String, instance:Object):void
		{
			super.partAdded(partName, instance);
			if(instance == okButton)
			{
				Button(instance).addEventListener(MouseEvent.CLICK, onClickHandler);
			}
		}

		private function onClickHandler(event:MouseEvent):void
		{
			if(validLoginData(usernameInput.text, passwordInput.text))
			{
				dispatchEvent(new LoginEvent(LoginEvent.LOGIN, usernameInput.text, passwordInput.text));
				currentSkinState = "normal";
			}
			else
			{
				currentSkinState = "invalidLogin";
			}
			invalidateSkinState();
		}

		public function validLoginData(username:String, password:String):Boolean
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

		protected override function partRemoved(partName:String, instance:Object):void
		{
			super.partRemoved(partName, instance);
			if(instance == okButton)
			{
				Button(instance).removeEventListener(MouseEvent.CLICK, onClickHandler);
			}
		}


		protected override function getCurrentSkinState():String
		{
			return currentSkinState;
		}


	}
}