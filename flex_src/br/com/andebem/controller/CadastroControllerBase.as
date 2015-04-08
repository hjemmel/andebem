package br.com.andebem.controller
{
	import br.com.andebem.model.BaseModel;
	
	import crud.collection.CrudCollection;
	
	import mx.collections.ArrayCollection;
	import mx.collections.IList;
	import mx.rpc.events.ResultEvent;
	import mx.rpc.remoting.RemoteObject;

	public class CadastroControllerBase extends ControllerBase
	{
		public var listCollectionProperty:String;
		
		public var listMethod:String = "list";
		public var getMethod:String = "get";
		public var createMethod:String = "insert";
		public var updateMethod:String = "updateGet";
		public var deleteMethod:String = "deleteBatch";
		
		private var _service:RemoteObject;
		public function get service():RemoteObject
		{
			return _service;
		}
		public function set service(value:RemoteObject):void
		{
			_service = value;
		}
		
		private var _model:BaseModel;
		[Bindable]
		public function get model():BaseModel
		{
			return _model;
		}
		public function set model(value:BaseModel):void
		{
			_model = value;
		}
		
		[Bindable]
		public function get listCollection():CrudCollection
		{
			return model[listCollectionProperty] as CrudCollection;
		}
		public function set listCollection(value:CrudCollection):void
		{
			model[listCollectionProperty] = value;
		}
		
		
		public function listService():void {
			serviceCall(service.getOperation(listMethod).send(), listSuccess);
		}
		
		public function getService(vo:Object):void {
			serviceCall(service.getOperation(getMethod).send(vo), getSuccess);
		}
		
		public function createService(vo:Object):void {
			serviceCall(service.getOperation(createMethod).send(vo), createSuccess);
		}
		
		public function updateService(vo:Object):void {
			serviceCall(service.getOperation(updateMethod).send(vo), updateSuccess);
		}
		
		public function deleteService(listaVOs:IList):void {
			serviceCall(service.getOperation(deleteMethod).send(listaVOs), deleteSuccess);
		}
		
		// ##### handlers ####
		protected function listSuccess(e:ResultEvent):void {
			listCollection = new CrudCollection(ArrayCollection(e.result).toArray());
		}
		
		protected function getSuccess(e:ResultEvent):void {
		}
		
		protected function createSuccess(e:ResultEvent):void {
			listCollection.executeAction(e.result);
		}
		
		protected function updateSuccess(e:ResultEvent):void {
			listCollection.executeAction(e.result);
		}
		
		protected function deleteSuccess(e:ResultEvent):void {
			listCollection.executeAction();
		}
	}
}