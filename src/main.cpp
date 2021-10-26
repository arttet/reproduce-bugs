#include <fmt/color.h>
#include <fmt/format.h>

#include <gsl/span>

#include <cstdlib>

int main(int argc, char ** argv)
{
    auto const args = gsl::span(argv, size_t(argc));
    fmt::print(u8"Hello, 世界: args = {}", fmt::join(args, ", "));

    fmt::print(fg(fmt::color::crimson) | fmt::emphasis::bold, "Hello, {}!\n", "world");
    fmt::print(
        fg(fmt::color::floral_white) | bg(fmt::color::slate_gray) | fmt::emphasis::underline, "Hello, {}!\n", "мир");
    fmt::print(fg(fmt::color::steel_blue) | fmt::emphasis::italic, "Hello, {}!\n", "世界");

    return EXIT_SUCCESS;
}
