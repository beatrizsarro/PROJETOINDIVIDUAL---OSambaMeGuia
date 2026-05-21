var dashboardModel = require("../models/dashboardModel");

function buscarDadosGrafico(req, res) {
    var idUsuario = req.params.idUsuario;

    dashboardModel.buscarDadosGrafico(idUsuario)
        .then(resultado => {
            res.json(resultado);
        })
        .catch(erro => {
            console.error("Erro ao buscar dados do quiz:", erro.sqlMessage);
            res.status(500).json(erro.sqlMessage);
        });
}

module.exports = {
    buscarDadosGrafico
};
