var express = require("express");
var router = express.Router();

var dashboardController = 
require("../controllers/dahboardController");

router.get("/:idUsuario", function (req, res) {
  dashboardController.buscarDadosGrafico(req, res);
});

module.exports = router;