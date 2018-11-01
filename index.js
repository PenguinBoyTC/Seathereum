const Koa = require('koa');
const serve = require('koa-static');
const path = require('path');

const app = new Koa();

if (process.env.NODE_ENV === 'production') {
  app.use(serve(path.resolve(__dirname, 'client', 'build')));
}

if (!module.parent) {
  const port = process.env.PORT || 5000;
  app.listen(port, () => console.log(`Server listening on port ${port}...`));
}

module.exports = app;
