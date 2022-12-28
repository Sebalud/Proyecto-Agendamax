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

import com.laurasoto.ProyectoAgenda.modelos.Usuario;
import com.laurasoto.ProyectoAgenda.servicios.UsuarioServicio;

@Controller
public class UsuarioControlador {
	private final UsuarioServicio usuarioServicio;
	// private final Servicio1Servicio servicio1Servicio;

	public UsuarioControlador(UsuarioServicio usuarioServicio) {
		this.usuarioServicio = usuarioServicio;

	}

	@GetMapping("/registration")
	public String muestraForm(@ModelAttribute("usuario") Usuario usuario) {
		return "creaUsuario";
	}

	@RequestMapping(value = "/registration", method = RequestMethod.POST)
	public String registerUser(@Valid @ModelAttribute("usuario") Usuario usuario, BindingResult result,
			HttpSession session, Model model) {
		if (result.hasErrors()) {
			return "creaUsuario";
		}
<<<<<<< HEAD
		int tipoUsuario = 0;
		if(usuarioServicio.traerTodo().size() == 0){
			tipoUsuario = 500;
		}
		if(usuarioServicio.findByEmail(usuario.getEmail()) == null){
			usuario.setTipoUsuario(tipoUsuario);
			Usuario usuarioNuevo = usuarioServicio.registerUser(usuario);

			session.setAttribute("usuarioId",usuarioNuevo.getId());
=======
		if (usuarioServicio.findByEmail(usuario.getEmail()) == null) {

			Usuario usuarioNuevo = usuarioServicio.registerUser(usuario);
			session.setAttribute("usuarioId", usuarioNuevo.getId());
>>>>>>> c9543cda3c0693d0ef4e0926e316e97b65ae5747
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
<<<<<<< HEAD
	 }
	 
	 @GetMapping("/logout")
	 	public String cierraSesion(HttpSession session){
		 session.invalidate();
			return"redirect:/login";
	 }

	/* @GetMapping("/admin/new")
	public String nuevoAdmin(@ModelAttribute("usuario") Usuario usuario, HttpSession session ){

	} */
			
=======
	}

	@GetMapping("/logout")
	public String cierraSesion(HttpSession session) {
		session.invalidate();
		return "redirect:/login";
	}
>>>>>>> c9543cda3c0693d0ef4e0926e316e97b65ae5747
}
