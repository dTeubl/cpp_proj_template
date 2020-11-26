#ifndef  _MY_CLASS_H_
#define  _MY_CLASS_H_

class MyClass {
    public:
    unsigned int value;
    MyClass( unsigned int val ) : value{val} {}
    auto getValue();
};

#endif /*  _MY_CLASS_H_ */
