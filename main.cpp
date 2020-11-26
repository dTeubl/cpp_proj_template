#include <iostream>

#include "my_class.h"

int main(int argc, char **argv) {
    std::cout << "Hello from Main!" << std::endl;
    MyClass test_class{2};
    std::cout << "new value: " << test_class.getValue() << std::endl;
    return 0;
}

