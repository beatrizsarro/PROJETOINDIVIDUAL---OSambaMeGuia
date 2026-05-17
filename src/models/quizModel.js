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

function salvarResposta(fkUsuario, fkPergunta, respostaEscolhida) {

    const instrucao = `
        INSERT INTO resposta
        (fkUsuario, fkPergunta, respostaEscolhida)
        VALUES
        (${fkUsuario}, ${fkPergunta}, '${respostaEscolhida}');
    `;

    return database.executar(instrucao);
}

module.exports = {
    listarPerguntas,
    salvarResposta
};