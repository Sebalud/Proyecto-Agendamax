package com.laurasoto.ProyectoAgenda.modelos;

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
	
}
