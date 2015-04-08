package br.com.andebem.presentation
{
	import br.com.andebem.event.cadastro.CadastroEvent;
	
	import crud.events.CrudActionEvent;
	import crud.templates.defaultcrudtemplate.searchform.events.DefaultCrudSearchFormActionEvent;
	
	import mx.collections.ArrayCollection;

	public class CadastroPresentationModel extends PresentationBase
	{
		public var eventClass:Class;
		
		public function dispatchList():void {
			var listEvent:CadastroEvent = new eventClass(eventClass.LIST);
			swizDispatcher(listEvent);
		}
		
		public function dispatchCreate(event:CrudActionEvent):void {
			var createEvent:CadastroEvent = new eventClass(eventClass.CREATE);
			createEvent.vo = changeVO(event.data);
			swizDispatcher(createEvent);
		}
		
		public function dispatchUpdate(event:CrudActionEvent):void {
			var updateEvent:CadastroEvent = new eventClass(eventClass.UPDATE);
			updateEvent.vo = changeVO(event.data);
			swizDispatcher(updateEvent);
		}
		
		public function dispatchDelete(event:CrudActionEvent):void {
			var deleteEvent:CadastroEvent = new eventClass(eventClass.DELETE);
			deleteEvent.listaVOs = new ArrayCollection(event.data as Array);
			swizDispatcher(deleteEvent);
		}
		
		protected function changeVO(vo:Object):Object
		{
			return vo;
		}
	}
}