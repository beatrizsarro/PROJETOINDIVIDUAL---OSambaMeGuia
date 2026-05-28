CREATE DATABASE oSamba;

USE oSamba;

-- Tabelas 
CREATE TABLE usuario (
id INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(50),
email VARCHAR(50),
senha VARCHAR(50)
);

CREATE TABLE quiz (
idQuiz INT PRIMARY KEY AUTO_INCREMENT, 
pergunta VARCHAR(100),
alternativaA VARCHAR(255),
alternativaB VARCHAR(255),
alternativaC VARCHAR(255)
);

CREATE TABLE instrumento (
idInstrumento INT PRIMARY KEY AUTO_INCREMENT, 
nome VARCHAR(45),
descricao VARCHAR(300)
);

CREATE TABLE resposta (
idResposta INT AUTO_INCREMENT, 
fkUsuario INT, 
fkPergunta INT, 
fkInstrumento INT, 
respostaEscolhida CHAR(1),
PRIMARY KEY (idResposta, fkUsuario, fkPergunta),
FOREIGN KEY (fkUsuario) REFERENCES usuario(id),
FOREIGN KEY (fkPergunta) REFERENCES quiz(idQuiz),
FOREIGN KEY (fkInstrumento) REFERENCES instrumento(idInstrumento)
);

CREATE TABLE aviso (
	id INT PRIMARY KEY AUTO_INCREMENT,
	titulo VARCHAR(100),
	descricao VARCHAR(150),
	fk_usuario INT,
	FOREIGN KEY (fk_usuario) REFERENCES usuario(id)
);

-- Insert
INSERT INTO quiz
(pergunta, alternativaA, alternativaB, alternativaC)
VALUES
(
'Se você fosse ouvir samba, onde seria?',
'Num bar com amigos.',
'Em casa, relaxando.',
'Num grande show.'
),
(
'Se você fosse viajar, qual destino escolheria?',
'Rio de Janeiro',
'Bahia',
'São Paulo'
),
(
'Se você fosse desfilar, qual papel escolheria?',
'Brilhar na frente.',
'Dar ritmo na bateria.',
'Colorir a avenida'
),
(
'Se você fosse tocar, qual papel gostaria de ter?',
'Marcar o ritmo.',
'Criar a harmonia.',
'Dar destaque no ritmo.'
);

INSERT INTO instrumento (nome, descricao) VALUES 
	('Pandeiro', 'Um dos instrumentos de percussão mais conhecidos do samba. Possui pele esticada e platinelas metálicas que funcionam como um "chocalho". 
    No samba, é o “coringa” que mistura batida e chocalho num só toque.'),
    ('Tamborim', 'Pequeno tambor de mão, com som agudo. 
    No samba, é tocado com uma baqueta fina (ou baquetas múltiplas) e movimentos que marcam a cadência, 
    criando frases rítmicas que dão brilho e energia à batucada.'),
    ('Cavaquinho', 
    'O Cavaco é um instrumento pequeno, como um violão em miniatura. Possui quatro cordas. 
    No samba, é responsável por sustentar a harmonia e dar aquele balanço
    característico com batidas rápidas e alegres.');

-- VIEWS
CREATE VIEW vw_listaQuiz AS 
SELECT 
	idQuiz, 
	pergunta, 
	alternativaA, 
	alternativaB, 
	alternativaC
FROM quiz;

CREATE VIEW vw_usuarioQuiz AS
SELECT u.nome AS Nome_usuario,
	pergunta AS Pergunta, 
    respostaEscolhida AS Resposta,
    i.nome as Nome_instrumento,
    i.descricao AS Descricao_instrumento 
 FROM usuario u JOIN resposta r ON u.id = r.fkUsuario 
 JOIN instrumento i ON i.idInstrumento = r.fkInstrumento 
 JOIN quiz ON quiz.idQuiz = r.fkPergunta;
 
 SELECT * FROM vw_usuarioQuiz;
 
 CREATE VIEW vw_usuarioInstrumento AS
    SELECT 
        i.nome AS Nome_Instrumento,
        COUNT(r.fkInstrumento) AS qtd_Usuario
	FROM resposta r
        JOIN instrumento i ON r.fkInstrumento = i.idInstrumento
    GROUP BY i.nome;
    
SELECT * FROM vw_usuarioInstrumento;