
DROP TABLE IF EXISTS Aluno CASCADE;
DROP TABLE IF EXISTS Livro CASCADE;
DROP TABLE IF EXISTS Emprestimo CASCADE;
DROP TABLE IF EXISTS ItemEmprestimo CASCADE;
 
CREATE TABLE Aluno (
    id_aluno SERIAL PRIMARY KEY,
    nome VARCHAR (20) NOT NULL,
	matricula VARCHAR (4) NOT NULL UNIQUE,
	dataNascimento DATE NOT NULL,
	email VARCHAR(50) NOT NULL,
	telefone VARCHAR(11) NOT NULL
);

CREATE TABLE Livro (
    id_livro SERIAL PRIMARY KEY,
    titulo VARCHAR  NOT NULL,
	autor VARCHAR  NOT NULL,
	editora VARCHAR NOT NULL,
	anoPublicacao INT NOT NULL,
	isbn VARCHAR(15) NOT NULL UNIQUE,
	quantidadeTotal INT NOT NULL,
	quantidadeDisponivel INT NOT NULL
);

CREATE TABLE Emprestimo (
    id_emprestimo SERIAL PRIMARY KEY,
	id_aluno INT NOT NULL,
    dataEmprestimo DATE NOT NULL,
	dataPrevistaDevolucao DATE NOT NULL,
	dataDevolucao DATE NOT NULL,
	FOREIGN KEY (id_aluno) REFERENCES Aluno (id_aluno)
);


CREATE TABLE ItemEmprestimo (
    id_itememprestimo SERIAL PRIMARY KEY,
	id_livro INT NOT NULL,
	id_emprestimo INT NOT NULL,
	FOREIGN KEY  (id_emprestimo) REFERENCES Emprestimo (id_emprestimo),
	FOREIGN KEY (id_livro) REFERENCES Livro(id_livro)
);


INSERT INTO aluno ( nome, matricula, dataNascimento, email, telefone)
VALUES
('Isadora', '3234', '2009-05-25', 'isadora@gmail.com', '12345678909' ),
('Eluara', '1234', '2009-08-15', 'eluara1@gmail.com', '09876543123' ),
('Mariana', '4321', '2009-05-21', 'mariana56@gmail.com', '45637287986' ),
('Lavinia', '6789', '2010-07-19', 'lavinia.brownie@gmail.com', '45678765456' ),
('Amanda', '4563', '2009-12-29', 'amanda.betinha6@gmail.com', '78909876887' ),
('Jose', '0989', '2000-04-08', 'jose23@gmail.com', '65789870094' ),
('Renato', '8789', '1990-03-03', 'renatinho@gmail.com', '87656787987' ),
('Kalebe', '7678', '2006-12-21', 'kalebe.junior@gmail.com', '56789453676' ),
('Jon Snow', '4564', '2008-02-14', 'jon.snow@email.com', '16990000001'),
('Arya Stark',  '5676','2009-04-22', 'arya.stark@email.com', '16990000002'),
('Tyrion Lannister',  '7689', '2007-11-18', 'tyrion.lannister@email.com', '16990000003'),
('Daenerys Targaryen',  '9087', '2008-07-01', 'daenerys.targaryen@email.com', '16990000004'),
('Arthur Morgan',  '1224', '2007-03-09', 'arthur.morgan@email.com', '16990000005'), 
('John Marston',  '4768', '2008-09-16', 'john.marston@email.com', '16990000006'),
('Sadie Adler',  '7865', '2009-01-27', 'sadie.adler@email.com', '16990000007'),
('Dutch van der Linde',  '4624', '2007-06-12', 'dutch.vanderlinde@email.com', '16990000008');

INSERT INTO Livro (titulo, autor, editora, anoPublicacao, isbn, quantidadeTotal, quantidadeDisponivel) VALUES
('Matilda', 'Roberta Miranda', 'Saraiva', 1998, '1234567890', '10', '3' ),
('Vidas Secas', 'Graciliano Ramos', 'Leiturinha' ,2007, '0987654321', '7', '2' ),
('O cortiço', 'Aluizio de Azevedo', 'Saraa', 1987, '1234587891', '15', '8' ),
('Fala serio mãe', 'Thalita Rebouças', 'Saraiva', 2015, '4356278765', '6', '1' ),
('A hora da estrela', 'Clarice Lispector', 'Coolorado', 2007, '7685909878', '17', '5' ),
('Marcelo Marmelo Martelo', 'Monteiro Lobato', 'Leitura', 2012, '25376589345', '5', '2' ),
('Sitio do pica-pau amarelo', 'Monteiro Lobato', 'Coovver', 1999, '1239867568', '10', '5' ),
('Temporal', 'Pablo Vittar', 'Saraiva', 2008, '45630876890', '3', '1' ),
( 'Introdução à Orientação a Objetos com C++ e Python', 'Orlando Saraiva Jr.', 'Novatec', 2017, '1234556776', 12, 12),
('Análise e Design Orientados a Objetos', 'Hélio Engholm Jr.', 'Novatec', 2013,'5677963678', 10, 10 ),
('C# - Guia de Consulta Rápida','Joel Saade','Novatec', 2008, '2345642134', 14, 14),
('Requisitos em Projetos de Software e de Sistemas de Informação', 'João M. Fernandes e Ricardo J. Machado', 'Novatec', 2017, '9875679536', 11, 11),
('Engenharia de Software na Prática', 'Hélio Engholm Jr.', 'Novatec', 2010,'3456789090', 13, 13),
('Fundamentos da Engenharia de Software','Nathaniel Schutta e Dan Vega','Novatec', 2026 ,'5674898907', 15, 15);


INSERT INTO Emprestimo (id_aluno, dataEmprestimo, dataPrevistaDevolucao, dataDevolucao) VALUES
(8, '2026-05-10', CURRENT_DATE + 7, '2026-05-25' ),
(7, '2026-03-10', CURRENT_DATE + 7, '2026-03-25' ),
(6, '2026-11-10', CURRENT_DATE + 7, '2026-11-25' ),
(5, '2026-02-10', CURRENT_DATE + 7, '2026-02-25' ),
(4, '2026-12-10', CURRENT_DATE + 7, '2026-12-25' ),
(3, '2026-01-10', CURRENT_DATE + 7, '2026-01-25' ),
(2, '2026-07-10', CURRENT_DATE + 7, '2026-07-25' ),
(1, '2026-08-10', CURRENT_DATE + 7, '2026-08-25' ),
(9,'2026-11-01', CURRENT_DATE + 7, '2026-11-10'),
(10, '2026-12-01', CURRENT_DATE + 7, '2026-12-10'),
(11, '2026-03-01', CURRENT_DATE + 7, '2026-03-10'),
(12, '2026-09-01', CURRENT_DATE + 7, '2026-09-10'),
(13, '2026-06-01', CURRENT_DATE + 7,'2026-06-10');


INSERT INTO ItemEmprestimo (id_itememprestimo, id_livro, id_emprestimo) VALUES
(1, 2, 3),
(2, 3, 1),
(3, 1, 2),
(5, 6, 7),
(8, 2, 4),
(6, 2, 1),
(7, 2, 3),
(9, 2, 5);


SELECT * FROM Aluno;
SELECT * FROM Livro;
SELECT * FROM Emprestimo;
SELECT * FROM ItemEmprestimo;



