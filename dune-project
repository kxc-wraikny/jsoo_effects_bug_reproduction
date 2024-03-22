(lang dune 3.10)

(name jsoo_effects_bug_reproduction)

(generate_opam_files true)

(source
 (github username/reponame))

(authors "Author Name")

(maintainers "Maintainer Name")

(license LICENSE)

(documentation https://url/to/documentation)

(package
 (name jsoo_effects_bug_reproduction)
 (allow_empty)

 (synopsis "A short synopsis")
 (description "A longer description")

 (depends ocaml dune
  (js_of_ocaml (= 5.7.1))
  js_of_ocaml-ppx
  js_of_ocaml-lwt
  (tezt (>= 3.0.0))
  (ocaml (= 5.1.0))
  )
 (tags
  (topics "to describe" your project)))

; See the complete stanza docs at https://dune.readthedocs.io/en/stable/dune-files.html#dune-project
