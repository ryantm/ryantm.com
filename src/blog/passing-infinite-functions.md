# Passing infinite functions {#passing-infinite-functions}

2007-04-24

Can you write the following code in your language without it hanging?

```
some_function(5, infinite_loop())
```

You can in Haskell because it is lazy. Which means that it doesn't evaluate things unless it must evaluate them. If some_function only used 5 then infinite_loop would never even get called.
