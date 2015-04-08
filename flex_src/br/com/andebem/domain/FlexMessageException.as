package br.com.andebem.domain
{
	[Bindable]
	[RemoteClass(alias="br.com.andebem.exception.FlexMessageException")]
	public class FlexMessageException
	{
		public var stackTraceMessage : String;
		public var message : String;
	}
}