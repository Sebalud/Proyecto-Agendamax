package com.laurasoto.ProyectoAgenda.servicios;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import org.springframework.stereotype.Service;

import com.laurasoto.ProyectoAgenda.modelos.Empresa;
import com.laurasoto.ProyectoAgenda.modelos.Servicio;
import com.laurasoto.ProyectoAgenda.repositorios.HorarioRepositorio;
import com.laurasoto.ProyectoAgenda.repositorios.ServicioRepositorio;

@Service
public class Servicio1Servicio extends BaseServicio<Servicio>{
	private final ServicioRepositorio servicioRepositorio;
	private final HorarioRepositorio horarioRepositorio;

	
	private Servicio1Servicio(ServicioRepositorio servicioRepositorio, HorarioRepositorio horarioRepositorio){
		super(servicioRepositorio);
		this.servicioRepositorio = servicioRepositorio;
		this.horarioRepositorio = horarioRepositorio;
	}
	
	public Servicio obtieneServicioPorServicioOfrecido(String servicio){
		return servicioRepositorio.findByServicioOfrecidoContaining(servicio);
	}
	
	public List<Servicio> serviciosNoContieneEmpresa(Empresa empresa){
		return servicioRepositorio.findByEmpresasNotContaining(empresa);
	}

	public List<List<Date>> posiblesHoraDisponible(Long servicioId) throws ParseException{
		//agregar atributos cuando cree el servicio
		Servicio servicio = servicioRepositorio.findById(servicioId).get();

		int horaInicio = servicio.getHoraInicio();
		int horarTermino = servicio.getHoraTermino();
		//hacer un select con horarios preestablecidos ppara que no sobre resto
		int cuantoDuraHora = servicio.getDuracionServicio(); //minutos

		
		int duracionJornada = horarTermino - horaInicio;
		servicio.setDuracionJornada(duracionJornada);

		int cantidadHorasDisponiblesDia = (duracionJornada * 60)/ cuantoDuraHora;


		String dt = "2023-01-03";  // toma fecha en formato fecha
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd"); //creando formato
		Calendar calendario = Calendar.getInstance(); //crea calendario
		calendario.setTime(sdf.parse(dt)); 
		calendario.add(Calendar.DATE, 7);  // agrego 7 dias
		dt = sdf.format(calendario.getTime());  // obtengo tiempo

		//estoy haciendo una lista de fechas tipo date
		List<Date> posiblesHorariosDia = new ArrayList<>();
		//estoy haciendo los 7 dias, cada dia de los 7 tiene solo una hora, las 00, por lo 
		//tanto falta hacer las 12 horas por cada dia
		for (int i = 1; i < 8; i++) {
			calendario.add(Calendar.DATE, 1);
			posiblesHorariosDia.add(calendario.getTime());
		}

		//seteando en cada dia de la lista de posibles horarios dia, la hora de inicio
		List<Date> posiblesHorarios = new ArrayList<>();
		for (Date fechaDia : posiblesHorariosDia){
				Calendar diaFechaInicio = Calendar.getInstance(); // creates calendar
				diaFechaInicio.setTime(fechaDia);               // seteo la fecha que estan en lista
				diaFechaInicio.add(Calendar.HOUR_OF_DAY, horaInicio);      // adds one hour
				diaFechaInicio.getTime();
				//tengo mi fecha con la hora de inicio por los 7 dias siguientes
				posiblesHorarios.add(diaFechaInicio.getTime());
		}
		//lista de fechas para los 7 dias desde que se mete una personas a ver 
		//las fechas tienen las 12 horas disponibles?
		//System.out.println(posiblesHorarios);
		//estoy agregando las 12 horas en cada dia de la semana, queda una lista de lista de doce 12 horas
		List<List<Date>> listaDefinitiva = new ArrayList<>();
		List<Date> posiblesHorarios333 = new ArrayList<>();
		for (Date fechaDia : posiblesHorarios){
			List<Date> posiblesHorariosoooo = new ArrayList<>();
			Calendar diaFechaInicio = Calendar.getInstance(); // creates calendar
			diaFechaInicio.setTime(fechaDia); // seteo la fecha que estan en lista
			for (int i = 0; i < cantidadHorasDisponiblesDia; i++) {
				if(i == 0){
					posiblesHorarios333.add(diaFechaInicio.getTime());
					posiblesHorariosoooo.add(diaFechaInicio.getTime());
				}
				diaFechaInicio.add(Calendar.MINUTE, cuantoDuraHora); // adds one hour
				diaFechaInicio.getTime();
				posiblesHorarios333.add(diaFechaInicio.getTime());
				posiblesHorariosoooo.add(diaFechaInicio.getTime());

			}
			listaDefinitiva.add(posiblesHorariosoooo);
		}
			return listaDefinitiva;
	}
	
}
