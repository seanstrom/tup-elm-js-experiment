local config = (
  function ()
    inputs =
      { 'index.html', pkgs('hello/hello.module.js') }

    outputs =
      { '^dist', '^.cache' }

    command =
      [[ npx parcel build index.html ]]

    tup.rule(inputs, command, outputs)
  end
)()
