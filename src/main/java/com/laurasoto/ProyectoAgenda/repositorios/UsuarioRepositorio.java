package com.laurasoto.ProyectoAgenda.repositorios;

import org.springframework.stereotype.Repository;

import com.laurasoto.ProyectoAgenda.modelos.Usuario;

@Repository
public interface UsuarioRepositorio extends BaseRepositorio<Usuario>{
	Usuario findByEmail(String email);
}
