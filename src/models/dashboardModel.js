var database = require("../database/config")

function buscarDadosGrafico(idUsuario) {
    var instrucaoSql = `
        SELECT 
        i.nome AS Nome_Instrumento,
        COUNT(r.fkInstrumento) AS qtd_Usuario,
        (SELECT i2.nome 
        FROM resposta r2
        JOIN instrumento i2 ON r2.fkInstrumento = i2.idInstrumento
        WHERE r2.fkUsuario = ${idUsuario} LIMIT 1) AS Nome_InstrumentoUsuario
        FROM resposta r
        JOIN instrumento i ON r.fkInstrumento = i.idInstrumento
        GROUP BY i.nome;
    `;
    console.log("Executando a instrução SQL: " + instrucaoSql);
    return database.executar(instrucaoSql);
}


module.exports = {buscarDadosGrafico };

