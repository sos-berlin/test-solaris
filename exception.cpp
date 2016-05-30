#include <string>
#include <cstdio>
#include <iostream>

using namespace std;

struct Exception : exception {
    Exception(const string& message) : message(message) {}
    virtual ~Exception() throw() {}

    string const message;
};

void throwException(const char* message) {
    cout << "throw new Exception(message);" << endl;
    throw Exception(message);
}

extern "C" void testException(const char* message) {
    try {
        throwException(message);
    } catch (const Exception& e) {
        cout << "Exception catched: " << e.message << endl;
    }
    cout << "Continuing ..." << endl;
}
