var express = require("express");
var router = express.Router();

var quizController = require("../controllers/quizController");

router.get("/listar", function (req, res) {
    quizController.listarPerguntas(req, res);
});

router.post("/responder", function (req, res) {
    quizController.salvarResposta(req, res);
});

module.exports = router;