package br.com.andebem.helper
{
	
	import flash.errors.IOError;
	import flash.events.DataEvent;
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.events.IOErrorEvent;
	import flash.events.ProgressEvent;
	import flash.events.SecurityErrorEvent;
	import flash.net.FileReference;
	import flash.net.URLRequest;
	import flash.net.URLRequestMethod;
	import flash.net.URLVariables;
	import flash.net.navigateToURL;
	
	import mx.controls.Alert;
	import mx.controls.ProgressBar;
	
	/**
	 * Disparado quando o usuário seleciona um arquivo para upload.
	 * @eventType flash.events.Event.SELECT
	 */
	[Event(name="select", type="flash.events.Event")]
	/**
	 * Disparado ao longo do download do arquivo.
	 * @eventType flash.events.ProgressEvent.PROGRESS
	 */
	[Event(name="progress", type="flash.events.ProgressEvent")]
	/**
	 * Disparado ao completar o download/upload.
	 * @eventType flash.events.Event.COMPLETE
	 */
	[Event(name="complete", type="flash.events.Event")]
	/**
	 * Disparado se algum erro ocorre na operação de download/upload.
	 * @eventType flash.events.IOErrorEvent.IO_ERROR
	 */
	[Event(name="ioError", type="flash.events.IOErrorEvent")]
	/**
	 * Disparado se ocorre algum erro de segurança.
	 * @eventType flash.events.SecurityErrorEvent.SECURITY_ERROR
	 */
	[Event(name="securityError", type="flash.events.SecurityErrorEvent")]
	
	/**
	 * Disparado quando dados são retornados do servidor após upload.
	 * @eventType  flash.events.DataEvent.UPLOAD_COMPLETE_DATA
	 */
	[Event(name="uploadCompleteData", type="flash.events.DataEvent")]
	
	[Bindable]
	/**
	* 
	* Classe responsável por fazer download e upload de arquivos
 	* para o framework TiEng de forma genérica através de um servlet via POST.
	* 
	* @author Rafael M. Martinelli
	* @see flash.events.EventDispatcher
	* @see br.com.dclick.utils.FileDownload
	* @see br.com.dclick.utils.FileUpload
	* @playerversion
	* 
	* @includeExample FileDownload.mxml -noswf
	* @includeExample FileUpload.mxml -noswf
	*/
	public class DownloadUploadManager extends EventDispatcher
	{
		//**********CONSTANTES**************
		
		public static const UPLOAD:String = "UPLOAD";
		public static const DOWNLOAD:String = "DOWNLOAD";
		
		
		// Tamanho maximo do arquivo suportado pelo servidor.
		private const MAX_UPLOAD_SIZE:Number = 104857600;
		
	    private var _fileReference:FileReference;
	    private var _uploadEnabled:Boolean = false
	    private var _progressBarMessage:String;
	    private var _progressBar:ProgressBar;
	    private var _maxUploadSize:Number = MAX_UPLOAD_SIZE;
	    
	    /**
	     * Cria uma nova instância do FileReference e o listeners disparados
	     * pelo o FielReference.
	     * 
	     *  Modificação : Foi passado como parâmetro opcional o FileReference para o tratamento de 
	     *  upload de múltiplos arquivos
	     * 	Autor : Pettine Data : 25/06/07
	     */	    
	    public function DownloadUploadManager(type:String, file:FileReference=null)
	    {
	    	if(file==null)
	    	{
		    	_fileReference = new FileReference();
	    	}
	    	else
	    	{
		    	_fileReference=file;
	    	}
	    	if (type == DownloadUploadManager.DOWNLOAD)
	    	{
		    	fileReference.addEventListener(Event.SELECT, selectDownloadHandler);
	    	}
	    	else
	    	{
	    		fileReference.addEventListener(Event.SELECT, selectUploadHandler);
	    	}
	        fileReference.addEventListener(Event.OPEN, openHandler);
	        fileReference.addEventListener(ProgressEvent.PROGRESS, progressHandler);
	        fileReference.addEventListener(Event.COMPLETE, completeHandler);
	      	fileReference.addEventListener(IOErrorEvent.IO_ERROR, ioErrorHandler);
	      	fileReference.addEventListener(SecurityErrorEvent.SECURITY_ERROR, securityErrorHandler);
	      	fileReference.addEventListener(DataEvent.UPLOAD_COMPLETE_DATA, uploadCompleteDataHandler);
	    }
	    
	    /**
	     * Cancela Operacao o download ou upload.
	     */	    
	    public function cancel():void {
            fileReference.cancel();
            progressBar.visible = false;
            dispatchEvent(new Event(Event.CANCEL));
        }
		
		/**
		 * Start o download do arquivo chamando um servlet via post.
		 * 
		 * @param parameters Objeto que será assado na URL do servlet
		 * @example Exemplo de construção de um objeto no parameter
		 * <listing version="3.0" >
		 * var obj:Object = new Object(); 
		 * var.PARAM1 = "param1"; 
		 * var.PARAM2 = 10; 
		 * //Os objetos serão passados como ?PARAM1=param1&PARAM2=10
		 * </listing> 
		 * @param suggestedFileName Arquivo sugerido na caixa de diálogo de download do browser.
		 * @param fileName Nome do arquivo do download. O parametro passado no servlet é ARQUIVO.
		 * @param servlet URL completa do servlet que será chamado.
		 * @param controller Nome do controlador. Caso não passado será o controlador default do servlet.
		 * @param service Nome da atividade. Caso não passado será a atividade default do servlet.
		 * 
		 */		 
		public function download(parameters:Array, suggestedFileName:String, servlet:String):void
		{
			var request:URLRequest
			if (parameters.length > 0)
			{
				request = generateRequest(servlet, parameters)
			}
			else
			{
				request = generateRequest(servlet)
			}
			
			fileReference.download(request, suggestedFileName);
		}
		
		/**
		 * Carrega o arquivo em uma janela do browser chamando um servlet via post.
		 * 
		 * @param parameters Objeto que será assado na URL do servlet
		 * @example Exemplo de construção de um objeto no parameter
		 * <listing version="3.0" >
		 * var obj:Object = new Object(); 
		 * var.PARAM1 = "param1"; 
		 * var.PARAM2 = 10; 
		 * //Os objetos serão passados como ?PARAM1=param1&PARAM2=10
		 * </listing> 
		 * @param suggestedFileName Arquivo sugerido na caixa de diálogo de download do browser.
		 * @param fileName Nome do arquivo do download. O parametro passado no servlet é ARQUIVO.
		 * @param servlet URL completa do servlet que será chamado.
		 * @param controller Nome do controlador. Caso não passado será o controlador default do servlet.
		 * @param service Nome da atividade. Caso não passado será a atividade default do servlet.
		 * 
		 */		 
		public function navigator(parameters:Array, suggestedFileName:String, servlet:String):void
		{
			var request:URLRequest = generateRequest(servlet, parameters)
			
			navigateToURL(request,"_blank");
		}
		
		/**
		 * Gera o request que será usado pelos métodos download e upload.
		 * @param servlet
		 * @param controller
		 * @param service
		 * @param parameters
		 * @param fileName
		 * @return 
		 * 
		 */		
		public function generateRequest(servlet:String, parameters:Array = null):URLRequest
		{
			var request:URLRequest = new URLRequest();
            var urlVariables:String = "";
            
            request.url = servlet;
            request.method = URLRequestMethod.POST;
            
            if (parameters != null)
            {
	            var obj:Object;
	            for (var i:int = 0; i < parameters.length; i++)
				{	
					obj = parameters[i];
					for (var s:String in obj)
					{
					    urlVariables = urlVariables + s + "=" + escape(obj[s]) + "&";
					}
				}
				
				
				//tira ultimo &
				if (urlVariables.slice(urlVariables.length-1,urlVariables.length) == "&")
				{
					urlVariables = urlVariables.slice(0,urlVariables.length - 1);
				}
	            
	            request.data = new URLVariables(urlVariables);
            }
            
            return request;
		}
			
		/**
		 * Abre a caixa de seleçào para o uisuário escolher o arquivo de upload
		 * @param filters Array de Filters para restringir as extensões que o usuário pode escolher
		 * @default null
		 * 
		 */		
		public function browse(filters:Array = null):void
		{
            fileReference.browse(filters);
		}
			
		/**
		 * Evento disparado ao selecionar um arquivo
		 * @param event
		 */		
		private function selectUploadHandler(event:Event):void
		{	
			var fileSize:Number = 0;
			try 
			{
				fileSize = fileReference.size;
			}
			catch (error:IOError)
			{		
				fileSize = 0;		
			}
			
			uploadEnabled = false;
			if (fileSize <= 0)
			{
				Alert.show("Arquivo inválido");
				cancel();
				
			}
			else if (fileSize > maxUploadSize)
			{
				Alert.show("Arquivo inválido");
				cancel();
			}
			else
			{
				uploadEnabled = true;
				dispatchEvent(new Event(Event.SELECT));
			}
		}
		
		private function selectDownloadHandler(event:Event):void
		{
			dispatchEvent(new Event(Event.SELECT));
		}
		
		/**
		 * Start o upload de um arquivo chamando um servlet via post.
		 * @param servlet URL completa do servlet que será chamado.
		 * @param controller Nome do controlador. Caso não passado será o controlador default do servlet.
		 * @param service Nome da atividade. Caso não passado será a atividade default do servlet.
		 * @param parameters Objeto que será assado na URL do servlet.
		 */		
		 
		public function upload(servlet:String, parameters:Object = null):void
		{
			var fileSize:Number = 0;
			try 
			{
				 fileSize = fileReference.size;
			}
			catch (error:IOError)
			{				
				fileSize = 0;
			}
			
			if (fileSize <= 0)
			{
				Alert.show("Arquivo inválido");
				cancel();
				
			}
			else if (fileSize > maxUploadSize)
			{
				Alert.show("O tamanho máximo do arquivo suportado pelo sistema é " + ((maxUploadSize / 1024)/1024) + " MB.", "Erro");
				fileReference.cancel();
			}
			else
			{
				var urlVariables:String = "";
				
				for (var i:String in parameters)
				{
				    urlVariables = urlVariables + i + "=" + escape(parameters[i]) + "&";
				}
				
				var request:URLRequest = new URLRequest();
				request.url = servlet + "?" + urlVariables;
				
				fileReference.upload(request);
			}
		}
			
		/**
		 * Método disparado ao abrir a caixa de escolha de arquivo. Coloca o ProgressBar visivel.
		 * @param event
		 */			
		private function openHandler(event:Event):void
	    {
	    	progressBar.visible = true;
	        progressBar.label = progressBarMessage +  " %3%%";
	    }
		
		/**
		 * Método chamado ao longo do download do arquivo.
		 * @param event
		 * 
		 */		
		private function progressHandler(event:ProgressEvent):void
	    {
	        progressBar.setProgress(event.bytesLoaded, event.bytesTotal);
	        dispatchEvent(event);
	    }

		/**
		 * Método disparado ao completar o download. Coloca o ProgressBar invisivel.
		 * @param event
		 * 
		 */		
		private function completeHandler(event:Event):void
	    {
	    	uploadEnabled = false;
	        progressBar.setProgress(100, 100);
	       	//progressBar.visible = false;
	        dispatchEvent(new Event(Event.COMPLETE));
	        
	    }
	    /**
	     * Método disparado se algum erro ocorre nas operações de download ou upload.
	     * @param event
	     * 
	     */	    
	    private function ioErrorHandler(event:IOErrorEvent):void
	    {
	    	dispatchEvent(new IOErrorEvent(IOErrorEvent.IO_ERROR));
	    }
	    
	    /**
	     * Método disparado se ocorre algum erro de segurança.
	     * @param event
	     * 
	     */	    
	    private function securityErrorHandler(event:SecurityErrorEvent):void
	    {
	    	dispatchEvent(new IOErrorEvent(IOErrorEvent.IO_ERROR));
	    }
	    
	    /**
	     * Método disparado quando dados são retornados do servidor após upload
	     * @param event
	     * 
	     */	    
	    private function uploadCompleteDataHandler(event:DataEvent):void
	    {
	    	dispatchEvent(event);
	    }
	    
	    //GETs e SETs
	    /**
	     * Progress bar que indica o andamento do upload ou download.
	     * @see mx.controls.ProgressBar
	     */	    
	    public function get progressBar():ProgressBar
	    {
	    	return this._progressBar;
	    }
	    
	    public function set progressBar(pb:ProgressBar):void
	    {
	    	this._progressBar = pb;
	    	this._progressBar.mode = "manual";
	    }
	    
	    /**
	     * Indica se o processod e upload/download está disponivel.
	     * Se o compoennte estiver fazendo upload/download está propriedade é falsa.
	     * 
	     */	    
	    public function get uploadEnabled():Boolean
	    {
	    	return this._uploadEnabled;
	    }
	    public function set uploadEnabled(b:Boolean):void
	    {
	    	this._uploadEnabled = b;
	    }
	    
	    /**
	     * Retorna a referencia do FileReference.
	     * @see flash.net.FileReference
	     */	    
	    public function get fileReference():FileReference
	    {
	    	return this._fileReference;
	    }
	    
	    /**
	     * Mensagem que será mostrada no ProgressBar
	     */	    
	    public function get progressBarMessage():String
	    {
	    	return this._progressBarMessage;
	    }
	    public function set progressBarMessage(s:String):void
	    {
	    	this._progressBarMessage = s;
	    }
	    
	    /**
	     * 
	     * @return Tamanho máximo de upload
	     * 
	     */	    
	    public function get maxUploadSize():Number
	    {
	 		return _maxUploadSize;   	
	    }
	    
	    public function set maxUploadSize(value:Number):void
	    {
	 		_maxUploadSize = 
	 			(value > 0 && value <= MAX_UPLOAD_SIZE) ? value : MAX_UPLOAD_SIZE;	 			
	    }
	}
}