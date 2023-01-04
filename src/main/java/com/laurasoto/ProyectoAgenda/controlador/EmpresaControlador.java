package com.laurasoto.ProyectoAgenda.controlador;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import com.laurasoto.ProyectoAgenda.modelos.Ciudad;
import com.laurasoto.ProyectoAgenda.modelos.Empresa;
import com.laurasoto.ProyectoAgenda.modelos.Region;
import com.laurasoto.ProyectoAgenda.modelos.Servicio;
import com.laurasoto.ProyectoAgenda.modelos.Usuario;
import com.laurasoto.ProyectoAgenda.servicios.CiudadServicio;
import com.laurasoto.ProyectoAgenda.servicios.EmpresaServicio;
import com.laurasoto.ProyectoAgenda.servicios.RegionServicio;
import com.laurasoto.ProyectoAgenda.servicios.Servicio1Servicio;
import com.laurasoto.ProyectoAgenda.servicios.UsuarioServicio;
import com.laurasoto.ProyectoAgenda.utiles.Funciones;

@Controller
public class EmpresaControlador {
	private final EmpresaServicio empresaServicio;
	private final Servicio1Servicio servicio1Servicio;
	private final UsuarioServicio usuarioServicio;
	private final CiudadServicio ciudadServicio;
	private final RegionServicio regionServicio;
	
	public EmpresaControlador(EmpresaServicio empresaServicio, Servicio1Servicio servicio1Servicio,
			UsuarioServicio usuarioServicio, CiudadServicio ciudadServicio, RegionServicio regionServicio){
		this.empresaServicio = empresaServicio;
		this.servicio1Servicio = servicio1Servicio;
		this.usuarioServicio = usuarioServicio;
		this.ciudadServicio = ciudadServicio;
		this.regionServicio = regionServicio;
	}
	
	@GetMapping("/planes")
	public String elegirPlan(Model model, HttpSession session){
		return "membresias";
	}
	
	@PostMapping("/search")
	public String buscaServicio(@RequestParam("selectReg") Long selectReg,@RequestParam("selectCiud") Long selectCiud,
	@RequestParam("servicio") String servicio){
		return "redirect:/search/"+selectReg+"/"+ selectCiud+"/"+ servicio;
	}
	
	@GetMapping("/search/{regionId}/{ciudadId}/{servicio}")
	public String formServicio(@PathVariable("servicio") String servicio, @PathVariable("regionId") Long regionId, @PathVariable("ciudadId") Long ciudadId,
	HttpSession session, Model model){
		if((Long) session.getAttribute("usuarioId") == null){
			return"redirect:/";
		}
		Usuario usuario = usuarioServicio.findById((Long) session.getAttribute("usuarioId"));
		model.addAttribute("usuario", usuario);
		Servicio servicioRequerido = servicio1Servicio.obtieneServicioPorServicioOfrecido(servicio);
		if(servicioRequerido == null){
			model.addAttribute("errorServicio", "No encontramos el servicio que estabas buscando");
			return"servicio";
		}
		List<Empresa> empresas = servicioRequerido.getEmpresas();
		
		List<Empresa> empresasFiltradas = new ArrayList<>();
		for (Empresa empresa : empresas) {
			if(empresa.getCiudad() == ciudadServicio.findById(ciudadId)){
				empresasFiltradas.add(empresa);
			}
		}
		if(empresasFiltradas.size() == 0){
			model.addAttribute("errorNoHayEmpresa", "Lo sentimos, en esa ciudad no se encuentra el servicio que buscas");
		}
		model.addAttribute("empresasFiltradas", empresasFiltradas);
		return"servicio";
	}
	//se puede tener dos empresas con el mismo nombre?
	@GetMapping("/planes/new")
	public String nuevoPlan(@ModelAttribute("empresa") Empresa empresa, HttpSession session, Model model){
		if((Long) session.getAttribute("usuarioId") == null){
			return"redirect:/";
		}
		List<Region> regiones = regionServicio.regionesTodas();
		String resultadoJson = new Funciones().regionesToJson(regiones);
		Usuario usuario = usuarioServicio.findById((Long) session.getAttribute("usuarioId"));
		List<Ciudad> ciudades = ciudadServicio.ciudadesMostrar(empresa);
		
		model.addAttribute("regiones", regiones);
		model.addAttribute("ciudades", ciudades);
		model.addAttribute("usuario", usuario);
		model.addAttribute("regionesJson", resultadoJson);
		return"creaEmpresa";
		
	}
	//validacion en crear empresa, si elige premium puede tener mas de un servicio
	@PostMapping("/planes/new")
	public String formPlanFree(@Valid @ModelAttribute("empresa") Empresa empresa, BindingResult result, HttpSession session, Model model){
		if(result.hasErrors()){
			return"creaEmpresa";
		}
		if(empresaServicio.getEmpresaPorNombre(empresa.getNombre()) != null){
			model.addAttribute("error", "no puedes usar ese nombre porque ya existe");
			return"creaEmpresa";
		}
		Usuario usuarioAdmin = usuarioServicio.findById((Long) session.getAttribute("usuarioId"));
			empresa.setUsuarioAdmin(usuarioAdmin);
			empresaServicio.crear(empresa);
			return"redirect:/plan/"+empresa.getId();
	}
	

	@GetMapping("/plan/{idEmpresa}")
	public String empresaDetalle(@ModelAttribute("empresa") Empresa empresaEditar ,@PathVariable("idEmpresa") Long idEmpresa, HttpSession session, Model model){
		if((Long) session.getAttribute("usuarioId") == null){
			return"redirect:/";
		}
		List<Region> regiones = regionServicio.regionesTodas();
		String resultadoJson = new Funciones().regionesToJson(regiones);
		Usuario usuario = usuarioServicio.findById((Long) session.getAttribute("usuarioId"));
		Empresa empresa = empresaServicio.findById(idEmpresa);
		List<Ciudad> ciudades = ciudadServicio.ciudadesMostrar(empresa);
		List<Servicio> servicios = servicio1Servicio.traerTodo();
		List<Servicio> serviciosNotEmpresa = servicio1Servicio.serviciosNoContieneEmpresa(empresa);
		List<Ciudad>  ciudadesNotEmpresa = ciudadServicio.ciudadesNoContieneEmpresa(empresa);

		
		model.addAttribute("ciudadesNotEmpresa", ciudadesNotEmpresa);
		model.addAttribute("serviciosNotEmpresa", serviciosNotEmpresa);
		model.addAttribute("servicios", servicios);
		model.addAttribute("empresa", empresa);
		model.addAttribute("usuario", usuario);
		model.addAttribute("regiones", regiones);
		model.addAttribute("regionesJson", resultadoJson);
		model.addAttribute("ciudades", ciudades);
		return "showEmpresa";
	}

	@PostMapping("/plan/{idEmpresa}")
	public String setServicio(@PathVariable("idEmpresa") Long idEmpresa, @RequestParam("servicio") String servicioId, 
	@RequestParam(required = false, name = "nuevoServicio") String nuevoServicio, HttpSession session, Model model){
		Empresa empresa = empresaServicio.findById(idEmpresa);
		if(!servicioId.equals("opcionEspecial")){
			Long IdServicio = Long.parseLong(servicioId);
			Servicio servicio = servicio1Servicio.findById(IdServicio);
			empresa.setServicios(servicio);
			empresaServicio.crear(empresa);
			return "redirect:/plan/"+ idEmpresa;
		}

		/* if(nuevoServicio == null || nuevoServicio.isEmpty()){
			//model.addAttribute("error","el ")
		System.out.println("errorrrr aqui");
			
		} */
		//agregar otra validacion por si el input se rellena con numeros, no se puede da error!
		//validacion el administrador tiene que validar que la categoria nueva sea una categoria valida, 
		//que sean pasadas por la dministracion para tener visto bueno
		servicio1Servicio.crear(
			Servicio.builder()
			.servicioOfrecido(nuevoServicio)
			.empresas(Arrays.asList(empresa))
			.duracionServicio(0l)
			.duracionJornada(0l)
			.build()
		);
		return "redirect:/plan/"+ idEmpresa;
	}

	@PostMapping("plan/{idEmpresa}/edit")
	public String editaEmpresaForm(@Valid @ModelAttribute("empresa") Empresa empresaEditar, BindingResult result, @PathVariable("idEmpresa") Long idEmpresa,
	HttpSession session){
		if(result.hasErrors()){
			return"editaEmpresa";
		}

		Usuario usuarioAdmin = usuarioServicio.findById((Long) session.getAttribute("usuarioId"));
		empresaEditar.setId(idEmpresa);
		empresaEditar.setUsuarioAdmin(usuarioAdmin);
		empresaServicio.crear(empresaEditar);
		return"redirect:/plan/"+idEmpresa;
	}

	@GetMapping("plan/{idEmpresa}/edit")
	public String editaEmpresa(@ModelAttribute("empresa") Empresa empresa, @PathVariable("idEmpresa") Long idEmpresa, HttpSession session, Model model){
		if((Long) session.getAttribute("usuarioId") == null){
			return"redirect:/";
		}

		List<Region> regiones = regionServicio.regionesTodas();
		String resultadoJson = new Funciones().regionesToJson(regiones);
		Empresa empresaAEditar = empresaServicio.findById(idEmpresa);
		List<Ciudad>  ciudadesNotEmpresa = ciudadServicio.ciudadesNoContieneEmpresa(empresaAEditar);
		List<Ciudad> ciudades = ciudadServicio.ciudadesMostrar(empresa);
		
		model.addAttribute("regiones", regiones);
		model.addAttribute("empresaAEditar", empresaAEditar);
		model.addAttribute("ciudadesNotEmpresa", ciudadesNotEmpresa);
		model.addAttribute("regionesJson", resultadoJson);
		model.addAttribute("ciudades", ciudades);
		return "editaEmpresa";
	}



	@GetMapping("/delete/{idEmpresa}")
	public String eliminaEmpresa(HttpSession session, @PathVariable("idEmpresa") Long idEmpresa ){
		Empresa empresa = empresaServicio.findById(idEmpresa);
		if((Long) session.getAttribute("usuarioId") == null && (Long) session.getAttribute("usuarioId") != empresa.getUsuarioAdmin().getId()){
			return"redirect:/";
		}
		empresaServicio.delete(idEmpresa);
		return"redirect:/home";
	}

	@GetMapping("/premium/{idEmpresa}")
	public String cambiarAPremium(HttpSession session, @PathVariable("idEmpresa") Long idEmpresa){
		Empresa empresa = empresaServicio.findById(idEmpresa);
		if((Long) session.getAttribute("usuarioId") == null && (Long) session.getAttribute("usuarioId") != empresa.getUsuarioAdmin().getId()){
			return"redirect:/";
		}
		empresa.setEmpresafree(false);
		empresaServicio.crear(empresa);
		return"redirect:/plan/"+ idEmpresa;
	}

	@GetMapping("/delete/{idEmpresa}/{idServicio}")
	public String desconectaServicio(HttpSession session, @PathVariable("idEmpresa") Long idEmpresa, 
	@PathVariable("idServicio") Long idServicio){
		Empresa empresa = empresaServicio.findById(idEmpresa);
		Servicio servicio = servicio1Servicio.findById(idServicio);
		empresa.getServicios().remove(servicio);
		empresaServicio.crear(empresa);
		return"redirect:/plan/"+idEmpresa;
	}

/* 	@GetMapping("/delete/{idEmpresa}/{idCi}")
	public String desconectaCiudad(HttpSession session, @PathVariable("idEmpresa") Long idEmpresa, 
	@PathVariable("idCiudad") Long idCiudad){
		Empresa empresa = empresaServicio.findById(idEmpresa);
		Ciudad ciudad = ciudadServicio.findById(idCiudad);
		empresa.setCiudades(null);
		empresaServicio.crear(empresa);
		return"redirect:/plan/"+idEmpresa;
	} */
}

