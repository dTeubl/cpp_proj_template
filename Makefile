# Makefile for gtest examples

# General variables
CPP = g++
GPP_FLAGS = -c -Wall -std=c++20 -pedantic -Weffc++
SZ=size
BUILD_DIR = ./build
T_SOURCES_DIR = ./test
SOURCES_DIR = ./src
INCLUDES = ./inc

# Variable for google test
GOOGLE_TEST_LIB = gtest
GOOGLE_TEST_INCLUDE = /usr/local/include

# Variables for Test
T_CPP_FLAGS = $(GPP_FLAGS)  -I $(GOOGLE_TEST_INCLUDE) -I$(INCLUDES)
T_LD_FLAGS = -L /usr/local/lib -l $(GOOGLE_TEST_LIB) -l pthread -l gmock
TEST_PROG = testing
TEST_P = $(BUILD_DIR)/$(TEST_PROG)
T_SOURCES = $(wildcard $(T_SOURCES_DIR)/*cpp)

T_OBJECTS = $(addprefix $(BUILD_DIR)/,$(notdir $(T_SOURCES:.cpp=.o)))
vpath %.cpp $(sort $(dir $(T_SOURCES)))

# Variables for target
OBJECTS = main.o
PROG = proj
TARGET = $(BUILD_DIR)/$(PROG)
CPP_FLAGS = $(GPP_FLAGS) -I $(INCLUDES)
SOURCES = $(wildcard $(SOURCES_DIR)/*cpp)
SOURCES += ./main.cpp 

OBJECTS = $(addprefix $(BUILD_DIR)/,$(notdir $(SOURCES:.cpp=.o)))
vpath %.cpp $(sort $(dir $(SOURCES)))

testFilter = "*"

gTestFilter = --gtest_filter=$(testFilter)

# Rules 
all: $(TARGET)

$(TARGET): $(BUILD_DIR) $(OBJECTS) Makefile
	@echo "========== linking objects =========="
	@$(CPP) -o $(TARGET) $(OBJECTS)
	@echo $(CPP): $@
	@$(SZ) -G $@
	@mv $(TARGET) ./$(PROG)


clean:
	@rm -f $(PROG) $(BUILD_DIR)/*

# Rules to make test
# It will throw and error in case a test is failed, just ignore that
test: $(TEST_P)
	./$(TEST_P) $(gTestFilter)

$(TEST_P): $(BUILD_DIR) $(T_OBJECTS)
	@echo "========== linking objects =========="
	@$(CPP) -o $(TEST_P) $(T_OBJECTS) $(T_LD_FLAGS)
	@echo $(CPP): $@
	$(SZ) -G $@


# Generate necessery object files
$(BUILD_DIR)/%.o : %.cpp Makefile | $(BUILD_DIR)
	@echo $(CPP): $@
	@$(CPP) $(CPP_FLAGS) $< -o $@

# Generate build directory in case it does not exists
$(BUILD_DIR):
	@mkdir $@

# collect rules                    
.PHONY: all clean test info

# Just for debug. Place missing variables for echo here if somethings wrong

info:
	@echo $(SOURCES)
	@echo $(OBJECTS)
	@echo $(T_SOURCES)
	@echo $(T_OBJECTS)


