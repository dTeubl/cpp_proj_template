#ifndef  _MY_CLASS_H_
#define  _MY_CLASS_H_

class MyClass {
    public:
    unsigned int value;
    MyClass( ) : value{0} {}
    MyClass( unsigned int val ) : value{val} {}
    unsigned int getValue();
};

#endif /*  _MY_CLASS_H_ */
