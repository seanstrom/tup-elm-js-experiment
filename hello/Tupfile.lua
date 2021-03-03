local config = (
  function ()
    inputs =
      { 'hello.elm' }

    outputs =
      { 'hello.js', 'hello.module.js', '^elm-stuff' }

    command =
      [[ npx elm make hello.elm --output=hello.js \
      && node wrap-elm.js hello.js
      ]]

    tup.rule(inputs, command, outputs)
  end
)()

