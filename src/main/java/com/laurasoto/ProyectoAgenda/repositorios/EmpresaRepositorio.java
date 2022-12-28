package com.laurasoto.ProyectoAgenda.repositorios;



import org.springframework.stereotype.Repository;

import com.laurasoto.ProyectoAgenda.modelos.Empresa;


@Repository
public interface EmpresaRepositorio extends BaseRepositorio<Empresa>{
	//List<Empresa> findByServiciosContaining(Servicio servicio);
	Empresa findByNombre(String nombre);
	
}
