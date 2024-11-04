var express = require('express');
var router = express.Router();

router.get('/api', function (req, res, next) {
  res.json({ result: true, message: 'API ready' });
});

module.exports = router;
