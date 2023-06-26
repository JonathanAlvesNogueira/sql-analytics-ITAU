CREATE DATABASE IF NOT EXISTS COMERCIO;

USE COMERCIO;

CREATE TABLE CLIENTE(
    IDCLIENTE INT PRIMARY KEY AUTO_INCREMENT,
    NOME VARCHAR(20) NOT NULL,
    SEXO ENUM('F', 'M') NOT NULL,
    EMAIL VARCHAR(20) UNIQUE,
    CPF CHAR(11) UNIQUE
);

CREATE TABLE ENDERECO(
	IDENDERECO INT PRIMARY KEY AUTO_INCREMENT, 
    RUA VARCHAR(20) NOT NULL,
    CIDADE VARCHAR(20) NOT NULL,
    ESTADO CHAR(2) NOT NULL,
    BAIRRO VARCHAR(20) NOT NULL
);

CREATE TABLE TELEFONE(
	IDTELEFONE INT PRIMARY KEY AUTO_INCREMENT,
    TIPO ENUM('CEL', 'RES', 'COM'),
    NUMERO VARCHAR(11) NOT NULL 
);
/* ENDERECO obrigatorio
CADASTRO SOMENTE UM */

/*TELEFONE NAO OBRIGATORIO
CADASTRO MUITOS */

/*EM RELACIONAMENTOS 1X1 A CHAVE ESTRANGEIRA FICA NA TABELA MAIS FRACA*/

/* EM RELACIONAMENTO 1 X N A CHAVE ESTRANGEIRA FICARA SEMPRE NA CARDINALIDADE N */