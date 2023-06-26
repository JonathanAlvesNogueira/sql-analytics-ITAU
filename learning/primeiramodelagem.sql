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
    BAIRRO VARCHAR(20) NOT NULL,
    ID_CLIENTE INT UNIQUE,
    FOREIGN KEY (ID_CLIENTE) REFERENCES CLIENTE(IDCLIENTE)
);

CREATE TABLE TELEFONE(
	IDTELEFONE INT PRIMARY KEY AUTO_INCREMENT,
    TIPO ENUM('CEL', 'RES', 'COM'),
    NUMERO VARCHAR(11) NOT NULL,
    ID_CLIENTE INT,
    FOREIGN KEY (ID_CLIENTE) REFERENCES CLIENTE(IDCLIENTE)
);
/* ENDERECO obrigatorio
CADASTRO SOMENTE UM */

/*TELEFONE NAO OBRIGATORIO
CADASTRO MUITOS */

/*EM RELACIONAMENTOS 1X1 A CHAVE ESTRANGEIRA FICA NA TABELA MAIS FRACA*/

/* EM RELACIONAMENTO 1 X N A CHAVE ESTRANGEIRA FICARA SEMPRE NA CARDINALIDADE N */

/* VENDO SE ESTA CERTO as tabelas */
SHOW TABLES;

/*VERIFICA O DESCRITIVO DA TABELA*/
DESC CLIENTE;

INSERT INTO CLIENTE(NOME, SEXO, EMAIL, CPF) VALUES('JOAO', 'M', 'JOAOZINHO@GMAIL.COM', '12345678910');
INSERT INTO CLIENTE(NOME, SEXO, EMAIL, CPF) VALUES('PEDRO', 'M', 'PEDRO@GMAIL.COM', '23456789105');
INSERT INTO CLIENTE(NOME, SEXO, EMAIL, CPF) VALUES('CLEBER', 'M', 'CLEBER@GMAIL.COM', '12367890101');
INSERT INTO CLIENTE(NOME, SEXO, EMAIL, CPF) VALUES('ANTONIO', 'M', 'ANTONIO@GMAIL.COM', '71839017651');


/*VERIFICA O DESCRITIVO DA TABELA*/
DESC ENDERECO;
INSERT INTO ENDERECO(RUA, CIDADE, ESTADO, BAIRRO, ID_CLIENTE) VALUES('virgini ferni', 'são paulo','SP', 'Jose Bonifacio',1);
INSERT INTO ENDERECO(RUA, CIDADE, ESTADO, BAIRRO, ID_CLIENTE) VALUES('rua flores novas', 'são paulo','SP', 'itaquera',2);
INSERT INTO ENDERECO(RUA, CIDADE, ESTADO, BAIRRO, ID_CLIENTE) VALUES('Copacaba 251', 'Rio de Janeiro','RJ', 'Rio de Janeiro',3);
INSERT INTO ENDERECO(RUA, CIDADE, ESTADO, BAIRRO, ID_CLIENTE) VALUES('MATAO', 'Minas Gerais','MG', 'matao',4);
INSERT INTO ENDERECO(RUA, CIDADE, ESTADO, BAIRRO, ID_CLIENTE) VALUES('Americanas', 'são paulo','SP', 'Planalto',5);

DESC TELEFONE;
INSERT INTO TELEFONE(TIPO, NUMERO, ID_CLIENTE) VALUES('RES', '95445-0621', 1);
INSERT INTO TELEFONE(TIPO, NUMERO, ID_CLIENTE) VALUES('COM', '25557444', 1);
INSERT INTO TELEFONE(TIPO, NUMERO, ID_CLIENTE) VALUES('CEL', '1267389289', 4);
INSERT INTO TELEFONE(TIPO, NUMERO, ID_CLIENTE) VALUES('CEL', '847444938', 3);
INSERT INTO TELEFONE(TIPO, NUMERO, ID_CLIENTE) VALUES('CEL', '847444938', 3);