# jsoo_effects_bug_reproduction

## Env

- Node.js v20.10.0
- The OCaml toplevel, version 5.1.0
- Js_of_ocaml 5.7.1

## Test

```shell
$ dune runtest
File "test/dune", line 8, characters 0-105:
 8 | (rule
 9 |  (alias runtest)
10 |  (deps jsoo_effects_bug_reproduction.bc.js)
11 |  (action
12 |   (run %{bin:node} %{deps})))
[10:46:57.529] [SUCCESS] (1/3) plus - should return 2 by 1, 1
[10:46:57.529] [SUCCESS] (2/3) plus - should return 3 by 1, 2
/Users/wk/Projects/jsoo_effects_bug_reproduction/_build/default/test/jsoo_effects_bug_reproduction.bc.js:5810
     throw err;
     ^

TypeError: cont is not a function
    at Timeout._onTimeout (/Users/wk/Projects/jsoo_effects_bug_reproduction/_build/default/test/jsoo_effects_bug_reproduction.bc.js:43873:40)
    at listOnTimeout (node:internal/timers:573:17)
    at process.processTimers (node:internal/timers:514:7)

Node.js v20.10.0
```
