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
		references tb_status(id_Status)
);

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
		references tb_gincana(id_Gincana),
	id_Status int,
    constraint fk_idStatus_Evento foreign key (id_Status)
		references tb_status(id_Status)
);

create table tb_perfil (
	id_Perfil int auto_increment not null primary key,
    cargo_Perfil varchar(15) not null
);

create table tb_usuario (
	id_Usuario int auto_increment,
    id_Gincana int,
    constraint pk_idGincana_Usuario foreign key (id_Gincana) 
		references tb_gincana(id_Gincana),
	primary key (id_Usuario, id_Gincana),
    nome_Usuario varchar(60) not null,
	email_Usuario varchar(60) not null,
    senha_Usuario varchar(30) not null,
    sexo_Usuario varchar(9) not null,
    data_cadastro_Usuario date not null,
	id_Perfil int,
    constraint fk_idPerfil_Usuario foreign key (id_Perfil)
		references tb_perfil(id_Perfil),
	id_Evento int,
    constraint fk_idEvento_Usuario foreign key (id_Evento)
		references tb_evento (id_Evento)
);

create table tb_usuario_evento (
	id_Usuario int,
    constraint fk_idUsuario_UsuarioEvento foreign key (id_Usuario)
		references tb_usuario(id_Usuario),
	id_Gincana int,
    constraint fk_idGincana_UsuarioEvento foreign key (id_Gincana)
		references tb_usuario(id_Gincana),
	id_Evento int,
    constraint fk_idEvento_UsuarioEvento foreign key (id_Evento)
		references tb_evento (id_Evento),
	primary key (id_Usuario, id_Gincana, id_Evento)
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
		references tb_gincana(id_Gincana),
	id_Curso int,
	constraint fk_idCurso_Equipe foreign key (id_Curso)
		references tb_curso(id_Curso),
	id_Usuario int,
    constraint fk_idUsuario_Equipe foreign key (id_Usuario)
		references tb_usuario(id_Usuario)
);

create table tb_galeria (
	id_Galeria int auto_increment not null primary key,
    nome_Galeria varchar(30) not null,
	descricao_Galeria  varchar(200) not null,
    id_Gincana int,
    constraint fk_idGincana_Galeria foreign key (id_Gincana) 
		references tb_gincana(id_Gincana)
);

create table tb_imagem (
	id_Imagem int auto_increment not null primary key,
    URL_Imagem varchar(400) not null,
    id_Galeria int,
    constraint fk_idGaleria_Imagem foreign key (id_Galeria)
		references tb_galeria(id_Galeria)
);

create table tb_criterio (
	id_Criterio int auto_increment not null primary key,
    nome_Criterio varchar(30) not null,
	pontuacao_min_Criterio int not null,
	pontuacao_max_Criterio int not null,
	id_Evento int,
    constraint fk_idEvento_Criterio foreign key (id_Evento)
		references tb_evento(id_Evento)
);

 create table tb_notas_criterio (
	nota_Criterios int not null,
    id_Criterio int,
    constraint fk_idCriterio_NotasCriterio foreign key (id_Criterio)
		references tb_criterio(id_Criterio),	
    id_Equipe int,
    constraint fk_Equipe_NotasCriterio foreign key (id_Equipe)
		references tb_equipe(id_Equipe),
	primary key (id_Criterio, id_Equipe)
);

-- INDEX:
CREATE INDEX idx_IdStatus on TB_STATUS (id_Status);
CREATE INDEX idx_idGincana on TB_GINCANA (id_Gincana);
CREATE INDEX IDX_idEvento on TB_EVENTO (id_Evento);
CREATE INDEX idx_idPerfil on TB_PERFIL (id_Perfil);
CREATE INDEX idx_idUsuario on TB_USUARIO (id_Usuario);
CREATE INDEX idx_idGincana on TB_USUARIO (id_Gincana);
CREATE INDEX idx_idCurso on TB_CURSO (id_Curso);
CREATE INDEX idx_IdEquipe on TB_EQUIPE (id_Equipe);
CREATE INDEX idx_idGaleria on TB_GALERIA (id_Galeria);
CREATE INDEX idx_idImagem on TB_IMAGEM (id_Imagem);
CREATE INDEX idx_IdCriterio on TB_CRITERIO (id_Criterio);
CREATE INDEX idx_idCriterio on TB_NOTAS_CRITERIO (id_Criterio);
CREATE INDEX idx_idEquipe on TB_NOTAS_CRITERIO (id_Equipe);

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

insert into tb_status (situacao_Status) values ("ativo"), ("inativo");

insert into tb_gincana (nome_Gincana, descricao_Gincana, data_inicio_Gincana, data_fim_Gincana, id_Status) 
	values ("gincana2022", "gincana cientifica do ifba", "2022-10-02", "2022-10-05", 1);

insert into tb_evento (nome_Evento, descricao_Evento, tipo_Evento, data_Evento, horario_Evento, local_Evento, id_Gincana, id_Status) 
	values ("caça ao tesouro", "responder pistas para achar tesouro", "prova", "2022-10-02", "10:40", "campus", 1, 1),
		   ("projeto cientifico", "projeto relacionado ao curso", "prova", "2022-10-03", "11:30", "laboratorios", 1, 1),
           ("teste", "testando123", "prova", "2022-10-02", "10:40", "campus", 1, 2);