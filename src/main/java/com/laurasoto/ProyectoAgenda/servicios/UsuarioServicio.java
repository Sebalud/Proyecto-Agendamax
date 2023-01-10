package com.laurasoto.ProyectoAgenda.servicios;
import java.util.Optional;
import org.mindrot.jbcrypt.BCrypt;
import org.springframework.stereotype.Service;
import com.laurasoto.ProyectoAgenda.modelos.Usuario;
import com.laurasoto.ProyectoAgenda.repositorios.UsuarioRepositorio;

@Service
public class UsuarioServicio extends BaseServicio<Usuario> {
	private final UsuarioRepositorio usuarioRepositorio;

	private UsuarioServicio(UsuarioRepositorio usuarioRepositorio) {
		super(usuarioRepositorio);
		this.usuarioRepositorio = usuarioRepositorio;
	}

	public Usuario registerUser(Usuario usuario) {
		String hashed = BCrypt.hashpw(usuario.getPassword(), BCrypt.gensalt());
		usuario.setPassword(hashed);
		return usuarioRepositorio.saveAndFlush(usuario);
	}

	public Usuario findByEmail(String email) {
		return usuarioRepositorio.findByEmail(email);
	}

	public Usuario findUserById(Long id) {
		Optional<Usuario> usuario = usuarioRepositorio.findById(id);
		if(usuario.isPresent()) {
            return usuario.get();
		} else {
			return null;
		}
    }

	public boolean authenticateUser(String email, String password) {
		Usuario usuario = usuarioRepositorio.findByEmail(email);
		// si no lo podemos encontrar por su email, retornamos false
		if (usuario == null) {
			return false;
		} else {
			// si el password coincide devolvemos true, sino, devolvemos false
			if (BCrypt.checkpw(password, usuario.getPassword())) {
				return true;
			} else {
				return false;
			}
		}
	}
}
