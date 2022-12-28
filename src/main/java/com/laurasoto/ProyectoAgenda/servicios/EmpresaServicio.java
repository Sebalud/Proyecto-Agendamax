package com.laurasoto.ProyectoAgenda.servicios;



import org.springframework.stereotype.Service;

import com.laurasoto.ProyectoAgenda.modelos.Empresa;

import com.laurasoto.ProyectoAgenda.repositorios.EmpresaRepositorio;

@Service
public class EmpresaServicio extends BaseServicio<Empresa>{
	private final EmpresaRepositorio empresaRepositorio;
	
	private EmpresaServicio(EmpresaRepositorio empresaRepositorio){
		super(empresaRepositorio);
		this.empresaRepositorio = empresaRepositorio;
	}
//	public List<Empresa> buscaEmpresaPorServicio(List<Servicio> servicios){	
//		return empresaRepositorio.findByServiciosContaining(servicios);
//	}
	public Empresa getEmpresaPorNombre(String nombre){
		return empresaRepositorio.findByNombre(nombre);
	}
}
