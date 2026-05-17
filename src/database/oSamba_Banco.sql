CREATE DATABASE oSamba;

USE oSamba;

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

CREATE TABLE artista (
idArtista INT PRIMARY KEY AUTO_INCREMENT, 
nome VARCHAR(45)
);

CREATE TABLE instrumento (
idInstrumento INT PRIMARY KEY AUTO_INCREMENT, 
nome VARCHAR(45),
descricao VARCHAR(200),
fkArtista INT, 
CONSTRAINT fkArtistaInstrumento FOREIGN KEY (fkArtista) REFERENCES artista(idArtista)
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

CREATE VIEW vw_listaQuiz AS 
SELECT 
	idQuiz, 
	pergunta, 
	alternativaA, 
	alternativaB, 
	alternativaC
FROM quiz;

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
'Dar destaque com sons agudo'
);
