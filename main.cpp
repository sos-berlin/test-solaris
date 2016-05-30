#include <string>
#include <cstdio>
#include <iostream>

using namespace std;

extern "C" void testException(const char*);

extern "C" int main(int argc, char** argv) {
    if (argc != 2) {
        cout << "One argument only, please" << endl;
        return 1;
    }
    testException(argv[1]);
    cout << "Exit."  << endl;
}
