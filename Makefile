## Makefile for project 1b
## Hongfei Yang 
## September 2018

CC = mpicc
CFLAGS = -Wall -std=gnu99 -fopenmp -lm -O3
EXE = mandelbrot
OBJ = mandelbrot.o
CORES = 4

## sample input for test
SAMPLE = -2.0 1.0 -1.0 1.0 100 10000 -1.0 1.0 0.0 1.0 100 10000 -3.0 3.0 -3.0 3.0 1000 10000 
SAMPLE4 = -10.0 10.0 -10.0 10.0 10000 10000

$(EXE): $(OBJ)
	$(CC) $(CFLAGS) -o $(EXE) $(OBJ)


## test
test: $(EXE)
	./$(EXE) $(SAMPLE4)

## MPI by core test
mpi-test:
	mpirun -n $(CORES) ./$(EXE) $(SAMPLE)


clean:
	rm -f $(OBJ) $(EXE)