local config = (
  function ()
    inputs =
      { 'hello.elm' }

    outputs =
      { '%B.js', '%B.module.js', '^elm-stuff' }

    command =
      [[ npx elm make %f --output=%B.js \
      && node wrap-elm.js %B.js
      ]]

    tup.rule(inputs, command, outputs)
  end
)()

