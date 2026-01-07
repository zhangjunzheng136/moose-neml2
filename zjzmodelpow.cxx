#include "zjzmodelpow.h"
#include <neml2/base/Registry.h>
#include "neml2/tensors/Scalar.h"
#include "neml2/tensors/functions/abs.h"
#include "neml2/tensors/functions/pow.h"
#include "neml2/tensors/functions/sign.h"
#include "neml2/tensors/functions/log.h"

namespace neml2
{
register_NEML2_object(zjzmodelpow);

OptionSet
zjzmodelpow::expected_options()
{
  OptionSet options = Model::expected_options();

  options.set_input("A");
  options.set("A").doc() = "input scalar A";

  options.set_output("F");
  options.set("F").doc() = "output scalar F=h*sign(A)*abs(A)^l";

  options.set_parameter<TensorName<Scalar>>("h");
  options.set("h").doc() = "h";

  options.set_parameter<TensorName<Scalar>>("l");
  options.set("l").doc() = "l";


  options.doc() = "F=h*sign(A)*abs(A)^l,h and l are parameters, A is input scalar";

  options.set<bool>("define_second_derivatives") = true;


  return options;
}

zjzmodelpow::zjzmodelpow(const OptionSet & options)
  : Model(options),
    
    _A(declare_input_variable<Scalar>("A")),
    _F(declare_output_variable<Scalar>("F")),
    _h(declare_parameter<Scalar>("h", "h", /*allow_nonlinear=*/true)),
    _l(declare_parameter<Scalar>("l", "l", /*allow_nonlinear=*/true))
{
}

void
zjzmodelpow::set_value(bool out, bool dout_din, bool d2out_din2)
{
  auto A_abs = abs(_A);
  auto A_sign = sign(_A);
  auto A_pow = pow(A_abs, _l);
  auto F = _h * A_sign * A_pow;

  if (out)
      _F = F;

    if (!_F.is_dependent())
      return;

  if (dout_din)
  {
    if (_A.is_dependent())
    {
      auto dF_dA = _h * _l * pow(pow(_A,2.0),_l/2.0-0.5);//safe when l>1
      _F.d(_A) = dF_dA;//simplified for l>0
    }

    if (const auto * const h = nl_param("h"))
      _F.d(*h) = A_pow * A_sign;

    if (const auto * const l = nl_param("l"))
      _F.d(*l) = F*log(A_abs);//A=0?
  }
  if (d2out_din2)
    if (_A.is_dependent())
      _F.d(_A, _A) = _h*_l*_A *pow(pow(_A,2.0)+1e-20,_l/2.0-1.5)*(_l-1.0);//some repeated calculations, to be simplified. add 1e-20 to avoid pow(0, negative)
}
} // namespace neml2
