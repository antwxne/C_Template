#include <criterion/criterion.h>
#include <criterion/parameterized.h>

TestSuite(basic_parameterized, .disabled = false);

struct my_params
{
    int param0;
    int param1;
};

ParameterizedTestParameters(basic_parameterized, min)
{
    static struct my_params params[] = {
        {1, 2}, {2, 4}};

    size_t nb_params = sizeof(params) / sizeof(struct my_params);
    return cr_make_param_array(struct my_params, params, nb_params);
}

ParameterizedTest(struct my_params *param, basic_parameterized, min)
{
    cr_expect(param->param0 < param->param1);
}