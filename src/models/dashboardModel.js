var database = require("../database/config")

function buscarDadosGrafico(idUsuario) {
    var instrucaoSql = `
        SELECT * FROM vw_usuarioInstrumento;
    `;
    console.log("Executando a instrução SQL: " + instrucaoSql);
    return database.executar(instrucaoSql);
}


module.exports = {buscarDadosGrafico };

