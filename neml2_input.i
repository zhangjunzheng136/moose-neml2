[Settings]
  additional_libraries = '/home/zjz/projects/neml2-custom-lib-template/build/libmylib.so'
[]

[Tensors]
  [TE_controls]
    type = Scalar
    values = '270.0 293.15 373.15 423.15 473.15 523.15 573.15 623.15 673.15 723.15 773.15 823.15 873.15 923.15 950.15'
    batch_shape = '(15)'
  []
  [E_values]
    type = Scalar
    values = '214446.875 213000.0 208000.0 205000.0 201000.0 198000.0 195000.0 191000.0 187000.0 183000.0 179000.0 174000.0 168000.0 161000.0 157220.0'
    batch_shape = '(15)'
  []
  [mu_values]
    type = Scalar
    values='67344.2847031322 66889.9122067739 65319.7264742181  64377.6150346830  63121.4664486416  62179.3550091146  61237.2435695795  59981.0949835381  58724.9463974967  57468.7978114553  56212.6492254057  54642.4634928580  52758.2406137878  50559.9805882194 49372.92017441246'
    batch_shape = '(15)'
  []
  [mu1_values]
    type = Scalar
    values = '82479.5673076923 81923.07692308 80000.0 78846.15384615 77307.69230769 76153.84615385 75000.0 73461.53846154 71923.07692308 70384.61538462 68846.15384615 66923.07692308 64615.38461538 61923.07692308 60469.23076923800'
    batch_shape = '(15)'
  []
  [mu2_values]
    type = Scalar
    values = '54986.37821 54615.38462 53333.33333 52564.10256 51538.46154 50769.23077 50000 48974.35897 47948.71795 46923.07692 45897.4359  44615.38462 43076.92308 41282.05128 40312.82050800000'
    batch_shape = '(15)'
  []
  [T_controls]
    type = Scalar
    values = '270.0 298.15 673.15 773.15 823.15 873.15 923.15 950.15'
    batch_shape = '(8)'
  []
  [l_values]
    type = Scalar
    values = '1.91 1.91 1.91 1.71 1.69 1.61 1.51 1.456'
    batch_shape = '(8)'
  []
  [Q_values]
    type = Scalar
    values='-78.38367177 -78.38367177 -78.38367177 -122.47448714 -123.29098372 -123.29098372 -106.9610521 -98.142889025200000'
    batch_shape = '(8)'
  []
  [delta_values]
    type = Scalar
    values='1.65076774635067 1.63299316 1.39620915 1.39620915 1.23290984 1.23290984 0.81649658 0.591633419600000'
    batch_shape = '(8)'
  []
  [C1_values]
    type = Scalar
    values = '14462.4666666667 14500.0 15000.0 19000.0 19200.0 19900.0 19000.0 18514.0'
    batch_shape = '(8)'
  []
  [C2_values]
    type = Scalar
    values = '12500.0 12500.0 12500.0 12500.0 12600.0 12400.0 12400.0 12400.0'
    batch_shape = '(8)'
  []
  [gamma1_values]
    type = Scalar
    values='94.0 94.0 94.0 534.66666667 528.0 535.33333333 535.33333333 535.33333333'
    batch_shape = '(8)'
  []
  [gamma2_values]
    type = Scalar
    values='40.4100088886387 40.4 40.26666667 133.33333333 133.33333333 134.66666667 134.66666667 134.66666667'
    batch_shape = '(8)'
  []
  [a1_values]
    type = Scalar
    values = '3.5 3.5 3.5 5.97 5.97 7.47 9.46 10.534600000000001'
    batch_shape = '(8)'
  []
  [a2_values]
    type = Scalar
    values = '3.5 3.5 3.5 5.96 5.96 7.51 9.53 10.6208'
    batch_shape = '(8)'
  []
[]

[Solvers]
  [newton]
    type = Newton
    verbose=true
  []
[]

[Models]
  [interpolated_E]
    type = ScalarLinearInterpolation
    argument = 'forces/T'
    abscissa = 'TE_controls'
    ordinate = 'E_values'
    output='interpolated_E'
  []
  [interpolated_l]
    type = ScalarLinearInterpolation
    argument = 'forces/T'
    abscissa = 'T_controls'
    ordinate = 'l_values'
    output='interpolated_l'
  []
  [interpolated_Q]
    type = ScalarLinearInterpolation
    argument = 'forces/T'
    abscissa = 'T_controls'
    ordinate = 'Q_values'
    output='interpolated_Q'
  []
  [interpolated_delta]
    type = ScalarLinearInterpolation
    argument = 'forces/T'
    abscissa = 'T_controls'
    ordinate = 'delta_values'
    output='interpolated_delta'
  []
  [interpolated_C1]
    type = ScalarLinearInterpolation
    argument = 'forces/T'
    abscissa = 'T_controls'
    ordinate = 'C1_values'
    output='interpolated_C1'
  []
  [interpolated_C2]
    type = ScalarLinearInterpolation
    argument = 'forces/T'
    abscissa = 'T_controls'
    ordinate = 'C2_values'
    output='interpolated_C2'
  []
  [interpolated_gamma1]
    type = ScalarLinearInterpolation
    argument = 'forces/T'
    abscissa = 'T_controls'
    ordinate = 'gamma1_values'
    output='interpolated_gamma1'
  []
  [interpolated_gamma2]
    type = ScalarLinearInterpolation
    argument = 'forces/T'
    abscissa = 'T_controls'
    ordinate = 'gamma2_values'
    output='interpolated_gamma2'
  []
  [interpolated_a1]
    type = ScalarLinearInterpolation
    argument = 'forces/T'
    abscissa = 'T_controls'
    ordinate = 'a1_values'
    output='interpolated_a1'
  []
  [interpolated_a2]
    type = ScalarLinearInterpolation
    argument = 'forces/T'
    abscissa = 'T_controls'
    ordinate = 'a2_values'
    output='interpolated_a2'
  []
  [isoharden]
    type = VoceIsotropicHardening
    equivalent_plastic_strain = 'state/internal/ep'
    isotropic_hardening = 'state/internal/k'
    saturated_hardening='interpolated_Q'
    saturation_rate='interpolated_delta'
  []
  [kinharden]
    type = SR2LinearCombination
    from_var = 'state/internal/X1 state/internal/X2'
    to_var = 'state/internal/X'
  []
  [mandel_stress]
    type = IsotropicMandelStress
    cauchy_stress = 'state/S'
    mandel_stress = 'state/internal/M'
  []
  [overstress]
    type = SR2LinearCombination
    to_var = 'state/internal/O'
    from_var = 'state/internal/M state/internal/X'
    coefficients = '1 -1'
  []
  [trace]
    type = SR2Invariant
    invariant_type = 'I1'
    tensor = 'state/internal/M'
    invariant = 'state/internal/Mtrace'
  []
  [vonmises]
    type = SR2Invariant
    invariant_type=VONMISES
    tensor = 'state/internal/O'
    invariant = 'state/internal/s1'
  []
  [hsignxx]
    type=zjzmodelpow
    A='state/internal/Mtrace'
    F='state/internal/s2'
    h=0.0002
    l='interpolated_l'
  []
  [slast]
    type = ScalarLinearCombination
    to_var = 'state/internal/s'
    from_var = 'state/internal/s1 state/internal/s2'
    coefficients = '0.816496580927726 1'
  []
  [mu]
    type = ScalarLinearInterpolation
    argument = 'forces/T'
    abscissa = 'TE_controls'
    ordinate = 'mu_values'
  []
  [mu1]
    type = ScalarLinearInterpolation
    argument = 'forces/T'
    abscissa = 'TE_controls'
    ordinate = 'mu1_values'
  []
  [mu2]
    type = ScalarLinearInterpolation
    argument = 'forces/T'
    abscissa = 'TE_controls'
    ordinate = 'mu2_values'
  []
  [ys]
    type = KocksMeckingYieldStress
    shear_modulus = 'mu'
    C = -5.119
  []
  [yield]
    type = YieldFunction
    yield_stress='ys'
    isotropic_hardening = 'state/internal/k'
    effective_stress='state/internal/s'
    yield_function='state/internal/fp'
  []
  [yield_zero]
    type = YieldFunction
    yield_stress = 0
    isotropic_hardening = 'state/internal/k'
    effective_stress='state/internal/s'
    yield_function = 'state/internal/fp_alt'
  []
  [flow]
    type = ComposedModel
    models = 'overstress trace vonmises hsignxx slast yield'
    automatic_nonlinear_parameter = false
  []
  [normality]
    type = Normality
    model = 'flow'
    function = 'state/internal/fp'
    from = 'state/internal/M state/internal/k'
    to = 'state/internal/NM state/internal/Nk'
  []
  [flow_rate]
    type = RateIndependentPlasticFlowConstraint
    flow_rate='state/internal/gamma_rate_ri'
    yield_function='state/internal/fp'
  []
  [km_sensitivity]
    type = KocksMeckingRateSensitivity
    A = -9.698
    shear_modulus = 'mu1'
    k = 1.38068E-29
    b = 2.48e-10
    temperature='forces/T'
  []
  [km_viscosity]
    type = KocksMeckingFlowViscosity
    A=-6.465333333
    B = -1.7286
    shear_modulus = 'mu2'
    k = 1.38068E-29
    b = 2.48e-10
    eps0= 1.5e10
    temperature='forces/T'
  []
  [rd_flowrate]
    type = PerzynaPlasticFlowRate
    reference_stress = 'km_viscosity'
    exponent = 'km_sensitivity'
    yield_function = 'state/internal/fp_alt'
    flow_rate = 'state/internal/gamma_rate_rd'
  []
  [effective_strain_rate]
    type = SR2Invariant
    invariant_type = 'EFFECTIVE_STRAIN'
    tensor = 'state/E_rate'
    invariant = 'forces/effective_strain_rate'
  []
  [g]
    type = KocksMeckingActivationEnergy
    activation_energy = 'state/g'
    shear_modulus = 'mu1'
    k = 1.38068E-29
    b = 2.48e-10
    eps0 = 1.0e10
    strain_rate='forces/effective_strain_rate'
    temperature='forces/T'
  []
  [flowrate]
    type = KocksMeckingFlowSwitch
    activation_energy = 'state/g'
    flow_rate='state/internal/gamma_rate'
    g0 = 0.3496
    rate_independent_flow_rate = 'state/internal/gamma_rate_ri'
    rate_dependent_flow_rate = 'state/internal/gamma_rate_rd'
    sharpness = 100.0
  []
  [eprate]
    type = AssociativeIsotropicPlasticHardening
    equivalent_plastic_strain_rate='state/internal/ep_rate'
    flow_rate='state/internal/gamma_rate'
    isotropic_hardening_direction='state/internal/Nk'
  []
  [X1rate]
    type = ChabochePlasticHardening
    back_stress = 'state/internal/X1'
    back_stress_rate = 'state/internal/X1_rate'
    C = 'interpolated_C1'
    g='interpolated_gamma1'
    A = 1.224744871391589e-15 
    a = 'interpolated_a1'
    flow_direction='state/internal/NM'
    flow_rate='state/internal/gamma_rate'
  []
  [X2rate]
    type = ChabochePlasticHardening
    back_stress = 'state/internal/X2'
    back_stress_rate = 'state/internal/X2_rate'
    C = 'interpolated_C2'
    g='interpolated_gamma2'
    A = 1.224744871391589e-15 
    a = 'interpolated_a2'
    flow_direction='state/internal/NM'
    flow_rate='state/internal/gamma_rate'
  []
  [Eprate]
    type = AssociativePlasticFlow
    flow_direction='state/internal/NM'
    flow_rate='state/internal/gamma_rate'
    plastic_strain_rate='state/internal/Ep_rate'
  []
  [Erate]
    type = SR2VariableRate
    variable = 'forces/E'
    rate = 'state/E_rate'
    time='forces/t'
  []
  [Eerate]
    type = SR2LinearCombination
    from_var = 'state/E_rate state/internal/Ep_rate'
    to_var = 'state/internal/Ee_rate'
    coefficients = '1 -1'
  []
  [elasticity]
    type = LinearIsotropicElasticity
    coefficients = 'interpolated_E 0.3'
    coefficient_types = 'YOUNGS_MODULUS POISSONS_RATIO'
    rate_form = true
    strain='state/internal/Ee'
    stress='state/S'
  []
  [integrate_ep]
    type = ScalarBackwardEulerTimeIntegration
    variable = 'state/internal/ep'
    time='forces/t'
    rate='state/internal/ep_rate'
  []
  [integrate_X1]
    type = SR2BackwardEulerTimeIntegration
    variable = 'state/internal/X1'
    time='forces/t'
    rate='state/internal/X1_rate'
  []
  [integrate_X2]
    type = SR2BackwardEulerTimeIntegration
    variable = 'state/internal/X2'
    time='forces/t'
    rate='state/internal/X2_rate'
  []
  [integrate_stress]
    type=SR2BackwardEulerTimeIntegration
    variable='state/S'
    time='forces/t'
    rate='state/S_rate'
  []
  [implicit_rate]
    type = ComposedModel
    models = 'isoharden kinharden mandel_stress overstress trace vonmises hsignxx slast yield yield_zero normality flow_rate rd_flowrate flowrate g effective_strain_rate eprate Eprate X1rate X2rate Erate Eerate elasticity integrate_stress integrate_ep integrate_X1 integrate_X2'
  []
  [model]
    type = ImplicitUpdate
    implicit_model = 'implicit_rate'
    solver = 'newton'
  []
[]
