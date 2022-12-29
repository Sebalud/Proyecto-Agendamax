package com.laurasoto.ProyectoAgenda.repositorios;





import com.laurasoto.ProyectoAgenda.modelos.Empresa;


public interface EmpresaRepositorio extends BaseRepositorio<Empresa>{
	//List<Empresa> findByServiciosContaining(Servicio servicio);
	Empresa findByNombre(String nombre);
	
}
