package com.laurasoto.ProyectoAgenda.controlador;

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
	public String buscaServicio(@RequestParam("servicio") String servicio){
		return "redirect:/search/" + servicio;
	}
	
	@GetMapping("/search/{servicio}")
	public String formServicio(@PathVariable("servicio") String servicio, HttpSession session, Model model){
		Servicio servicioRequerido = servicio1Servicio.obtieneServicioPorServicioOfrecido(servicio);
		model.addAttribute("servicioRequerido", servicioRequerido);
		return"servicio";
	}
	//se puede tener dos empresas con el mismo nombre?
	@GetMapping("/planes/new")
	public String nuevoPlan(@ModelAttribute("empresa") Empresa empresa, HttpSession session, Model model){
		if((Long) session.getAttribute("usuarioId") == null){
			return"redirect:/";
		}
		List<Ciudad> ciudades = ciudadServicio.ciudadesMostrar(empresa);
		List<Region> regiones = regionServicio.regionesTodas();
		model.addAttribute("regiones", regiones);
		model.addAttribute("ciudades", ciudades);
		List<Servicio> servicios = servicio1Servicio.traerTodo();
		model.addAttribute("servicios", servicios);
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
	public String empresaDetalle(@PathVariable("idEmpresa") Long idEmpresa, HttpSession session, Model model){
		if((Long) session.getAttribute("usuarioId") == null){
			return"redirect:/";
		}
		Empresa empresa = empresaServicio.findById(idEmpresa);
		model.addAttribute("empresa", empresa);
		return "showEmpresa";
	}

	@GetMapping("plan/{idEmpresa}/edit")
	public String editaEmpresa(@ModelAttribute("empresa") Empresa empresa, @PathVariable("idEmpresa") Long idEmpresa, HttpSession session, Model model){
		if((Long) session.getAttribute("usuarioId") == null){
			return"redirect:/";
		}
		Empresa empresaAEditar = empresaServicio.findById(idEmpresa);
		model.addAttribute("empresaAEditar", empresaAEditar);
		return "editaEmpresa";
	}

	@PostMapping("plan/{idEmpresa}/edit")
	public String editaEmpresaForm(@Valid @ModelAttribute("empresa") Empresa empresa, BindingResult result, @PathVariable("idEmpresa") Long idEmpresa,
	HttpSession session){
		if(result.hasErrors()){
			return"editaEmpresa";
		}

		Usuario usuarioAdmin = usuarioServicio.findById((Long) session.getAttribute("usuarioId"));
		empresa.setId(idEmpresa);
		empresa.setUsuarioAdmin(usuarioAdmin);
		empresaServicio.crear(empresa);
		return"redirect:/plan/"+empresa.getId();
	}

	@GetMapping("/delete/{idEmpresa}")
	public String eliminaEmpresa(HttpSession session, @PathVariable("idEmpresa") Long idEmpresa ){
		Empresa empresa = empresaServicio.findById(idEmpresa);
		if((Long) session.getAttribute("usuarioId") == null && (Long) session.getAttribute("usuarioId") != empresa.getUsuarioAdmin().getId()){
			return"redirect:/";
		}
		empresaServicio.delete(idEmpresa);
		return"redirect:/";
	}
}
