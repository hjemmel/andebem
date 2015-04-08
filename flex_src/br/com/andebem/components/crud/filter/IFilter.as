package br.com.andebem.components.crud.filter
{
	public interface IFilter
	{
		function set field(value:String):void;
		function get field():String;
		function get fieldValue():String;
		function clean():void;
	}
}