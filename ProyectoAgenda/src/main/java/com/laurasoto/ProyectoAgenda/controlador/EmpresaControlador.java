package com.laurasoto.ProyectoAgenda.controlador;

import javax.naming.Binding;
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
import com.laurasoto.ProyectoAgenda.modelos.Empresa;
import com.laurasoto.ProyectoAgenda.modelos.Servicio;
import com.laurasoto.ProyectoAgenda.modelos.Usuario;
import com.laurasoto.ProyectoAgenda.servicios.EmpresaServicio;
import com.laurasoto.ProyectoAgenda.servicios.Servicio1Servicio;
import com.laurasoto.ProyectoAgenda.servicios.UsuarioServicio;
@Controller
public class EmpresaControlador {
	private final EmpresaServicio empresaServicio;
	private final Servicio1Servicio servicio1Servicio;
	private final UsuarioServicio usuarioServicio;
	
	public EmpresaControlador(EmpresaServicio empresaServicio, Servicio1Servicio servicio1Servicio,
			UsuarioServicio usuarioServicio){
		this.empresaServicio = empresaServicio;
		this.servicio1Servicio = servicio1Servicio;
		this.usuarioServicio = usuarioServicio;
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
	@GetMapping("/planes/free")
	public String planFree(@ModelAttribute("empresa") Empresa empresa,HttpSession session, Model model){
		
		return"free";
	}
	
	@PostMapping("/planes/free")
	public String formPlanFree(@Valid @ModelAttribute("empresa") Empresa empresa, BindingResult result, HttpSession session){
		if(result.hasErrors()){
			return"free";
		}
		Usuario usuarioAdmin = usuarioServicio.findById((Long) session.getAttribute("usuarioId"));
		empresa.setUsuarioAdmin(usuarioAdmin);
		empresaServicio.crear(empresa);
		return"redirect:/";
	}
}
