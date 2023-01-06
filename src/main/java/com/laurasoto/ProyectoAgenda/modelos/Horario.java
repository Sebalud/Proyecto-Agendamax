package com.laurasoto.ProyectoAgenda.modelos;

import lombok.*;

import javax.persistence.*;
import javax.validation.constraints.NotNull;
import java.util.Date;
import java.util.List;

@Entity
@Table(name="horarios")
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class Horario{
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @NotNull
    private Long horaDisponible;

    private boolean estaDisponible = true;
    
    @Column(updatable=false)
    private Date createdAt;
    private Date updatedAt;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "servicio_id")
    private Servicio servicio;

    @ManyToMany(fetch = FetchType.LAZY)
    @JoinTable(
        name = "usuarios_horarios",
        joinColumns = @JoinColumn(name = "horario_id"),
        inverseJoinColumns = @JoinColumn(name = "usuario_id")
    )
    private List<Usuario> usuarios;

    @PrePersist
    protected void onCreate(){
        this.createdAt = new Date();
    }
    @PreUpdate
    protected void onUpdate(){
        this.updatedAt = new Date();
    }

}
