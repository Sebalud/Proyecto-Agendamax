package com.laurasoto.ProyectoAgenda.repositorios;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.laurasoto.ProyectoAgenda.modelos.Empresa;
import com.laurasoto.ProyectoAgenda.modelos.Servicio;
@Repository
public interface ServicioRepositorio extends BaseRepositorio<Servicio>{
	Servicio findByServicioOfrecido(String servicioOfrecido);
	List<Servicio> findByEmpresasNotContaining(Empresa empresa);
	
}
