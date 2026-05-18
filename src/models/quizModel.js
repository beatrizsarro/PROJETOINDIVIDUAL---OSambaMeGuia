var database = require("../database/config")

function listarPerguntas() {
    var instrucaoSql = `
    SELECT *
    FROM vw_listaQuiz;
    `;
    return database.executar(instrucaoSql);
    console.log("LISTANDO PERGUNTAS")

    console.log("Executando a instrução SQL: \n Listando Perguntas...." + instrucaoSql);
}

function salvarResposta(fkUsuario, fkPergunta, respostaEscolhida, fkInstrumento = null) {
    let instrucao;

    if (fkInstrumento == null) {
        instrucao = `
            INSERT INTO resposta (fkUsuario, fkPergunta, respostaEscolhida, fkInstrumento)
            VALUES (${fkUsuario}, ${fkPergunta}, '${respostaEscolhida}', NULL);
        `;
    } else {
        instrucao = `
            INSERT INTO resposta (fkUsuario, fkPergunta, respostaEscolhida, fkInstrumento)
            VALUES (${fkUsuario}, ${fkPergunta}, '${respostaEscolhida}', ${fkInstrumento});
        `;
    }
    return database.executar(instrucao);
}

module.exports = {
    listarPerguntas,
    salvarResposta
};