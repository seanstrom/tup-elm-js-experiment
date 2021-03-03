function main ()
  inputs =
    { 'index.html', '../hello/hello.module.js' }

  outputs =
    { '^dist', '^.cache' }

  command =
    [[ npx parcel build index.html ]]

  tup.rule(inputs, command, outputs)
end

main()
