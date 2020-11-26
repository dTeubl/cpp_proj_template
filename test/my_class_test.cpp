#include <gtest/gtest.h> // googletest header file

#include "my_class.h"

class TestMyClass : public testing::Test  {
    protected:
    MyClass *obj;

    virtual void SetUp()
    {
        obj = new MyClass();
    }

    virtual void TearDown()
    {
        delete obj;
    }

};


TEST_F(TestMyClass, Constructor)
{
        EXPECT_TRUE(obj);
}




