#include "my_class.h"
#include <gmock/gmock.h>

#include <gtest/gtest.h> // googletest header file

class TestMyClass : public testing::Test {
  protected:
    MyClass *obj;

    virtual void SetUp() { obj = new MyClass(); }

    virtual void TearDown() { delete obj; }
};

TEST_F(TestMyClass, Constructor) { EXPECT_TRUE(obj); }

bool areEqual(double l, double r) {
    return std::abs(r - l) < std::numeric_limits<double>::epsilon();
}

TEST(AreEqual, DoublesOnly) {
    EXPECT_TRUE(areEqual(3.0, 3U));
    EXPECT_FALSE(areEqual(-3.0, 3U));
    EXPECT_FALSE(areEqual(3.0, 3.1));
    EXPECT_FALSE(areEqual(-3.0, 3.1));
    EXPECT_TRUE(areEqual(3U, 3U));
    EXPECT_FALSE(areEqual(-3, 3U));
}

// independent sample here
//
//
class Turtle {
  public:
    virtual ~Turtle() {}
    virtual void PenUp() = 0;
    virtual void PenDown() = 0;
    virtual void Forward(int distance) = 0;
    virtual void Turn(int degrees) = 0;
    virtual void GoTo(int x, int y) = 0;
    virtual int GetX() const = 0;
    virtual int GetY() const = 0;
};

class MockTurtle : public Turtle {
  public:
    MOCK_METHOD(void, PenUp, (), (override));
    MOCK_METHOD(void, PenDown, (), (override));
    MOCK_METHOD(void, Forward, (int distance), (override));
    MOCK_METHOD(void, Turn, (int degrees), (override));
    MOCK_METHOD(void, GoTo, (int x, int y), (override));
    MOCK_METHOD(int, GetX, (), (const, override));
    MOCK_METHOD(int, GetY, (), (const, override));
};

class Painter {

    Turtle *t{};

  public:
    explicit Painter(Turtle *tt) : t{tt} {};

    bool DrawCircle(int a, int b, int c) {
        t->PenDown();
        return true;
    };
};

using ::testing::AtLeast; // #1

TEST(PainterTest, CanDrawSomething) {
    MockTurtle turt;             // #2
    EXPECT_CALL(turt, PenDown()) // #3
        .Times(AtLeast(1));

    Painter painter(&turt); // #4

    EXPECT_TRUE(painter.DrawCircle(0, 0, 10)); // #5
}

