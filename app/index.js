const http = require('http');

const server = http.createServer((req, res) => {
  res.end('🚀 Hello from ECS Fargate + CodeBuild + Terraform!');
});

server.listen(80, () => {
  console.log('Server running on port 80');
});

