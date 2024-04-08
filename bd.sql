CREATE DATABASE futebol;
USE futebol;
SHOW TABLES;

CREATE TABLE patrocinador (
	PRIMARY KEY (patrocinador_id),
	patrocinador_id			INT				AUTO_INCREMENT,
    nome_patrocinador		VARCHAR(50)		NOT NULL,
    cnpj_patrocinador		VARCHAR(18)		NOT NULL,
    endereco_patrocinador	VARCHAR(70) 	NOT NULL,
    email_patrocinador		VARCHAR(70)		NOT NULL
);

INSERT INTO patrocinador (
    patrocinador_id,
    nome_patrocinador,
    cnpj_patrocinador,
    endereco_patrocinador,
    email_patrocinador
) VALUES 
    (default, 'Empresa do Futuro LTDA', '12.345.678/0001-90', 'Rua das Flores, 123', 'contato@empresadofuturo.com'),
    (default, 'Império da Moda S.A.', '23.456.789/0001-20', 'Av. Paulista, 456', 'contato@imperiodamoda.com.br'),
    (default, 'Acelera Brasil Ltda.', '34.567.890/0001-30', 'Rua dos Pinheiros, 789', 'contato@acelerabrasil.com'),
    (default, 'Bela Vista Telecomunicações S.A.', '45.678.901/0001-40', 'Av. Brigadeiro Faria Lima, 1010', 'contato@belavistatelecom.com.br'),
    (default, 'Gourmet Food Ltda.', '56.789.012/0001-50', 'Rua Augusta, 987', 'contato@gourmetfood.com'),
    (default, 'Inovação e Tecnologia S.A.', '67.890.123/0001-60', 'Av. Rio Branco, 543', 'contato@inovatec.com.br'),
    (default, 'Tradição Comércio de Produtos Regionais Ltda.', '78.901.234/0001-70', 'Rua São Bento, 432', 'contato@trdicaocomercio.com'),
    (default, 'Sustentabilidade Ambiental S.A.', '89.012.345/0001-80', 'Av. Rebouças, 321', 'contato@sustentabilidadeamb.com.br'),
    (default, 'Big Tech Inc.', '90.123.456/0001-00', 'Av. Engenheiro Luis Carlos Berrini, 777', 'contato@bigtech.com'),
    (default, 'Multimarcas Automotiva Ltda.', '01.234.567/0001-10', 'Rua Oscar Freire, 222', 'contato@multimarcasauto.com');

CREATE TABLE patrocinio (
	PRIMARY KEY (patrocinio_id),
    patrocinio_id 		INT				AUTO_INCREMENT,
	valor_patrocinio 	DECIMAL(9, 2)	NOT NULL,
    inicio_patrocinio	DATE			NOT NULL,
    fim_patrocinio		DATE			NOT NULL,
    patrocinador_fk		INT,
    categoria_fk		INT,
    FOREIGN KEY (patrocinador_fk)
		REFERENCES patrocinador (patrocinador_id),
	FOREIGN KEY (categoria_fk) 
		REFERENCES categoria (categoria_id)
);

select * from categoria;

INSERT INTO patrocinio (
	valor_patrocinio, 
	inicio_patrocinio, 
    fim_patrocinio, 
    patrocinador_fk, 
    categoria_fk
) VALUES
	(50000.00, '2023-01-01', '2024-12-31', 1, 1),
	(30000.00, '2023-01-01', '2023-12-31', 2, 1),
	(15000.00, '2023-06-01', '2024-05-31', 3, 1),
	(75000.00, '2023-01-01', '2024-12-31', 4, 2),
	(40000.00, '2023-01-01', '2023-12-31', 5, 2),
	(20000.00, '2023-06-01', '2024-05-31', 6, 2),
	(150000.00, '2023-01-01', '2024-12-31', 7, 3),
	(80000.00, '2023-01-01', '2023-12-31', 8, 3),
	(50000.00, '2023-06-01', '2024-05-31', 9, 3),
	(25000.00, '2023-06-01', '2024-05-31', 10, 3);
    
UPDATE patrocinio
SET valor_patrocinio = 300000.00
WHERE patrocinio_id = 7;

select * from patrocinio;

CREATE TABLE comissao_tecnica (
	PRIMARY KEY (comissao_id),
	comissao_id				INT 			AUTO_INCREMENT,
    nome_comissao			VARCHAR(50)		NOT NULL,
    num_membros_comissao 	INT				NOT NULL
);

INSERT INTO comissao_tecnica (
	comissao_id, 
    nome_comissao, 
    num_membros_comissao
) VALUES 
	(default, "Comissão Técnica Sub-15", 3),
	(default, "Comissão Técnica Sub-20", 4),
	(default, "Comissão Técnica Profissional", 5);

CREATE TABLE categoria (
	PRIMARY KEY (categoria_id),
    categoria_id			INT		AUTO_INCREMENT,
	nome_categoria 			VARCHAR(12) NOT NULL,
    data_criacao_categoria 	DATE	NOT NULL,
    comissao_tecnica_fk 	INT,
    FOREIGN KEY (comissao_tecnica_fk) 
		REFERENCES 	comissao_tecnica (comissao_id)
);

INSERT INTO categoria (
	categoria_id,
	nome_categoria,
	data_criacao_categoria,
	comissao_tecnica_fk
) VALUES
	(default, "Sub-15", "2010-01-01", 1),
	(default, "Sub-20", "2005-01-01", 2),
	(default, "Profissional", "1990-01-01", 3);

CREATE TABLE cargo (
	PRIMARY KEY (cargo_id),
	cargo_id 			INT 		AUTO_INCREMENT,
    nome_cargo 			VARCHAR(60)	NOT NULL,
    atribuicao_cargo 	TEXT		NOT NULL
);

INSERT INTO cargo (
	cargo_id, 
    nome_cargo, 
    atribuicao_cargo
) VALUES
  (default, "Técnico de Futebol", "Responsável pela gestão técnica da equipe, elaborando e aplicando as estratégias de jogo."),
  (default, "Auxiliar/Coordenador Técnico", "Assistente do técnico, auxiliando na gestão técnica da equipe e na elaboração de estratégias."),
  (default, "Preparador Físico", "Responsável pelo planejamento, prescrição e supervisão dos treinamentos físicos dos jogadores."),
  (default, "Fisioterapeuta", "Responsável pela prevenção e tratamento de lesões dos jogadores."),
  (default, "Treinador de Goleiros e Goleiras", "Responsável pelo treinamento específico de goleiros e goleiras."),
  (default, "Executivo de Futebol", "Responsável pela gestão administrativa e financeira do clube."),
  (default, "Médico Esportivo", "Responsável pela saúde dos jogadores, realizando avaliações médicas e acompanhamento de lesões."),
  (default, "Advogado Esportivo", "Responsável pelo assessoramento jurídico do clube e dos jogadores."),
  (default, "Analista de Desempenho", "Responsável pela análise e estatística de desempenho dos jogadores e da equipe."),
  (default, "Assessor de Imprensa / Social Media / Produção Audiovisual", "Responsável pela comunicação e divulgação do clube nas redes sociais e mídias digitais."),
  (default, "Nutricionista", "Responsável pela orientação e acompanhamento nutricional dos jogadores."),
  (default, "Psicólogo", "Responsável pelo acompanhamento psicológico dos jogadores e da equipe, promovendo a saúde mental e bem-estar.");

CREATE TABLE funcionario (
	PRIMARY KEY (funcionario_id),
	funcionario_id 				INT 			AUTO_INCREMENT,
    nome_funcionario 			VARCHAR(60) 	NOT NULL,
    endereco_funcionario 		VARCHAR (70) 	NOT NULL,
    salario_funcionario 		DECIMAL(7,2) 	NOT NULL,
    data_nascimento_funcionario DATE			NOT NULL,
    cargo_fk 					INT,
    comissao_fk					INT,
    FOREIGN KEY (cargo_fk) 
		REFERENCES cargo (cargo_id),
    FOREIGN KEY (comissao_fk) 
		REFERENCES comissao_tecnica (comissao_id)
);

#Funcionarios da categoria sub-15

INSERT INTO funcionario (
	nome_funcionario,
    endereco_funcionario,
    salario_funcionario,
    data_nascimento_funcionario,
    cargo_fk,
    comissao_fk
) VALUES
  ("Carlos Eduardo","Rua Álvares de Azevedo, 38, Jardim América, São Paulo-SP", 4500.00,"1985-01-22", 1, 1),
  ("Amanda Costa","Rua Antônio Camardo, 109, Parque do Jardim, Osasco-SP", 2800.00,"1990-06-04", 2, 1),
  ("Marcelo Souza","Rua Baronesa de Itu, 26, Higienópolis, São Paulo-SP", 3400.00,"1982-03-17", 3, 1),
  ("Lucas Silva","Rua Estevão de Araújo, 134, Perdizes, São Paulo-SP", 2800.00,"1989-07-11", 4, 1),
  ("Roberta Martins","Rua do Horto, 231, Horto Florestal, São Paulo-SP", 4000.00,"1987-11-23", 5, 1),
  ("Luisa Oliveira","Rua Cincinato Braga, 339, Bela Vista, São Paulo-SP", 3200.00,"1991-09-15", 7, 1),
  ("Pedro Henrique","Rua Alves Guimarães, 60, Pinheiros, São Paulo-SP", 3700.00,"1980-12-28", 8, 1),
  ("Júlia Santos","Rua Dom José de Barros, 50, Centro, São Paulo-SP", 3500.00,"1986-04-09", 9, 1),
  ("Camila Oliveira","Rua Catequese, 98, Jardim, Santo André-SP", 2900.00,"1994-05-22", 11, 1),
  ("Lucas Ferreira","Rua dos Tamoios, 233, Santa Cecília, São Paulo-SP", 3000.00,"1988-02-11", 12, 1);
  
#Funcionarios da Categoria Sub-20

INSERT INTO funcionario (
	nome_funcionario, 
    endereco_funcionario, 
    salario_funcionario, 
    data_nascimento_funcionario, 
    cargo_fk, 
    comissao_fk
) VALUES
	('Carlos Eduardo Silva', 'Rua das Flores, 123', 3000.00, '1995-07-15', 1, 2),
	('Márcia Oliveira Santos', 'Av. dos Pássaros, 456', 2500.00, '1998-04-20', 2, 2),
	('Lucas Almeida Souza', 'Rua das Palmeiras, 789', 3500.00, '1993-10-01', 3, 2),
	('Ricardo Pereira Lima', 'Av. das Acácias, 321', 4000.00, '1991-05-12', 4, 2),
	('Ana Carolina Costa', 'Rua das Águias, 654', 2700.00, '1997-02-28', 5, 2),
	('João Marcelo Fernandes', 'Av. dos Girassóis, 987', 2800.00, '1996-09-10', 7, 2),
	('Gustavo Oliveira Sousa', 'Rua dos Lírios, 555', 3200.00, '1994-12-25', 8, 2),
	('Fernanda Rocha Silva', 'Av. das Orquídeas, 777', 2900.00, '1997-11-05', 9, 2),
	('Marcela Rodrigues Santos', 'Rua dos Cravos, 222', 3500.00, '1993-08-15', 11, 2),
	('Luciano Santos Alves', 'Av. das Margaridas, 333', 4500.00, '1990-03-30', 12, 2);

#Funcionarios da Categoria Profissional

INSERT INTO funcionario (
	nome_funcionario, 
    endereco_funcionario, 
    salario_funcionario, 
    data_nascimento_funcionario, 
    cargo_fk, 
    comissao_fk
) VALUES 
	('Roberto Alves', 'Rua das Flores, 123 - São Paulo/SP', 7500.00, '1980-02-22', 1, 3),
	('Maria de Souza', 'Rua das Palmeiras, 456 - Rio de Janeiro/RJ', 4500.00, '1990-05-10', 2, 3),
	('João Silva', 'Rua das Árvores, 789 - Belo Horizonte/MG', 5500.00, '1985-07-15', 3, 3),
	('Luciana Oliveira', 'Rua dos Girassóis, 111 - Curitiba/PR', 3500.00, '1995-01-30', 4, 3),
	('Pedro Santos', 'Rua das Orquídeas, 222 - Salvador/BA', 5000.00, '1992-12-20', 5, 3),
	('Fernanda Rodrigues', 'Rua das Tulipas, 333 - Florianópolis/SC', 6000.00, '1987-09-05', 7, 3),
	('Ricardo Gomes', 'Rua das Azaleias, 444 - Recife/PE', 4000.00, '1998-03-12', 8, 3),
	('Ana Paula Costa', 'Rua dos Lírios, 555 - Fortaleza/CE', 6500.00, '1983-11-25', 9, 3),
	('Carlos Eduardo', 'Rua das Margaridas, 666 - Brasília/DF', 7000.00, '1982-06-18', 11, 3),
	('Silvia Almeida', 'Rua das Camélias, 777 - Goiânia/GO', 4500.00, '1993-08-01', 12, 3);

SELECT min(salario_funcionario) FROM funcionario;

SELECT * FROM funcionario;

SELECT nome_funcionario, nome_cargo, salario_funcionario
FROM funcionario, cargo
WHERE salario_funcionario = (SELECT MIN(salario_funcionario) FROM funcionario) AND cargo_fk = cargo_id;

#Inflação Abril 2023 = 0,57

UPDATE funcionario
SET salario_funcionario = salario_funcionario + (salario_funcionario * 0.0057);

#Socialmedia e Executivo de futebol

INSERT INTO funcionario (
	nome_funcionario, 
    endereco_funcionario, 
    salario_funcionario, 
    data_nascimento_funcionario, 
    cargo_fk, 
    comissao_fk
) VALUES (
	'Joana Silva', 
    'Rua dos Esportes, 123', 
    12000.00, 
    '1985-05-12',
    5, 
    null
);

INSERT INTO funcionario (
	nome_funcionario, 
    endereco_funcionario, 
    salario_funcionario, 
    data_nascimento_funcionario, 
    cargo_fk, 
    comissao_fk
) VALUES (
	'Marcos Oliveira', 
    'Av. das Empresas, 456', 
    25000.00, 
    '1975-10-22', 
    6, 
    null
);

CREATE TABLE responsavel (
	PRIMARY KEY (responsavel_id),
	responsavel_id 			INT 			AUTO_INCREMENT,
    nome_responsavel 		VARCHAR(60)		NOT NULL,
	cpf_responsavel 		VARCHAR(14)		NOT NULL,
    endereco_responsavel 	VARCHAR(70)		NOT NULL
);

INSERT INTO responsavel (
	nome_responsavel, 
    cpf_responsavel, 
    endereco_responsavel
) VALUES 
    ('João Silva', '123.456.789-00', 'Rua A, 123, Bairro C'),
    ('Maria Santos', '987.654.321-00', 'Avenida X, 456, Bairro Y'),
    ('Fernando Souza', '111.222.333-00', 'Rua B, 345, Bairro D'),
    ('Ana Oliveira', '444.555.666-00', 'Avenida Z, 678, Bairro W'),
    ('Gabriel Costa', '777.888.999-00', 'Rua C, 890, Bairro E'),
    ('Juliana Almeida', '333.222.111-00', 'Avenida Y, 765, Bairro Z'),
    ('Rodrigo Nunes', '222.333.444-00', 'Rua D, 321, Bairro F'),
    ('Mariana Santos', '555.444.333-00', 'Avenida X, 123, Bairro W'),
    ('Lucas Oliveira', '888.999.000-00', 'Rua E, 432, Bairro G'),
    ('Carla Costa', '000.111.222-00', 'Avenida W, 987, Bairro H');

CREATE TABLE telefone (
	PRIMARY KEY (telefone_id),
	telefone_id 	INT 		AUTO_INCREMENT,
    numero_telefone VARCHAR(15) NOT NULL	UNIQUE,
    responsavel_fk 	INT,
    funcionario_fk 	INT,
    patrocinador_fk INT,
    FOREIGN KEY (responsavel_fk)
		REFERENCES responsavel (responsavel_id),
    FOREIGN KEY (funcionario_fk) 
		REFERENCES funcionario (funcionario_id),
	FOREIGN KEY (patrocinador_fk)
		REFERENCES patrocinador (patrocinador_id)
);

SELECT nome_jogador, nome_responsavel, cpf_responsavel FROM jogador, responsavel WHERE responsavel_fk = responsavel_id;
SELECT * FROM responsavel WHERE nome_responsavel = "João Silva";
SELECT * FROM jogador WHERE responsavel_fk = 1;

#Telefone dos responsáveis

INSERT INTO telefone (
	telefone_id, 
    numero_telefone, 
    responsavel_fk, 
    funcionario_fk, 
    patrocinador_fk
) VALUES
	(default, '(21) 99999-1111', 1, null, null),
	(default, '(11) 88888-2222', 2, null, null),
	(default, '(51) 77777-3333', 3, null, null),
	(default, '(31) 66666-4444', 4, null, null),
	(default, '(41) 55555-5555', 5, null, null),
	(default, '(81) 44444-6666', 6, null, null),
	(default, '(27) 33333-7777', 7, null, null),
	(default, '(12) 22222-8888', 8, null, null),
	(default, '(13) 11111-9999', 9, null, null),
	(default, '(19) 00000-0000', 10, null, null);

#Telefone dos Patrocinadores

INSERT INTO telefone (
	telefone_id, 
    numero_telefone, 
    responsavel_fk, 
    funcionario_fk, 
    patrocinador_fk
) VALUES
	(DEFAULT, '(11) 99999-1111', NULL, NULL, 1),
	(DEFAULT, '(11) 99999-2222', NULL, NULL, 2),
	(DEFAULT, '(11) 99999-3333', NULL, NULL, 3),
	(DEFAULT, '(11) 99999-4444', NULL, NULL, 4),
	(DEFAULT, '(11) 99999-5555', NULL, NULL, 5),
	(DEFAULT, '(11) 99999-6666', NULL, NULL, 6),
	(DEFAULT, '(11) 99999-7777', NULL, NULL, 7),
	(DEFAULT, '(11) 99999-8888', NULL, NULL, 8),
	(DEFAULT, '(11) 99999-9999', NULL, NULL, 9),
	(DEFAULT, '(11) 98888-8888', NULL, NULL, 10);

#Telefone dos Funcionarios

INSERT INTO telefone (
	telefone_id, 
    numero_telefone, 
    responsavel_fk, 
    patrocinador_fk, 
    funcionario_fk
) VALUES 
	(DEFAULT, '(11) 98765-4321', NULL, NULL, 1),
	(DEFAULT, '(12) 34567-8901', NULL, NULL, 2),
	(DEFAULT, '(13) 24680-1357', NULL, NULL, 3),
	(DEFAULT, '(14) 36925-8147', NULL, NULL, 4),
	(DEFAULT, '(15) 75319-6284', NULL, NULL, 5),
	(DEFAULT, '(16) 95182-7463', NULL, NULL, 6),
	(DEFAULT, '(17) 82476-5931', NULL, NULL, 7),
	(DEFAULT, '(18) 63759-1842', NULL, NULL, 8),
	(DEFAULT, '(19) 45612-9738', NULL, NULL, 9),
	(DEFAULT, '(21) 34567-9812', NULL, NULL, 10),
	(DEFAULT, '(22) 74185-2096', NULL, NULL, 11),
	(DEFAULT, '(24) 92635-4817', NULL, NULL, 12);

INSERT INTO telefone (
	telefone_id, 
    numero_telefone, 
    responsavel_fk, 
    patrocinador_fk, 
    funcionario_fk
) VALUES 
	(DEFAULT, '(21) 98765-4321', NULL, NULL, 13),
    (DEFAULT, '(14) 34567-8901', NULL, NULL, 14),
    (DEFAULT, '(13) 45678-9012', NULL, NULL, 15),
    (DEFAULT, '(14) 56789-0123', NULL, NULL, 16),
    (DEFAULT, '(15) 67890-1234', NULL, NULL, 17),
    (DEFAULT, '(16) 78901-2345', NULL, NULL, 18),
    (DEFAULT, '(17) 89012-3456', NULL, NULL, 19),
    (DEFAULT, '(18) 90123-4567', NULL, NULL, 20),
    (DEFAULT, '(19) 01234-5678', NULL, NULL, 21),
    (DEFAULT, '(21) 12345-6789', NULL, NULL, 22),
    (DEFAULT, '(22) 23456-7890', NULL, NULL, 23),
    (DEFAULT, '(24) 34567-8901', NULL, NULL, 24);
       
INSERT INTO telefone (
	telefone_id, 
    numero_telefone, 
    responsavel_fk, 
    patrocinador_fk, 
    funcionario_fk
) VALUES 
	(DEFAULT, '(81) 98111-2222', NULL, NULL, 25),
	(DEFAULT, '(83) 99111-2222', NULL, NULL, 26),
	(DEFAULT, '(84) 98111-2222', NULL, NULL, 27),
	(DEFAULT, '(85) 99111-2222', NULL, NULL, 28),
	(DEFAULT, '(86) 98111-2222', NULL, NULL, 29),
	(DEFAULT, '(87) 99111-2222', NULL, NULL, 30),
	(DEFAULT, '(88) 98111-2222', NULL, NULL, 31),
	(DEFAULT, '(89) 99111-2222', NULL, NULL, 32),
	(DEFAULT, '(81) 98222-3333', NULL, NULL, 25),
	(DEFAULT, '(83) 99222-3333', NULL, NULL, 26),
	(DEFAULT, '(84) 98222-3333', NULL, NULL, 27),
	(DEFAULT, '(85) 99222-3333', NULL, NULL, 28);

CREATE TABLE jogador (
	PRIMARY KEY (jogador_id),
	jogador_id	 			INT 			AUTO_INCREMENT,
    nome_jogador			VARCHAR(60) 	NOT NULL,
    data_nascimento_jogador DATE			NOT NULL,
    peso_jogador 			DECIMAL(5,2) 	NOT NULL,
    altura_jogador 			INT 			NOT NULL,
    pe_costume_jogador 		CHAR(1) 		NOT NULL,
    cpf_jogador 			VARCHAR(14) 	NOT NULL UNIQUE,
    responsavel_fk 			INT,
    categoria_fk			INT				NOT NULL,
    FOREIGN KEY (responsavel_fk)
		REFERENCES responsavel (responsavel_id),
	FOREIGN KEY (categoria_fk)
		REFERENCES categoria (categoria_id)
);

#Jogadores da categoria Sub-15

INSERT INTO jogador (
	jogador_id, 
	nome_jogador, 
	data_nascimento_jogador, 
	peso_jogador, 
    altura_jogador, 
    pe_costume_jogador, 
    cpf_jogador, 
    responsavel_fk, 
    categoria_fk
) VALUES
	(DEFAULT, 'Carlos Silva', '2008-07-15', 55.5, 165, 'D', '123.456.789-01', 5, 4),
	(DEFAULT, 'Luisa Santos', '2009-01-30', 50.0, 160, 'E', '234.567.890-12', 2, 4),
	(DEFAULT, 'Marcos Oliveira', '2010-06-02', 45.5, 155, 'A', '345.678.901-23', 8, 4),
	(DEFAULT, 'Renata Costa', '2008-12-08', 52.0, 158, 'D', '456.789.012-34', 3, 4),
	(DEFAULT, 'Thiago Martins', '2007-11-23', 60.0, 170, 'E', '567.890.123-45', 1, 4);

#Jogadores Sub-20

INSERT INTO jogador (
	nome_jogador, 
	data_nascimento_jogador, 
	peso_jogador, 
	altura_jogador, 
	pe_costume_jogador, 
	cpf_jogador, 
	responsavel_fk, 
	categoria_fk
) VALUES
    ('Felipe Silva', '2006-03-02', 68.5, 176, 'D', '333.222.111', 9, 5),
    ('Gabriel Santos', '2007-09-12', 72.1, 185, 'E', '444.777.333', 4, 5),
    ('Lucas Oliveira', '2004-05-20', 58.9, 167, 'A', '111.444.777', NULL, 5),
    ('Mariana Souza', '2005-02-28', 52.3, 160, 'E', '222.111.444', 1, 5),
    ('Renato Alves', '2005-07-18', 63.2, 172, 'D', '444.111.555', 3, 5),
    ('Amanda Costa', '2003-08-05', 70.9, 179, 'A', '555.222.111', NULL, 5),
    ('Eduardo Santos', '2007-11-25', 66.5, 174, 'D', '333.777.555', 10, 5),
    ('Larissa Lima', '2006-02-15', 53.7, 162, 'E', '111.777.222', NULL, 5),
    ('Pedro Ferreira', '2006-12-03', 57.8, 170, 'D', '333.444.555', 6, 5),
    ('Thiago Souza', '2005-03-18', 65.1, 178, 'A', '555.111.444', NULL, 5),
    ('Camila Costa', '2004-06-28', 51.9, 161, 'E', '222.777.444', 7, 5);

#Jogadores Profissionais

INSERT INTO jogador (
	jogador_id, 
    nome_jogador, 
    data_nascimento_jogador, 
    peso_jogador, 
    altura_jogador, 
    pe_costume_jogador, 
    cpf_jogador, 
    responsavel_fk, 
    categoria_fk
) VALUES 
	(DEFAULT, 'Rodrigo Silva', '1995-01-01', 80.5, 180, 'D', '113.456.789-01', NULL, 6),
	(DEFAULT, 'Luiz Santos', '1994-05-08', 75.2, 176, 'E', '244.567.890-12', NULL, 6),
	(DEFAULT, 'Felipe Costa', '1992-09-15', 90.0, 185, 'D', '422.678.901-23', NULL, 6),
	(DEFAULT, 'Gustavo Pereira', '1990-03-27', 82.7, 181, 'E', '234.789.012-34', NULL, 6),
	(DEFAULT, 'Tiago Oliveira', '1993-11-21', 87.3, 182, 'D', '454.890.123-45', NULL, 6),
	(DEFAULT, 'Luis Fernandes', '1998-07-04', 64.9, 169, 'E', '765.901.234-56', NULL, 6),
	(DEFAULT, 'Fernando Souza', '1997-09-10', 69.1, 171, 'D', '989.012.345-67', NULL, 6),
	(DEFAULT, 'Gabriel Barbosa', '1996-02-12', 81.6, 179, 'E', '543.123.456-78', NULL, 6),
	(DEFAULT, 'Matheus Silva', '1999-04-30', 72.8, 175, 'D', '543.234.567-89', NULL, 6),
	(DEFAULT, 'Juliano Oliveira', '1991-12-29', 68.4, 168, 'E', '012.345.678-90', NULL, 6),
	(DEFAULT, 'Bruno Santos', '1994-08-22', 79.3, 178, 'D', '098.765.432-10', NULL, 6);
       
INSERT INTO jogador (
	jogador_id, 
	nome_jogador, 
	data_nascimento_jogador, 
	peso_jogador, 
	altura_jogador, 
	pe_costume_jogador, 
	cpf_jogador, 
	responsavel_fk, 
	categoria_fk
) VALUES 
	(DEFAULT, 'João Silva', '1995-01-20', 80.5, 180, 'D', '123.456.789-00', NULL, 6),
	(DEFAULT, 'Lucas Souza', '1993-04-10', 75.3, 175, 'E', '987.654.321-00', NULL, 6),
	(DEFAULT, 'Pedro Santos', '1994-09-18', 70.1, 170, 'A', '456.789.123-00', NULL, 6),
	(DEFAULT, 'Mariano Oliveira', '1992-06-03', 65.7, 165, 'D', '321.654.987-00', NULL, 6),
	(DEFAULT, 'Carlos Silva', '1997-02-15', 72.8, 168, 'E', '555.555.555-00', NULL, 6),
	(DEFAULT, 'Gustavo Santos', '1990-11-28', 85.9, 185, 'D', '777.777.777-00', NULL, 6),
	(DEFAULT, 'Rafael Ferreira', '1991-08-08', 67.2, 163, 'A', '222.222.222-00', NULL, 6),
	(DEFAULT, 'Bruno Silva', '1996-05-22', 73.4, 175, 'E', '444.444.444-00', NULL, 6),
	(DEFAULT, 'Cleison Rodrigues', '1994-12-01', 66.8, 167, 'D', '999.999.999-00', NULL, 6),
	(DEFAULT, 'Vinícius Souza', '1993-07-14', 79.2, 182, 'A', '111.111.111-00', NULL, 6),
	(DEFAULT, 'A Oliveira', '1997-11-05', 68.5, 165, 'E', '333.333.333-00', NULL, 6);

UPDATE jogador
SET nome_jogador = 'Adão Oliveira'
WHERE jogador_id = 71;

SELECT nome_jogador, data_nascimento_jogador 
FROM jogador
ORDER BY nome_jogador ASC;

CREATE TABLE contrato (
	PRIMARY KEY (contrato_id),
    contrato_id 			INT 			AUTO_INCREMENT,
    data_inicio_contrato	DATE			NOT NULL,
    data_fim_contrato		DATE			NOT NULL,
    valor_contrato			DECIMAL(7,2)	NOT NULL,
    jogador_fk				INT,
    FOREIGN KEY (jogador_fk)
		REFERENCES jogador (jogador_id)
);

# Contrato dos jogadores Sub-15

INSERT INTO contrato (
	contrato_id, 
	data_inicio_contrato, 
	data_fim_contrato, 
	valor_contrato, 
	jogador_fk
) VALUES 
	(DEFAULT, '2023-06-01', '2027-06-01', 400.00, 1),
	(DEFAULT, '2023-06-01', '2027-06-01', 350.00, 2),
	(DEFAULT, '2023-06-01', '2027-06-01', 500.00, 3),
	(DEFAULT, '2023-06-01', '2027-06-01', 450.00, 4),
	(DEFAULT, '2023-06-01', '2027-06-01', 300.00, 5);

# Contrato dos Jogadores Sub-20

INSERT INTO contrato (
	contrato_id, 
    data_inicio_contrato, 
    data_fim_contrato, 
    valor_contrato, 
    jogador_fk
) VALUES 
	(DEFAULT, '2019-06-10', '2023-06-10', 10000.00, 6),
	(DEFAULT, '2020-01-20', '2024-01-20', 22000.00, 7),
	(DEFAULT, '2021-02-15', '2026-02-15', 18500.00, 8),
	(DEFAULT, '2018-11-25', '2022-11-25', 940.00, 9),
	(DEFAULT, '2019-07-01', '2023-07-01', 5000.00, 10),
	(DEFAULT, '2020-03-15', '2024-03-15', 15000.00, 11),
	(DEFAULT, '2022-01-05', '2027-01-05', 17000.00, 12),
	(DEFAULT, '2018-12-12', '2022-12-12', 1300.00, 13),
	(DEFAULT, '2021-04-20', '2026-04-20', 11000.00, 14),
	(DEFAULT, '2020-06-30', '2025-06-30', 8000.00, 15),
	(DEFAULT, '2019-09-08', '2023-09-08', 4800.00, 16);

# Contrato dos Jogadores Profissionais

INSERT INTO contrato (
	contrato_id, 
    data_inicio_contrato, 
    data_fim_contrato, 
    valor_contrato, 
    jogador_fk
) VALUES 
	(DEFAULT, '2022-01-01', '2026-01-01', 15000.00, 50),
	(DEFAULT, '2022-01-01', '2026-01-01', 18000.00, 51),
	(DEFAULT, '2022-01-01', '2026-01-01', 12000.00, 52),
	(DEFAULT, '2022-01-01', '2024-01-01', 10000.00, 53),
	(DEFAULT, '2023-01-01', '2025-01-01', 25000.00, 54),
    (DEFAULT, '2024-01-01', '2027-01-01', 45000.00, 55),
    (DEFAULT, '2022-01-01', '2024-01-01', 5000.00, 56),
	(DEFAULT, '2022-01-01', '2023-01-01', 1000.00, 57),
	(DEFAULT, '2023-01-01', '2025-01-01', 8000.00, 58),
	(DEFAULT, '2022-01-01', '2026-01-01', 30000.00, 59),
	(DEFAULT, '2022-01-01', '2026-01-01', 50000.00, 60);

INSERT INTO contrato (
	contrato_id,
    data_inicio_contrato, 
    data_fim_contrato, 
    valor_contrato, 
    jogador_fk
) VALUES 
	(DEFAULT, '2023-05-08', '2027-05-08', 32000.00, 61),
	(DEFAULT, '2023-06-01', '2026-06-01', 15000.00, 62),
	(DEFAULT, '2023-07-15', '2025-07-15', 22000.00, 63),
	(DEFAULT, '2023-08-12', '2024-08-12', 3500.00, 64),
	(DEFAULT, '2023-09-25', '2027-09-25', 42000.00, 65),
	(DEFAULT, '2024-01-08', '2026-01-08', 12000.00, 66),
	(DEFAULT, '2024-02-12', '2028-02-12', 47000.00, 67),
	(DEFAULT, '2024-03-22', '2027-03-22', 29000.00, 68),
	(DEFAULT, '2024-05-01', '2026-05-01', 18000.00, 69),
	(DEFAULT, '2024-07-08', '2025-07-08', 2500.00, 70),
	(DEFAULT, '2024-08-18', '2026-08-18', 13000.00, 71);
    
SELECT AVG(valor_contrato)
FROM contrato;
    
CREATE TABLE lesao (
	PRIMARY KEY (lesao_id),
	lesao_id			INT				AUTO_INCREMENT,
    tipo_lesao			VARCHAR(50)		NOT NULL,
    data_lesao			DATE			NOT NULL,
    recuperacao_lesao	VARCHAR(25)		NOT NULL,
	jogador_fk			INT,
    FOREIGN KEY (jogador_fk)
		REFERENCES jogador (jogador_id)
);

INSERT INTO lesao (
	lesao_id, 
    tipo_lesao, 
    data_lesao, 
    recuperacao_lesao, 
    jogador_fk
) VALUES
	(DEFAULT, 'Lesão no joelho', '2022-01-15', 'Em recuperação', 1),
	(DEFAULT, 'Lesão no tornozelo', '2022-03-20', 'Recuperado', 2),
	(DEFAULT, 'Lesão muscular', '2022-04-01', 'Em recuperação', 5),
	(DEFAULT, 'Lesão na coxa', '2022-05-10', 'Recuperado', 9),
	(DEFAULT, 'Lesão no ombro', '2022-06-18', 'Em recuperação', 13);

INSERT INTO lesao (
	lesao_id, 
    tipo_lesao, 
    data_lesao, 
    recuperacao_lesao, 
    jogador_fk
) VALUES 
	(DEFAULT, 'Lesão no joelho', '2022-01-15', 'Em recuperação', 50),
	(DEFAULT, 'Lesão no tornozelo', '2022-03-20', 'Recuperado', 52),
	(DEFAULT, 'Lesão muscular', '2022-05-05', 'Recuperado', 56);


# Selecionar o funcionario que tem o menor salario
SELECT min(salario_funcionario) FROM funcionario;

# Seleção cruzada entre funcionario e cargo, onde o salario do funcionario é igual ao menor salario
SELECT nome_funcionario, nome_cargo, salario_funcionario
FROM funcionario, cargo
WHERE salario_funcionario = (SELECT MIN(salario_funcionario) FROM funcionario) AND cargo_fk = cargo_id;

# Seleciona todos os jogadores ordenados pelo nome em ordem crescente
SELECT nome_jogador, data_nascimento_jogador 
FROM jogador
ORDER BY nome_jogador ASC;

# Seleciona todos os contratos e calcula a média dos valores
SELECT AVG(valor_contrato)
FROM contrato;