async function handler(event, context) {
  console.log('Ambiente...', JSON.stringify(process.env, null, 2));
  console.log('Evento...', JSON.stringify(wvent, null, 2));

  return {
    hello: 'World'
  }
}

module.exports = {
  handler
}