package com.laurasoto.ProyectoAgenda.modelos;

import java.util.Date;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.OneToOne;
import javax.persistence.PrePersist;
import javax.persistence.PreUpdate;
import javax.persistence.Table;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Entity
@Table(name = "empresas")
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class Empresa {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
	@NotNull
	@NotBlank
	@Size(min = 3, max = 30, message = "minimo 3 letras, maximo 50")
	private String nombre;
	@NotNull
	private Long rut;

	@Column(updatable = false)
	private Date createdAt;
	private Date updatedAt;

	@PrePersist
	protected void onCreate() {
		this.createdAt = new Date();
	}

	@PreUpdate
	protected void onUpdate() {
		this.updatedAt = new Date();
	}

	@OneToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "usuarioadmin_id")
	private Usuario usuarioAdmin;

	@Size(min = 1, max = 5)
	@ManyToMany(fetch = FetchType.LAZY)
	@JoinTable(name = "empresas_ciudades", joinColumns = @JoinColumn(name = "empresa_id"), // siempre va primera el id
																							// de la misma tabla en la
																							// que estamos
			inverseJoinColumns = @JoinColumn(name = "ciudad_id") // id de la otra tabla
	)
	private List<Ciudad> ciudades;

	@Size(min = 1, max = 5)
	@ManyToMany(fetch = FetchType.LAZY)
	@JoinTable(name = "empresas_servicios", joinColumns = @JoinColumn(name = "empresa_id"), inverseJoinColumns = @JoinColumn(name = "servicio_id"))
	private List<Servicio> servicios;

	public Servicio getServicios(Servicio servicio) {
		int index = servicios.indexOf(servicio);
		return servicios.get(index);
	}

}
