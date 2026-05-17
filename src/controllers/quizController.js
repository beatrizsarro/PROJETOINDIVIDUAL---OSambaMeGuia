var quizModel = require("../models/quizModel");

function listarPerguntas(req, res) {

    quizModel.listarPerguntas()
        .then((resultado) => {

            res.status(200).json(resultado);

        }).catch((erro) => {

            console.log(erro);
            res.status(500).json(erro.sqlMessage);

        });
}


function salvarResposta(req, res) {

    var fkUsuario = req.body.fkUsuario;
    var fkPergunta = req.body.fkPergunta;
    var respostaEscolhida = req.body.respostaEscolhida;

    console.log("fkUsuario:", fkUsuario);
    console.log("fkPergunta:", fkPergunta);
    console.log("respostaEscolhida:", respostaEscolhida);

    quizModel.salvarResposta(
        fkUsuario,
        fkPergunta,
        respostaEscolhida
    )
        .then(() => {

            res.status(200).send("Resposta salva com sucesso!");

        }).catch((erro) => {

            console.log(erro);
            res.status(500).json(erro.sqlMessage);

        });
}

module.exports = {
    listarPerguntas,
    salvarResposta
};