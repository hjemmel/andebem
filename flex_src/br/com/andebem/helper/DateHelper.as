package br.com.andebem.helper
{
	public class DateHelper
	{
		public static const millisecondsPerDay:int = 1000 * 60 * 60 * 24;
		
		public static function getDataDias(dias:int):Date
		{
			return new Date(new Date().getTime() - ( dias * millisecondsPerDay ));
		}
		
	}
}