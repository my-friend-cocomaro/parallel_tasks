number=$1 

makeFile__factory() {
    echo "coml:
	g++ -fopenmp -o task$number.out task$number.cpp

run:
	./task$number.out

rm:
	rm *.out"
}

run_shell__factory() {
    echo "make coml
make run > task$number.txt
make rm"
}

makeFile__factory > tasks/task$number/Makefile
run_shell__factory > tasks/task$number/task$number.sh