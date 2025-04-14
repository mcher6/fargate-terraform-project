const express = require('express');
const app = express();
const PORT = 80;

app.get('/', (req, res) => {
  console.log('Health check hit');
  res.status(200).send('OK');
});

app.listen(80, '0.0.0.0', () => {
  console.log("Server running on port 80");
});

// Demo deploy
