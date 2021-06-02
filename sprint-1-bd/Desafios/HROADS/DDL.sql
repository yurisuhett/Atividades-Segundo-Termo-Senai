CREATE DATABASE SENAI_HROADS_MANHA;

USE SENAI_HROADS_MANHA

CREATE TABLE TipoUser(
	IdTipoUser INT PRIMARY KEY IDENTITY,
	NomeTipoUser VARCHAR(200) UNIQUE NOT NULL,
);

CREATE TABLE Usuarios(
	IdUsuario INT PRIMARY KEY IDENTITY,
	IdTipoUser INT FOREIGN KEY REFERENCES TipoUser (IdTipoUser) NOT NULL,
	EmailUsuario VARCHAR(200) UNIQUE NOT NULL,
	SenhaUsuario VARCHAR(12) NOT NULL,
);

CREATE TABLE TipoHabilidade(
	IdTipoHabilidade INT PRIMARY KEY IDENTITY,
	NomeTipo VARCHAR(200) NOT NULL,
);


CREATE TABLE Habilidade(
	IdHabilidade INT PRIMARY KEY IDENTITY,
	IdTipoHabilidade INT FOREIGN KEY REFERENCES TipoHabilidade (IdTipoHabilidade) NOT NULL, 
	NomeHabilidade VARCHAR(200) NOT NULL,
);

CREATE TABLE Classe(
	IdClasse INT PRIMARY KEY IDENTITY,
	NomeClasse VARCHAR(200) NOT NULL,
);

CREATE TABLE ClasseHabilidade(
	IdClasse INT FOREIGN KEY REFERENCES Classe (IdClasse) NOT NULL,
	IdHabilidade INT FOREIGN KEY REFERENCES Habilidade (IdHabilidade) NOT NULL,
);

CREATE TABLE Personagem(
	IdPersonagem INT PRIMARY KEY IDENTITY,
	IdUsuario INT FOREIGN KEY REFERENCES Usuarios (IdUsuario) NOT NULL,
	NomePersonagem VARCHAR(200) NOT NULL,
	IdClasse INT FOREIGN KEY REFERENCES Classe (IdClasse) NOT NULL,
	CapacidadeHP INT NOT NULL,
	CapacidadeMP INT NOT NULL,
	DataCriacao DATETIME NOT NULL,
	DataAtualizacao DATETIME NOT NULL,
);