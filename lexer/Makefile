rebuild_flex:
	rm ./lex.yy.cpp ./compile.out
	make build_flex
	make compile_file
	make start_test

build_all:
	make build_flex
	make compile_file
	make start_test

build_flex:
	@flex --outfile=lex.yy.cpp lex.l

compile_file: 
	g++ lex.yy.cpp -o compile.out

start_test:
	./compile.out test.swift

clear_flex:
	rm ./lex.yy.cpp ./a.out