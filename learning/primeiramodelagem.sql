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
INSERT INTO CLIENTE(NOME, SEXO, EMAIL, CPF) VALUES('FLAVIA', 'F', 'FLAVIA@GMAIL.COM', '38716541891');



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

/*projeção é tudo que eu vejo na tela*/
/*SELEÇÃO é um subconjunto dos dados da tabela, O COMANDO PARA SELEÇÃO É O WHERE*/


/*JUNÇÃO CLIENTE-ENDEREÇO*/
SELECT NOME, SEXO, ESTADO, BAIRRO
FROM CLIENTE C
INNER JOIN ENDERECO E
ON IDCLIENTE = ID_CLIENTE
WHERE SEXO = 'F'
;

/* JUNÇÃO CLIENTE-TELEFONE */
SELECT C.NOME, C.SEXO, C.EMAIL, T.NUMERO, T.TIPO
FROM CLIENTE C
INNER JOIN TELEFONE T
ON T.ID_CLIENTE = C.IDCLIENTE
;


/* JUNÇÃO DAS 3 TABELAS */
SELECT C.NOME, C.SEXO, C.EMAIL, E.RUA, E.CIDADE, T.NUMERO, T.TIPO
FROM CLIENTE C
INNER JOIN ENDERECO E
ON C.IDCLIENTE = E.ID_CLIENTE
INNER JOIN TELEFONE T
ON C.IDCLIENTE = T.ID_CLIENTE
;

/*
DML = DATA MANIPULATION LANGUAGE =          INSERT, DELETE e UPDATE
DDL = DATA DEFINITION LANGUAGE =            CREATE, DROP e ALTER.
DCL = DATA CONTROL LANGUAGE =               GRANT e REVOKE
TCL = TRANSACTION CONTROL LANGUAGE=         COMMIT, BEGIN e ROLLBACK.
DQL  =                                      SELECT
*/

/*
	ORDEM DE ESCRITA SQL 
		-SELECT
        -FROM
        -WHERE
        -GROUP BY
        -HAVING
        -ORDER BY
        
	ORDEM DE EXECCUÇÃO SQL
		-FROM
        -ON
        -JOIN
        -WHERE
        -GROUP BY
        -WITH CUBE OR WITH ROLLUP
        -HAVING
        -SELECT 
        -DISTINCT
        -ORDER BY
        -TOP
*/

/* VERIFICANDO SE É O QUE QUERO ATUALIZAR */
SELECT NOME, SEXO
FROM CLIENTE
WHERE NOME = 'ANTONIO';


USE COMERCIO;

/* Trocando ANTONIO por paula */
UPDATE CLIENTE
SET NOME = 'PAULA', SEXO = 'F'
WHERE NOME = 'ANTONIO';

/* ANALISANDO QUEM VOU DELETAR .*/

/* PAUSANDO ESSA PARTE EM ESPECIFICO, 
ESQUECI COMO APAGA EM TODAS AS TABELAS, 
APARENTEMENTE EU SO LEMBRO DO ON CASCADE, 
MAS ME PARECE QUE NAO SEI IMPLEMENTAR ESSA CONSTRAINT */

SELECT C.NOME, C.SEXO, T.NUMERO, T.TIPO
FROM CLIENTE C
INNER JOIN TELEFONE T
ON C.IDCLIENTE = T.ID_CLIENTE 
WHERE NOME = 'JOAO';

/* PRODUZINDO NOVA TABELA PARA EXEMPLO */
CREATE TABLE PRODUTO(
	IDPRODUTO INT PRIMARY KEY AUTO_INCREMENT,
    NOME_PRODUTO VARCHAR(20) NOT NULL,
    PRECO INT,
    FRETE FLOAT(10,2) NOT NULL
);

/* ALTER TABLE COM CHANGE NA MAIORIA DAS VEZES É USADO PARA MUDAR O NOME DE UM ATRIBUTO   */
ALTER TABLE  PRODUTO
CHANGE PRECO VALOR_UNITARIO INT NOT NULL;

DESC PRODUTO;

/* TIRANDO O NOT NULL APENAS POR EXEMPLO */
ALTER TABLE PRODUTO
CHANGE VALOR_UNITARIO  VALOR_UNITARIO INT;