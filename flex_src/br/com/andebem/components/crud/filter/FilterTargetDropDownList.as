package br.com.andebem.components.crud.filter
{
	import libutilflex.targets.spark.TargetDropDownList;
	
	public class FilterTargetDropDownList extends TargetDropDownList implements IFilter
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
			return (getData()!=null)?getData()[labelField]:"";
		}
	}
}