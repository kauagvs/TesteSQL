CREATE SCHEMA IF NOT EXISTS `cliente` DEFAULT CHARACTER SET utf8 ;
USE `cliente` ;


	CREATE TABLE tb_customer(
	id_customer integer NOT NULL AUTO_INCREMENT, /* Chave Primária */
	nm_customer VARCHAR (30) NOT NULL,
	cpf_cnpj numeric (50) NOT NULL,
	PRIMARY KEY (id_customer)
    ) ENGINE = innodb;
  
	CREATE TABLE dm_customer_type(
	cd_address_type char (1) NOT NULL, /* Chave Primária */
	ds_address_type VARCHAR (30) NOT NULL,
	PRIMARY KEY (cd_address_type)
    ) ENGINE = innodb;
    
    CREATE TABLE tb_customer_address(
	fk_id_customer integer NOT NULL, 
    fk_cd_address_type char (1) NOT NULL,
    street varchar (20) NOT NULL,
	lot integer (5) NOT NULL,
	referencias varchar (50) NULL,
	zip_code varchar (7) NOT NULL
    ) ENGINE = innodb;
    
   
   /*Adicionando a FOREIGN KEY*/
   
ALTER TABLE tb_customer_address ADD FOREIGN KEY (fk_id_customer) 
REFERENCES tb_customer (id_customer) ;

ALTER TABLE tb_customer_address ADD FOREIGN KEY (fk_cd_address_type) 
REFERENCES dm_customer_type (cd_address_type) ;

 /*Inserção de informação*/

INSERT INTO dm_customer_type (cd_address_type, ds_address_type) 
VALUES ("R", "Residêncial");

INSERT INTO dm_customer_type (cd_address_type, ds_address_type) 
VALUES ("C", "Comercial");

INSERT INTO dm_customer_type (cd_address_type, ds_address_type) 
VALUES ("O", "Outros");

INSERT INTO tb_customer (nm_customer, cpf_cnpj) 
VALUES ("Joãozinho Silva", 88877766655);

INSERT INTO tb_customer_address (fk_id_customer, fk_cd_address_type, street, lot, zip_code) 
VALUES (1, "R", "Rua das Flores", 1, 01234567);

INSERT INTO tb_customer_address (fk_id_customer, fk_cd_address_type, street, lot, referencias, zip_code) 
VALUES (1, "C", "Rua das Pedras", 100, "Conjunto 200", 01234567);

/* Deletar o Registro do Joãozinho
SELECT * FROM tb_customer WHERE cpf_cnpj = 88877766655; 

DELETE FROM tb_customer_address
WHERE fk_id_customer = 1;

DELETE FROM tb_customer
WHERE id_customer = 1;
*/


/* RESPOSTAS
1 - Identifique	as colunas que compõe a chave primária de cada tabela.

Tabela: tb_customer
Chave Primária: id_customer

Tabela: dm_customer_type
Chave Primária: cd_address_type

Tabela: tb_customer_address
Chave Primária: Não possui


2 - Utilizando o comando INSERT	de SQL,	crie os	scripts	para cadastrar o cliente
abaixo:

Joãozinho Silva	- 888.777.666-55
Endereço Residencial: Rua das Flores, 1. CEP: 01234-567
Endereço Comercial:	Rua das	Pedras,	100	Conjunto 200. CEP: 01234-567

Resposta: 
INSERT INTO tb_customer (nm_customer, cpf_cnpj) 
VALUES ("Joãozinho Silva", 88877766655);

INSERT INTO tb_customer_address (fk_id_customer, fk_cd_address_type, street, lot, zip_code) 
VALUES (1, "R", "Rua das Flores", 1, 01234567);

INSERT INTO tb_customer_address (fk_id_customer, fk_cd_address_type, street, lot, referencias, zip_code) 
VALUES (1, "C", "Rua das Pedras", 100, "Conjunto 200", 01234567);


3 - Quantos	endereços diferentes podem ser cadastrado para um cliente?

Resposta: Quantos quisermos, pois estamos adicionando os endereços em uma tabela 
apenas de endereços, sem chave primária e fazendo referência ao cliente com sua ID.


4 - Dado um	CPF, qual seria	o passo	a passo	para excluir um	cliente	da nossa base	
de dados?

Resposta: 

Primeiro teriamos que dar um SELECT na tb_customer para descobrir o id_customer.
SELECT * FROM tb_customer WHERE cpf_cnpj = 88877766655; 

Sabendo o id_customer, devemos deletar as referências de endereço.
DELETE FROM tb_customer_address
WHERE fk_id_customer = 1;

E por final deletar o registro do cliente.
DELETE FROM tb_customer
WHERE id_customer = 1;

*/