# Makefile for gtest examples

# General variables
CPP = g++
GPP_FLAGS = -c -Wall -std=c++20 -pedantic -Weffc++
SZ=size

# Variable for google test
GOOGLE_TEST_LIB = gtest
GOOGLE_TEST_INCLUDE = /usr/local/include

# Variables for Test
T_CPP_FLAGS = $(GPP_FLAGS)  -I $(GOOGLE_TEST_INCLUDE)
T_LD_FLAGS = -L /usr/local/lib -l $(GOOGLE_TEST_LIB) -l pthread
T_OBJECTS = test.o string-compare.o
TEST_P = testing

# Variables for target
OBJECTS = main.o
TARGET = proj
CPP_FLAGS = $(GPP_FLAGS)

# Rules to make progam
all: $(TARGET)

$(TARGET): $(OBJECTS)
	@echo "========== linking objects =========="
	@$(CPP) -o $(TARGET) $(OBJECTS) $(LD_FLAGS)
	@echo $(CPP): $@
	@$(SZ) -G $@


clean:
	@rm -f $(TARGET) $(TEST_P) *.o

# Rules to make test
# It will throw and error in case a test is failed, just ignore that
test: $(TEST_P)
	./$(TEST_P)

$(TEST_P): $(T_OBJECTS)
	@echo "========== linking objects =========="
	@$(CPP) -o $(TEST_P) $(T_OBJECTS) $(T_LD_FLAGS)
	@echo $(CPP): $@
	$(SZ) -G $@


# Generate necessery object files
%.o : %.cpp
	@echo $(CPP): $@
	@$(CPP) $(CPP_FLAGS) $<


                    
.PHONY: all clean test
