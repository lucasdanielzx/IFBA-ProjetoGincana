package br.edu.ifba.back.gincana.model;

import java.sql.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import lombok.Data;

@Data
@Entity
@Table(name = "prova")
public class ProvaModel {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id_Prova")
	private long id_Prova;
	
	@Column(name = "nome_Prova", nullable = true)
	private String nome_Prova;
	
	@Column(name = "descricao_Prova", nullable = true)
	private String descricao_Prova;
	
	@Column(name = "data_Prova", nullable = true)
	private Date data_Prova;
	
	@Column(name = "horario_Prova", nullable = true)
	private String horario_Prova;
	
	/*@ManyToOne
	@JoinColumn(name = "id_Gincana", nullable = true)
	private GincanaModel gincana;
	
	@ManyToOne
	@JoinColumn(name = "id_Agenda", nullable = true)
	private AgendaModel agenda;*/

	public ProvaModel() {
		super();
	}

	public ProvaModel(long id_Prova, String nome_Prova, String descricao_Prova, Date data_Prova, String horario_Prova,
			GincanaModel gincana, AgendaModel agenda) {
		super();
		this.id_Prova = id_Prova;
		this.nome_Prova = nome_Prova;
		this.descricao_Prova = descricao_Prova;
		this.data_Prova = data_Prova;
		this.horario_Prova = horario_Prova;
		//this.gincana = gincana;
		//this.agenda = agenda;
	}

	public long getId_Prova() {
		return id_Prova;
	}

	public void setId_Prova(long id_Prova) {
		this.id_Prova = id_Prova;
	}

	public String getNome_Prova() {
		return nome_Prova;
	}

	public void setNome_Prova(String nome_Prova) {
		this.nome_Prova = nome_Prova;
	}

	public String getDescricao_Prova() {
		return descricao_Prova;
	}

	public void setDescricao_Prova(String descricao_Prova) {
		this.descricao_Prova = descricao_Prova;
	}

	public Date getData_Prova() {
		return data_Prova;
	}

	public void setData_Prova(Date data_Prova) {
		this.data_Prova = data_Prova;
	}

	public String getHorario_Prova() {
		return horario_Prova;
	}

	public void setHorario_Prova(String horario_Prova) {
		this.horario_Prova = horario_Prova;
	}

	/*public GincanaModel getGincana() {
		return gincana;
	}

	public void setGincana(GincanaModel gincana) {
		this.gincana = gincana;
	}

	public AgendaModel getAgenda() {
		return agenda;
	}

	public void setAgenda(AgendaModel agenda) {
		this.agenda = agenda;
	}*/
}