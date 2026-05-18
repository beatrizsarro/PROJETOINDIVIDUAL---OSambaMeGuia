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
    let fkInstrumento = null;
    if (fkPergunta == 4 && respostaEscolhida == "C") {
        fkInstrumento = 1; 
    }
    if (fkPergunta == 4 && respostaEscolhida == "B") {
        fkInstrumento = 3; 
    }
    if (fkPergunta == 4 && respostaEscolhida == "A") {
        fkInstrumento = 2; 
    }


        
    quizModel.salvarResposta(
        fkUsuario,
        fkPergunta,
        respostaEscolhida, 
        fkInstrumento
    )
        .then(() => {
            res.status(200).send("Resposta salva com sucesso!");

        }).catch((erro) => {

            console.log(erro);
            res.status(500).json(erro.sqlMessage);

        });

    console.log("fkUsuario:", fkUsuario);
    console.log("fkPergunta:", fkPergunta);
    console.log("respostaEscolhida:", respostaEscolhida);
    console.log("fkInstrumento", fkInstrumento)
}


module.exports = {
    listarPerguntas,
    salvarResposta
};