const express = require('express');
const cors = require('cors');

const app = express();
app.use(cors());
app.use(express.json());

// health-check route
app.get('/health', function(req, res) {
  return res.status(200).json({ status: 'ok' });
});

app.get('/ajs', (req, res) => {
  res.status(200).json({
    you: 'the man'
  })
})

app.use('*', (req, res) => {
  res.status(200).json({
    path: req.originalUrl,
    method: req.method,
  });
});


module.exports = app;
