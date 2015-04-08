package br.com.andebem.helper
{
	import mx.controls.Alert;

	public class ErrorManager
	{

		public static function showError(msg:String):void
		{
			Alert.show(msg, "Error");
		}

	}
}