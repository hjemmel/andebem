package br.com.andebem.event.cadastro
{
	import flash.events.Event;
	
	import mx.collections.IList;
	
	public class CadastroEvent extends Event
	{
		public static const LIST:String = "list";
		public static const GET:String = "get";
		public static const CREATE:String = "create";
		public static const UPDATE:String = "update";
		public static const DELETE:String = "delete";
		
		public var vo:Object;
		public var listaVOs:IList;

		public function CadastroEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		
		public override function clone():Event
		{
			var event:CadastroEvent = new CadastroEvent(type, bubbles, cancelable);
			
			for (var p:String in this)
			{
				event[p] = this[p];
			}
			
			return event;
		}
	}
}