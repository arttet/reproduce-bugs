#include <fmt/color.h>
#include <fmt/format.h>

#include <cstdlib>

int main(int /*argc*/, char ** /*argv*/)
{
    fmt::print(fg(fmt::color::crimson) | fmt::emphasis::bold, "Hello, {}!\n", "world");

    return EXIT_SUCCESS;
}
