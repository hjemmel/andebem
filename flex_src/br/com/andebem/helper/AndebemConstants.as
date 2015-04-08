package br.com.andebem.helper
{
	import br.com.andebem.domain.Status;
	import br.com.andebem.domain.TipoUsuario;

	public class AndebemConstants
	{
		public static const DISPONIVEL_STATUS:Status = new Status(1, "Disponivel", true);
		public static const PASSIVO_LOCACAO_STATUS:Status = new Status(2, "Passivo de Locação", false);
		public static const LOCACAO_STATUS:Status = new Status(3, "Locação", false);
		public static const MANUTENCAO_STATUS:Status = new Status(4, "Manutenção", false);
		
		public static const GERENTE:TipoUsuario = new TipoUsuario(1, "Gerente");
		public static const ATENDENTE:TipoUsuario = new TipoUsuario(2, "Atendente");
		public static const USUARIO:TipoUsuario = new TipoUsuario(3, "Usuário");
		
		public static const LAUDO_DOWNLOAD_URL:String = "LaudoServlet";
		
		public static const RESERVAR:String = "reservar";
		public static const ALUGAR:String = "alugar";
		public static const FINALIZAR:String = "fanilzar";
	}
}