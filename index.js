const Koa = require('koa');
const Router = require('koa-router');

const app = new Koa();
const router = new Router();

router.get('/api', (ctx) => {
  ctx.type = 'json';
  ctx.body = {
    greetings: ['yo', 'howdy', 'sup']
  };
});

app.use(router.routes()).use(router.allowedMethods());

if (!module.parent) {
  const port = process.env.PORT || 5000;
  app.listen(port, () => console.log(`Server listening on port ${port}...`));
}
