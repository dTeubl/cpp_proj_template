# Makefile for gtest examples

G++ = g++

# Variable for google test
GOOGLE_TEST_LIB = gtest
GOOGLE_TEST_INCLUDE = /usr/local/include

# Variables for Test
T_G++_FLAGS = -c -Wall -I $(GOOGLE_TEST_INCLUDE)
T_LD_FLAGS = -L /usr/local/lib -l $(GOOGLE_TEST_LIB) -l pthread
T_OBJECTS = test.o string-compare.o
TEST_P = string-compare

# Variables for target
G++_FLAGS = -c -Wall -std=c++20 -pedantic -Weffc++
OBJECTS = main.o
TARGET = proj


# Rules to make progam
all: $(TARGET)

$(TARGET): $(OBJECTS)
	$(G++) -o $(TARGET) $(OBJECTS) $(LD_FLAGS)

clean:
	rm -f $(TARGET) $(TEST) *.o

# Rules to make test
test: $(TEST_P)

$(TEST_P): $(T_OBJECTS)
	$(G++) -o $(TEST_P) $(T_OBJECTS) $(T_LD_FLAGS)

# Generate necessery object files
%.o : %.cpp
	$(G++) $(G++_FLAGS) $<

                    
.PHONY: all clean test
