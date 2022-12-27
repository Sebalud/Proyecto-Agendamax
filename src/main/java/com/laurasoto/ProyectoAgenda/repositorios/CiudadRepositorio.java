package com.laurasoto.ProyectoAgenda.repositorios;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.laurasoto.ProyectoAgenda.modelos.Ciudad;
import com.laurasoto.ProyectoAgenda.modelos.Empresa;

@Repository
public interface CiudadRepositorio extends BaseRepositorio<Ciudad> {
    
    List<Ciudad> findByEmpresasNotContaining(Empresa empresa);
}
