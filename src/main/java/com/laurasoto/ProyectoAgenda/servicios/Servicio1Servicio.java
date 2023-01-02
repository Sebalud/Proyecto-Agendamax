package com.laurasoto.ProyectoAgenda.servicios;

import java.util.List;

import org.springframework.stereotype.Service;

import com.laurasoto.ProyectoAgenda.modelos.Empresa;
import com.laurasoto.ProyectoAgenda.modelos.Servicio;
import com.laurasoto.ProyectoAgenda.repositorios.ServicioRepositorio;

@Service
public class Servicio1Servicio extends BaseServicio<Servicio>{
	private final ServicioRepositorio servicioRepositorio;
	
	private Servicio1Servicio(ServicioRepositorio servicioRepositorio){
		super(servicioRepositorio);
		this.servicioRepositorio = servicioRepositorio;
	}
	
	public Servicio obtieneServicioPorServicioOfrecido(String servicio){
		return servicioRepositorio.findByServicioOfrecidoContaining(servicio);
	}
	
	public List<Servicio> serviciosNoContieneEmpresa(Empresa empresa){
		return servicioRepositorio.findByEmpresasNotContaining(empresa);
	}
}
