#include <absl/strings/str_join.h>

int main(int /*argc*/, char ** /*argv*/)
{
    std::vector<std::string> const v = {"foo", "bar", "baz"};
    std::string const s = absl::StrJoin(v, "-");
    (void)s;

    return EXIT_SUCCESS;
}
