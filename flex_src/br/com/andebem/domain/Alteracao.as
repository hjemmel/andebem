package br.com.andebem.domain
{
	[Bindable]
	[RemoteClass(alias="br.com.andebem.entity.Alteracao")]
	public class Alteracao
	{
		public function Alteracao(value:Object = null)
		{
			if(value != null)
			{
				for(var attr:String in value)
				{
					if(!hasOwnProperty(attr))
					{
						throw new Error("Alteracao não tem o atributo: " + attr);
					}
					
					this[attr] = value[attr];
				}
			}
		}

		public var id:Object;
		public var descricao:String;
		public var ativa:Boolean;
		public var automovel:Automovel;
		
		[Transient]
		public var isNew:Boolean = false;

		[Transient]
		public function get selected():Boolean
		{
			return ativa;
		}

		public function set selected(value:Boolean):void
		{
			ativa = value;
		}

	}
}