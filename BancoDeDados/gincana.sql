create database gincana;

use gincana;

create table Gincana (
	id_Gincana int auto_increment not null primary key,
	nome_Gincana varchar(45) not null,
	ano_Gincana varchar(8) not null,
    descricao_Gincana varchar(120) not null,
    data_Gincana date not null
);

create table Agenda (
	id_Agenda int auto_increment not null primary key,
    data_Agenda date not null,
    id_Gincana int,
    constraint fk_idGincana_Agenda foreign key (id_Gincana) 
		references Gincana(id_Gincana)
);

create table Evento (
	id_Evento int auto_increment not null primary key,
    nome_Evento varchar(45) not null,
    local_Evento varchar(45) not null,
    data_Evento date not null,
    horario_Evento varchar(5) not null,
    descricao_Evento varchar(120) not null,
    id_Gincana int,
    constraint fk_idGincana_Evento foreign key (id_Gincana) 
		references Gincana(id_Gincana),
	id_Agenda int,
    constraint fk_idAgenda_Evento foreign key (id_Agenda)
		references Agenda(id_Agenda)
);

create table Perfil (
	id_Perfil int auto_increment not null primary key,
    cargo_Perfil varchar(30) not null
);

create table Usuario (
	id_Usuario int auto_increment not null primary key,
    nome_Usuario varchar(60) not null,
	email_Usuario varchar(60) not null,
    senha_Usuario varchar(30) not null,
    cpf_Usuario varchar(15) not null,
    sexo_Usuario varchar(1) not null,
    id_Gincana int,
    constraint fk_idGincana_Usuario foreign key (id_Gincana) 
		references Gincana(id_Gincana),
	id_Perfil int,
    constraint fk_idPerfil_Usuario foreign key (id_Perfil)
		references Perfil(id_Perfil)
);

create table Equipe (
	id_Equipe int auto_increment not null primary key,
    nome_Equipe varchar(45) not null,
    curso_Equipe varchar(15) not null,
    represetante_Equipe varchar(45) not null,
    id_Gincana int,
    constraint fk_idGincana_Equipe foreign key (id_Gincana) 
		references Gincana(id_Gincana)
);

create table Galeria (
	id_Galeria int auto_increment not null primary key,
    nome_Galeria varchar(45) not null,
	descricao_Galeria  varchar(45) not null,
    id_Gincana int,
    constraint fk_idGincana_Galeria foreign key (id_Gincana) 
		references Gincana(id_Gincana)
);

create table Imagem (
	id_Imagem int auto_increment not null primary key,
    URL_Imagem varchar(100) not null,
    id_Galeria int,
    constraint fk_idGaleria_Imagem foreign key (id_Galeria)
		references Galeria(id_Galeria)
);

create table Prova (
	id_Prova int auto_increment not null primary key,
    nome_Prova varchar(30) not null,
	descricao_Prova  varchar(120) not null,
    data_Prova DATE  not null,
    horario_Prova varchar(5) not null,
    id_Gincana int,
    constraint fk_idGincana_Prova foreign key (id_Gincana) 
		references Gincana(id_Gincana),
	id_Agenda int,
    constraint fk_idAgenda_Prova foreign key (id_Agenda)
		references Agenda(id_Agenda)
);

create table Criterio (
	id_Criterio int auto_increment not null primary key,
    nome_Criterio varchar(30) not null,
	pontuacao_Criterio  varchar(45) not null,
	id_Prova int,
    constraint fk_idProva_Criterio foreign key (id_Prova)
		references Prova(id_Prova)
);

create table Jurado (
	id_Jurado int auto_increment not null primary key,
    nome_Jurado varchar(45) not null
);

create table NotasCriterio (
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

create table Jurado_has_Prova (
	id_Jurado int,
    constraint fk_idJurado_JuradoProva foreign key (id_Jurado)
		references Jurado(id_Jurado),
	id_Prova int,
    constraint fk_idProva_JuradoProva foreign key (id_Prova)
		references Prova(id_Prova),
	primary key (id_Jurado, id_Prova)
);

-- INDEX:
CREATE INDEX idx_IdAgenda on AGENDA (id_Agenda);
CREATE INDEX idx_IdCriterio on CRITERIO (id_Criterio);
CREATE INDEX idx_IdEquipe on EQUIPE (id_Equipe);
CREATE INDEX IDX_idEvento on EVENTO (id_Evento);
CREATE INDEX idx_idGaleria on GALERIA (id_Galeria);
CREATE INDEX idx_idGincana on GINCANA (id_Gincana);
CREATE INDEX idx_idImagem on IMAGEM (id_Imagem);
CREATE INDEX idx_idJurado on JURADO (id_Jurado); 
CREATE INDEX idx_idJurado on JURADO_HAS_PROVA (id_Jurado);
CREATE INDEX idx_idProva on JURADO_HAS_PROVA (id_Prova);
CREATE INDEX idx_idCriterio on NOTASCRITERIO (id_Criterio);
CREATE INDEX idx_idJurado on NOTASCRITERIO (id_Jurado);
CREATE INDEX idx_idPerfil on PERFIL (id_Perfil);
CREATE INDEX idx_idProva on PROVA (id_Prova);
CREATE INDEX idx_idUsuario on USUARIO (id_Usuario);

-- SELECTs TABELA INTEIRA:
Select * from AGENDA;
Select * from CRITERIO;
Select * from EQUIPE;
Select * from EVENTO;
Select * from GALERIA;
Select * from GINCANA;
Select * from IMAGEM;
Select * from JURADO;
Select * from JURADO_HAS_PROVA;
Select * from NOTASCRITERIO;
Select * from PERFIL;
Select * from PROVA;
Select * from USUARIO;

-- INSERTs em Prova
insert into prova (nome_Prova, descricao_Prova, data_Prova, horario_Prova) values ("caça ao tesouro", "procurar 10 pistas", "2022-10-02", "14:00");
insert into prova (nome_Prova, descricao_Prova, data_Prova, horario_Prova) values ("soletrando", "soletrar palavras em inglês e espanhol", "2022-10-01", "15:00");
insert into prova (nome_Prova, descricao_Prova, data_Prova, horario_Prova) values ("projeto cientifico", "apresentar projeto relacionado ao curso", "2022-10-03", "16:00");
