test: leftist.cmo tests.cmo
	ocamlc -o test leftist.cmo tests.cmo

tests.cmo: tests.ml
	ocamlc -c tests.ml

leftist.cmo: leftist.ml leftist.cmi
	ocamlc -c leftist.ml

leftist.cmi: leftist.mli
	ocamlc -c leftist.mli

clean:
	rm -f *.cmi *.cmo ./test
