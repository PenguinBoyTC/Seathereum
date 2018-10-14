const Koa = require('koa');
const Router = require('koa-router');
const serve = require('koa-static');
const path = require('path');

const app = new Koa();
const router = new Router();

router.get('*', (ctx) => {
  ctx.type = 'json';
  ctx.body = {
    greetings: ['yo', 'howdy', 'sup']
  };
});

if (process.env.NODE_ENV === 'production') {
  app.use(serve(path.resolve(__dirname, 'client', 'build', 'index.html')));
}

app.use(router.routes()).use(router.allowedMethods());

if (!module.parent) {
  const port = process.env.PORT || 5000;
  app.listen(port, () => console.log(`Server listening on port ${port}...`));
}