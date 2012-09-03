var connect = require('connect');

var app = connect()
  .use(connect.cache())
  .use(foo)
  .listen(8340);

function foo(req, res) {
  res.writeHead(200, {'Content-Type': 'text/plain'});
  res.end(new Date().toString());
}

console.log('Server running at http://localhost:8340/');
