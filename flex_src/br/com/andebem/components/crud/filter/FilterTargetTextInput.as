package br.com.andebem.components.crud.filter
{
	import libutilflex.targets.spark.TargetTextInput;
	
	public class FilterTargetTextInput extends TargetTextInput implements IFilter
	{
		public var _field:String;
		
		public function get field():String
		{
			return _field;
		}
		
		public function set field(value:String):void
		{
			_field = value;
		}
		
		public function get fieldValue():String
		{
			return getData() as String;
		}
	}
}