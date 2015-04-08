package br.com.andebem.domain
{
	[Bindable]
	[RemoteClass(alias="br.com.andebem.entity.Status")]
	public class Status
	{
		public function Status(id:Object=null, nome:String=null, disponivel:Boolean=false)
		{
			this.id = id;  
			this.nome = nome;  
			this.disponivel = disponivel;  
		}
		
		public var id:Object;
		public var nome:String;
		public var disponivel:Boolean;
	}
}