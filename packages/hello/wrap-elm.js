const fs = require("fs").promises
const args = process.argv.slice(2)
const fileName = args[0]

fs.readFile(fileName, { encoding: "utf8" })
  .then(elmCode => {
    const wrappedCode = wrapElmCode(elmCode)
    const modulePrefix = fileName.split('.js')[0]
    const moduleName = `${modulePrefix}.module.js`
    return fs.writeFile(moduleName, wrappedCode)
  }).catch(() => {
    console.log('Oops cannot wrap Elm code');
  })

function wrapElmCode (code) {
  return `
    function wrapper() {
      let output = {};
      (function () { ${code} }).call(output);
      return output.Elm;
    }
    export default wrapper;
  `;
}
