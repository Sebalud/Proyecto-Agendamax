package com.laurasoto.ProyectoAgenda.controlador;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.laurasoto.ProyectoAgenda.modelos.Empresa;
import com.laurasoto.ProyectoAgenda.modelos.Usuario;
import com.laurasoto.ProyectoAgenda.servicios.EmpresaServicio;
import com.laurasoto.ProyectoAgenda.servicios.UsuarioServicio;
import com.laurasoto.ProyectoAgenda.validator.UserValidator;


@Controller
public class UsuarioControlador {
	private final UsuarioServicio usuarioServicio;
	private final EmpresaServicio empresaServicio;
	private final UserValidator userValidator;
	// private final Servicio1Servicio servicio1Servicio;

	public UsuarioControlador(UsuarioServicio usuarioServicio, EmpresaServicio empresaServicio, UserValidator userValidator) {
		this.usuarioServicio = usuarioServicio;
		this.empresaServicio = empresaServicio;
		this.userValidator = userValidator;
	}
	// private final Servicio1Servicio servicio1Servicio;


	@GetMapping("/registration")
	public String muestraForm(@ModelAttribute("usuario") Usuario usuario) {
		return "creaUsuario";
	}

	@RequestMapping(value = "/registration", method = RequestMethod.POST)
	public String registerUser(@Valid @ModelAttribute("usuario") Usuario usuario, BindingResult result, HttpSession session, Model model) {
		userValidator.validate(usuario, result);
		if (result.hasErrors()) {
			System.out.println(result.getFieldError().toString());
			return "creaUsuario";
		}
		int tipoUsuario = 0;
		if(usuarioServicio.traerTodo().size() == 0){
			tipoUsuario = 500;
		}
		if(usuarioServicio.findByEmail(usuario.getEmail()) == null){
			usuario.setTipoUsuario(tipoUsuario);
			Usuario usuarioNuevo = usuarioServicio.registerUser(usuario);
			session.setAttribute("usuarioId",usuarioNuevo.getId());
			return "redirect:/home";
		}
		model.addAttribute("error", "ya tienes una cuenta con ese email");
		return "creaUsuario";
	}

	@GetMapping("/")
	public String login(HttpSession session) {
		if ((Long) session.getAttribute("usuarioId") != null) {
			return "redirect:/home";
		}
		return "login";
	}

	@PostMapping("/")
	public String loginUser(@RequestParam("email") String email, @RequestParam("password") String password,
			Model model, HttpSession session) {
		boolean autenticacion = usuarioServicio.authenticateUser(email, password);
		if (autenticacion) {
			// si es verdadero
			Usuario usuario = usuarioServicio.findByEmail(email);
			session.setAttribute("usuarioId", usuario.getId());
			return "redirect:/home";
		} else { // si es falso
			model.addAttribute("error", "Credencial invalida, intentelo de nuevo por favor");
			return "login";
		}
	}
	@GetMapping("/home")
	public String home(HttpSession session, Model model){
		Empresa empresa = empresaServicio.findById((Long) session.getAttribute("usuarioId"));
		Usuario usuario = usuarioServicio.findById((Long) session.getAttribute("usuarioId"));
		model.addAttribute("empresa",empresa);
		model.addAttribute("usuario", usuario);
		return"index";
	}

	@GetMapping("/logout")
	public String cierraSesion(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}

/* 	@GetMapping("/administradores")
	public String hacerAdmin(HttpSession session, Model model){
		List<Usuario> usuariosTodos = usuarioServicio.traerTodo();
		model.addAttribute("todosUsuarios", usuariosTodos);
		return"listaUsuarios";
	} */

	//enlace que setea el tipo usuario a admin
	/* @GetMapping("/administradores/admin/{idUsuario}")
	public String setAdmin(HttpSession session, @PathVariable("idUsuario") Long idUsuario){
		Usuario usuario = usuarioServicio.findById(idUsuario);
		usuario.setTipoUsuario(500);
		return"redirect:/administradores";
	}

	@GetMapping("/administradores/noAdmin/{idUsuario}")
	public String setTipoUsuario(HttpSession session, @PathVariable("idUsuario") Long idUsuario){
		Usuario usuario = usuarioServicio.findById(idUsuario);
		usuario.setTipoUsuario(0);
		return"redirect:/administradores";
	} */
}
