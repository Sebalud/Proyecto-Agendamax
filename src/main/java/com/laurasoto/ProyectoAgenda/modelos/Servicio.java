package com.laurasoto.ProyectoAgenda.modelos;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.persistence.*;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Entity
@Table(name="servicios")
@Getter @Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class Servicio{
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
	
	@NotNull @NotBlank
	private String servicioOfrecido;
	@Min(30)
	@Builder.Default
	private int duracionServicio=0;
	@Builder.Default
	private int horaInicio=0;
	@Builder.Default
	private int horaTermino=0;
	
	@NotNull
	private int duracionJornada=0;


	@Column(updatable=false)
	private Date createdAt;
	private Date updatedAt;

	@ManyToMany(fetch = FetchType.LAZY)
	@JoinTable(
		name = "empresas_servicios",
		joinColumns = @JoinColumn(name = "servicio_id"),
		inverseJoinColumns = @JoinColumn(name = "empresa_id")
	)
	private List<Empresa> empresas;
	

	@OneToMany(mappedBy = "servicio", fetch = FetchType.LAZY)
	private List<Horario> horarios;

	/* @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "ciudad_id")
    private Ciudad ciudad; */
	
	@PrePersist
	protected void onCreate(){
		this.createdAt = new Date();
	}
	@PreUpdate
	protected void onUpdate() {
		this.updatedAt = new Date();
	}

	public void setHorarios(Horario horario){
		horarios.add(horario);
	}
	
	public List<List<TachamientoBoton>> posiblesHoraDisponible() throws ParseException{
		//agregar atributos cuando cree el servicio
	

		int horaInicio = this.getHoraInicio();
		int horarTermino = this.getHoraTermino();
		//hacer un select con horarios preestablecidos ppara que no sobre resto
		int cuantoDuraHora = this.getDuracionServicio(); //minutos

		
		int duracionJornada = horarTermino - horaInicio;
		this.setDuracionJornada(duracionJornada);

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

		List<List<TachamientoBoton>> listaAlModel = new ArrayList<>();
        for ( List<Date> dias : listaDefinitiva) {
            List<TachamientoBoton> listaIntermedia = new ArrayList<>();
            for ( Date hora : dias) {

				this.getHorarios().;
                if(horarioServicio.findByHoraDisponible(hora.getTime()) != null){
                    TachamientoBoton botonTachado = new TachamientoBoton();
                    botonTachado.setDate(hora);
                    botonTachado.setEstaActivo(false);
                    listaIntermedia.add(botonTachado);
                }
                else{
                    TachamientoBoton botonDisponible = new TachamientoBoton();
                    botonDisponible.setDate(hora);
                    listaIntermedia.add(botonDisponible);
                }
                
            }
            listaAlModel.add(listaIntermedia);
        }
			return listaAlModel;
	}

	private void xd (){
        List<Horario> fechas = new ArrayList<>();
        Date hora = new Date();

        List<TachamientoBoton> botonesInactivos = fechas.stream()
                .filter(fecha -> fecha.getHoraDisponible().equals(hora.getTime()))
                .map(fecha -> new TachamientoBoton(false, hora))
                .collect(Collectors.toList());

        List<TachamientoBoton> botonesActivos = fechas.stream()
                .filter(fecha -> !fecha.getHoraDisponible().equals(hora.getTime()))
                .map(fecha -> new TachamientoBoton(false, hora))
                .collect(Collectors.toList());
        
        botonesInactivos.addAll(botonesActivos);

    }
}
