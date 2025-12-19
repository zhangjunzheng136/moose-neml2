#pragma once
#include "neml2/models/Model.h"

namespace neml2
{
class Scalar;


class zjzmodelpow : public Model
{
public:
  static OptionSet expected_options();
  zjzmodelpow(const OptionSet & options);

protected:
  void set_value(bool out, bool dout_din, bool d2out_din2) override;


  const Scalar & _h;
  const Scalar & _l;
  // input:A
  const Variable<Scalar> & _A;
  // output:F
  Variable<Scalar> & _F;

};
} // namespace neml2
