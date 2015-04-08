package br.com.andebem.helper
{
	import mx.logging.AbstractTarget;
	import mx.logging.LogEvent;

	import org.swizframework.utils.logging.AbstractSwizLoggingTarget;
	import org.swizframework.utils.logging.SwizLogEvent;

	[DefaultProperty("target")]
	public class SwizLoggingTarget extends AbstractSwizLoggingTarget
	{
		public var target:AbstractTarget;

		public function SwizLoggingTarget()
		{
			super();
		}

		protected override function logEvent(event:SwizLogEvent):void
		{
			target.logEvent(new LogEvent(event.message, event.level));
		}

		protected override function logHandler(event:SwizLogEvent):void
		{
			target.logEvent(new LogEvent(event.message, event.level));
		}
	}
}