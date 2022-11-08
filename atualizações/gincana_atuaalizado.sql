create database gincana;

use gincana;

create table tb_status (
	id_Status int auto_increment not null primary key,
    situacao_Status varchar(12) not null
);

create table tb_gincana (
	id_Gincana int auto_increment not null primary key,
	nome_Gincana varchar(45) not null,
    descricao_Gincana varchar(200) not null,
    data_inicio_Gincana date not null,
	data_fim_Gincana date not null,
	id_Status int,
    constraint fk_idStatus_Gincana foreign key (id_Status)
		references Status(id_Status)
);

-- fazer primary key -composta- de gincana
create table tb_evento (
	id_Evento int auto_increment not null primary key,
    nome_Evento varchar(30) not null,
    descricao_Evento varchar(200) not null,
    tipo_Evento varchar(15) not null,
    data_Evento date not null,
    horario_Evento varchar(5) not null,
    local_Evento varchar(20) not null,
    id_Gincana int,
    constraint fk_idGincana_Evento foreign key (id_Gincana) 
		references Gincana(id_Gincana),
	id_Status int,
    constraint fk_idStatus_Evento foreign key (id_Status)
		references Status(id_Status)
);

create table tb_perfil (
	id_Perfil int auto_increment not null primary key,
    cargo_Perfil varchar(15) not null
);

create table tb_usuario (
	id_Usuario int auto_increment not null primary key,
    nome_Usuario varchar(60) not null,
	email_Usuario varchar(60) not null,
    senha_Usuario varchar(30) not null,
    sexo_Usuario varchar(9) not null,
    data_cadastro_Usuario date not null,
    id_Gincana int,
    constraint fk_idGincana_Usuario foreign key (id_Gincana) 
		references Gincana(id_Gincana),
	id_Perfil int,
    constraint fk_idPerfil_Usuario foreign key (id_Perfil)
		references Perfil(id_Perfil),
	id_Evento int,
    constraint fk_idEvento_Usuario foreign key (id_Evento)
		references Evento (id_Evento)
);

create table tb_curso (
	id_Curso int auto_increment not null primary key,
    nome_Curso varchar(25) not null,
    modalidade_Curso varchar(12) not null
);

create table tb_equipe (
	id_Equipe int auto_increment not null primary key,
    nome_Equipe varchar(20) not null,
    id_Gincana int,
    constraint fk_idGincana_Equipe foreign key (id_Gincana) 
		references Gincana(id_Gincana),
	id_Curso int,
	constraint fk_idCurso_Equipe foreign key (id_Curso)
		references Curso(id_Curso),
	id_Usuario int,
    constraint fk_idUsuario_Equipe foreign key (id_Usuario)
		references Usuario(id_Usuario)
);

create table tb_galeria (
	id_Galeria int auto_increment not null primary key,
    nome_Galeria varchar(30) not null,
	descricao_Galeria  varchar(300) not null,
    id_Gincana int,
    constraint fk_idGincana_Galeria foreign key (id_Gincana) 
		references Gincana(id_Gincana)
);

create table tb_imagem (
	id_Imagem int auto_increment not null primary key,
    URL_Imagem varchar(400) not null,
    id_Galeria int,
    constraint fk_idGaleria_Imagem foreign key (id_Galeria)
		references Galeria(id_Galeria)
);

create table tb_criterio (
	id_Criterio int auto_increment not null primary key,
    nome_Criterio varchar(30) not null,
	pontuacao_min_Criterio int not null,
	pontuacao_max_Criterio int not null,
	id_Evento int,
    constraint fk_idEvento_Criterio foreign key (id_Evento)
		references Prova(id_Evento)
);

create table tb_notas_criterio (
	id_Criterio int,
    constraint fk_idCriterio_NotasCriterio foreign key (id_Criterio)
		references Criterio(id_Criterio),
	id_Jurado int,
    constraint fk_idJurado_NotasCriterio foreign key (id_Jurado)
		references Jurado(id_Jurado),
	primary key (id_Criterio, id_Jurado),
    notas_Criterios varchar(10) not null,
    id_Equipe int,
    constraint fk_Equipe_NotasCriterio foreign key (id_Equipe)
		references Equipe(id_Equipe)
);

-- INDEX:
CREATE INDEX idx_IdAgenda on TB_AGENDA (id_Agenda);
CREATE INDEX idx_IdCriterio on TB_CRITERIO (id_Criterio);
CREATE INDEX idx_IdEquipe on TB_EQUIPE (id_Equipe);
CREATE INDEX IDX_idEvento on TB_EVENTO (id_Evento);
CREATE INDEX idx_idGaleria on TB_GALERIA (id_Galeria);
CREATE INDEX idx_idGincana on TB_GINCANA (id_Gincana);
CREATE INDEX idx_idImagem on TB_IMAGEM (id_Imagem);
CREATE INDEX idx_idCriterio on TB_NOTAS_CRITERIO (id_Criterio);
CREATE INDEX idx_idPerfil on TB_PERFIL (id_Perfil);
CREATE INDEX idx_idUsuario on TB_USUARIO (id_Usuario);

-- SELECTs TABELA INTEIRA:
Select * from TB_CRITERIO;
Select * from TB_EQUIPE;
Select * from TB_EVENTO;
Select * from TB_GALERIA;
Select * from TB_GINCANA;
Select * from TB_IMAGEM;
Select * from TB_NOTAS_CRITERIO;
Select * from TB_PERFIL;
Select * from TB_PROVA;
Select * from TB_USUARIO;
Select * from TB_STATUS;