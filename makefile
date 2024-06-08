CXX = g++
CXXFLAGS = -Wall -O3
OBJ_DIR  := obj
TARGET = run
INCLUDE = -Ipugixml
LDFLAGS = -lm 

SRC     := $(wildcard pugixml/*.cpp) $(wildcard src/*.cpp) 
OBJECTS := $(SRC:%.cpp=$(OBJ_DIR)/%.o)

all: ./$(TARGET)

$(OBJ_DIR)/%.o: %.cpp
	@mkdir -p $(@D)
	$(CXX) $(CXXFLAGS) $(INCLUDE) -o $@ -c $<


./$(TARGET): $(OBJECTS)
	@mkdir -p $(@D)
	$(CXX) $(CXXFLAGS) $(INCLUDE) $(LDFLAGS) -o ./$(TARGET) $(OBJECTS)

.PHONY: clean  all


clean:
	-@rm -rvf $(OBJ_DIR)
	-@rm -f ./$(TARGET)