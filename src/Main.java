import java.io.FileOutputStream;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.List;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import br.com.andebem.dto.GraficoDTO;
import br.com.andebem.entity.Automovel;
import br.com.andebem.entity.Categoria;
import br.com.andebem.entity.Modelo;
import br.com.andebem.entity.Status;
import br.com.andebem.entity.TipoUsuario;
import br.com.andebem.entity.Usuario;
import br.com.andebem.service.interfaces.AutomovelService;
import br.com.andebem.service.interfaces.CarroService;
import br.com.andebem.service.interfaces.RelatorioService;
import br.com.andebem.service.interfaces.UsuarioService;
import br.com.andebem.utils.GeraRelatorioExcel;

public class Main {

	// @Autowired
	// private CarroService service;

	/**
	 * @param args
	 * @throws Exception 
	 */
	public static void main(String[] args) throws Exception {
		ApplicationContext context = new ClassPathXmlApplicationContext(
				"applicationContext.xml");

		
//		Automovel auto = new Automovel();
//		auto.setAno(2009);
//		auto.setChassi("1212121231as23");
//		auto.setCombustivel("Gasolina");
//		auto.setCor("Azul");
//		auto.setData_compra(new Date());
//		auto.setData_insert(new Date());
//		auto.setData_update(new Date());
//		auto.setNum_nota(new Long(12121212));
//		auto.setNum_portas(5);
//		auto.setPlaca("KJS6754");
//		auto.setPreco(15.25);
//		auto.setRenavam("abc123987");
//		Status status = new Status();
//		status.setId(new Long(4));
//		
//		Modelo modelo = new Modelo();
//		modelo.setId(new Long(4));
//		auto.setStatus(status);
//		
//		Categoria categoria = new Categoria();
//		categoria.setId(new Long(3));
//		
//		Usuario usuario = new Usuario();
//		usuario.setId(new Long(1));
//		
//		auto.setModelo(modelo);
//		auto.setCategoria(categoria);
//		auto.setUsuario(usuario);
		
		
		
		
		//AutomovelService service = (AutomovelService) context.getBean("automovelService");
		UsuarioService service = (UsuarioService) context.getBean("usuarioService");
		
		 List<TipoUsuario> list = service.listarTipoUsuario();
		 
		 System.out.println(list.toString());
//
//		Carro carro = new Carro();
//		carro.setAno(2011);
//		carro.setKilometros(15.00);
//		carro.setCor("Preto");
//		carro.setPlaca("KDL-215");
//		carro.setPreco(35.000);
//
//		Acessorio acessorio = new Acessorio();
//		acessorio.setNome("Roda");
//		acessorio.setCarro(carro);
//		List<Acessorio> listAcessorios = new ArrayList<Acessorio>();
//		listAcessorios.add(acessorio);
//		carro.setAcessorios(listAcessorios);
//		carro.getAcessorios();

		// System.out.println(context);

		//service.merge(carro);
		
//		UsuarioService service = (UsuarioService) context.getBean("usuarioService");
//		Usuario user = service.getUsuarioByLogin("hjemmel");
//		System.out.println(user.toString());
		
//		GregorianCalendar calendar = new GregorianCalendar(2011, 01, 01);
//		RelatorioService dao = (RelatorioService) context.getBean("relatorioService");
//		List<GraficoDTO> list = dao.listaLocacoesPorMes(calendar.getTime(), new Date());
//		
//		GeraRelatorioExcel excel = new GeraRelatorioExcel(list);
//		
//		FileOutputStream stream = new FileOutputStream("/Developer/relatorio.xls");
//		excel.getExcel().write(stream);
		//dao.query();
		
		

		// Carro carro = new Carro();
		// carro.setId(new Long(41));
		// service.delete(carro);

		// AnnotationConfiguration config = new AnnotationConfiguration();
		//		
		// config.addAnnotatedClass(Carro.class);
		// config.addAnnotatedClass(Acessorio.class);
		// config.configure();
		// new SchemaExport(config).create(true, true);
	}

	// private void saveCarro(Carro carro){
	// service.save(carro);
	// }

}
