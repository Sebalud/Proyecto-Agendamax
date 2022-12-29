package com.laurasoto.ProyectoAgenda.modelos;

import java.util.Date;
import java.util.List;

import javax.persistence.*;
import javax.validation.constraints.Email;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Entity
@Table(name = "usuarios")
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class Usuario {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
	@NotNull
	@NotBlank
	@Size(min = 3, max = 30, message = "minimo 3 letras, maximo 50")
	private String nombre;
	@NotNull
	@NotBlank
	@Size(min = 3, max = 30, message = "minimo 3 letras, maximo 50")
	private String apellido;
	private Integer tipoUsuario;
	@NotNull @NotBlank
	private String rut;
	@Email(message = "Invalid email format. Ex: user@user.com")
	@Size(min = 10, max = 200, message = "minimo 10 letras, maximo 200")
	private String email;
	@NotBlank(message = "no puede estar vacio")
	private String password;
	@Transient
	private String passwordConfirmation;
	@Column(updatable = false)
	private Date createdAt;
	private Date updatedAt;

	@OneToOne(mappedBy = "usuarioAdmin", cascade = CascadeType.ALL, fetch = FetchType.LAZY)
	private Empresa empresa;

	@ManyToMany(fetch = FetchType.LAZY)
	@JoinTable(name = "usuarios_horarios", joinColumns = @JoinColumn(name = "usuario_id"), inverseJoinColumns = @JoinColumn(name = "horario_id"))
	private List<Horario> horarios;

	@PrePersist
	protected void onCreate() {
		this.createdAt = new Date();
	}

	@PreUpdate
	protected void onUpdate() {
		this.updatedAt = new Date();
	}
}
