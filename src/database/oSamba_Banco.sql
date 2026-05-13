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
texto VARCHAR(100)
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
fkUsuario INT UNIQUE, 
fkQuiz INT UNIQUE, 
fkInstrumento INT UNIQUE, 
PRIMARY KEY (idResposta),
FOREIGN KEY (fkUsuario) REFERENCES usuario(id),
FOREIGN KEY (fkQuiz) REFERENCES quiz(idQuiz),
FOREIGN KEY (fkInstrumento) REFERENCES instrumento(idInstrumento)
);


SELECT * FROM usuario;
