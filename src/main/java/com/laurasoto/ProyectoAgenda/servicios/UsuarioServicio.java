package com.laurasoto.ProyectoAgenda.servicios;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.stereotype.Service;

import com.laurasoto.ProyectoAgenda.modelos.Usuario;
import com.laurasoto.ProyectoAgenda.repositorios.UsuarioRepositorio;

@Service
public class UsuarioServicio extends BaseServicio<Usuario>{
	private final UsuarioRepositorio usuarioRepositorio;
	
	private UsuarioServicio(UsuarioRepositorio usuarioRepositorio){
		super(usuarioRepositorio);
		this.usuarioRepositorio = usuarioRepositorio;
	}
	
	public Usuario registerUser(Usuario user) {
        String hashed = BCrypt.hashpw(user.getPassword(), BCrypt.gensalt());
        user.setPassword(hashed);
        return usuarioRepositorio.saveAndFlush(user);
    }
	
	public Usuario findByEmail(String email) {
        return usuarioRepositorio.findByEmail(email);
    }
	
	public boolean authenticateUser(String email, String password) {
	    Usuario usuario = usuarioRepositorio.findByEmail(email);
	    // si no lo podemos encontrar por su email, retornamos false
	    if(usuario == null) {
	        return false;
	    } else {
	    	// si el password coincide devolvemos true, sino, devolvemos false
	        if(BCrypt.checkpw(password, usuario.getPassword())) {
	            return true;
	        } else {
	            return false;
	        }
	    }
	}
}
