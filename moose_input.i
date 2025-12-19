[GlobalParams]
  displacements = 'disp_x disp_y disp_z'
[]

[Mesh]
  [gmg]
    type = GeneratedMeshGenerator
    dim = 3
    xmax=1
    ymax=0.1
    zmax=0.1
    nx = 20
    ny = 4
    nz = 4
  []
  second_order = true
[]


[AuxVariables]
  [T]
  []
[]

[AuxKernels]
  [T_function]
    type = FunctionAux
    variable = T
    function = temperature_load
    execute_on = 'INITIAL TIMESTEP_BEGIN'
  []
[]

[Physics]
  [SolidMechanics]
    [QuasiStatic]
      [all]
        strain = SMALL
	      incremental = true
        new_system = true
        add_variables = true
        eigenstrain_names = thermal_expansion
        formulation = TOTAL
        #volumetric_locking_correction = true
        
      []
    []
  []
[]

[NEML2]
  input = 'last.i'
  async_dispatch = true
  #scheduler = 'simple_scheduler'
  device = 'cpu'
  [all]
    model = 'model'
    verbose = true

    moose_input_types = 'VARIABLE MATERIAL     MATERIAL     POSTPROCESSOR POSTPROCESSOR MATERIAL     MATERIAL                  MATERIAL              MATERIAL'
    moose_inputs = '     T        neml2_strain neml2_strain time          time          neml2_stress equivalent_plastic_strain back_stress_1         back_stress_2'
    neml2_inputs = '     forces/T forces/E     old_forces/E forces/t      old_forces/t  old_state/S  old_state/internal/ep     old_state/internal/X1 old_state/internal/X2'

    moose_output_types = 'MATERIAL     MATERIAL                  MATERIAL          MATERIAL'
    moose_outputs = '     neml2_stress equivalent_plastic_strain back_stress_1     back_stress_2'
    neml2_outputs = '     state/S      state/internal/ep         state/internal/X1 state/internal/X2'

    moose_derivative_types = 'MATERIAL'
    moose_derivatives = 'neml2_jacobian'
    neml2_derivatives = 'state/S forces/E'
  []
[]



[Postprocessors]
  [time]
    type = TimePostprocessor
    execute_on = 'INITIAL TIMESTEP_BEGIN'
    outputs = 'none'
  []
[]

[Materials]
  [convert_strain]
    type = RankTwoTensorToSymmetricRankTwoTensor
    from = 'mechanical_strain'
    to = 'neml2_strain'
  []
  [stress]
    type = ComputeLagrangianObjectiveCustomSymmetricStress
    custom_small_stress = 'neml2_stress'
    custom_small_jacobian = 'neml2_jacobian'
  []
  [./thermal_expansion_strain1]
    type = ComputeMeanThermalExpansionFunctionEigenstrain
    thermal_expansion_function = cte_func_mean
    thermal_expansion_function_reference_temperature = 293.15
    stress_free_temperature = 273.15
    temperature = T
    eigenstrain_name = thermal_expansion
  [../]
[]

[Functions]
  [./cte_func_mean]
    type = PiecewiseLinear
    x='293.150000000000	323.150000000000	348.150000000000	373.150000000000	398.150000000000	423.150000000000	448.150000000000	473.150000000000	498.150000000000	523.150000000000	548.150000000000	573.150000000000	598.150000000000	623.150000000000	648.150000000000	673.150000000000	698.150000000000	723.150000000000	748.150000000000	773.150000000000	798.150000000000	823.150000000000	848.150000000000	873.150000000000	898.150000000000	923.150000000000	948.150000000000	973.150000000000	998.150000000000	1023.15000000000	1048.15000000000	1073.15000000000	1098.15000000000'
    y='1.05000000000000e-05	1.06000000000000e-05	1.07000000000000e-05	1.09000000000000e-05	1.10000000000000e-05	1.11000000000000e-05	1.12000000000000e-05	1.13000000000000e-05	1.14000000000000e-05	1.15000000000000e-05	1.16000000000000e-05	1.17000000000000e-05	1.18000000000000e-05	1.19000000000000e-05	1.19000000000000e-05	1.20000000000000e-05	1.21000000000000e-05	1.22000000000000e-05	1.23000000000000e-05	1.23000000000000e-05	1.24000000000000e-05	1.25000000000000e-05	1.26000000000000e-05	1.27000000000000e-05	1.27000000000000e-05	1.28000000000000e-05	1.29000000000000e-05	1.30000000000000e-05	1.31000000000000e-05	1.33000000000000e-05	1.34000000000000e-05	1.36000000000000e-05	1.38000000000000e-05'
  [../]
  [temperature_load]
    type = PiecewiseLinear
    data_file=tempcsv.csv
    format=columns
  []
  [strain_load]
    type = PiecewiseLinear
    data_file=straincsv.csv
    format=columns
  []
[]


[BCs]
  [xfix]
    type = DirichletBC
    variable = disp_x
    boundary = left
    value = 0
  []
  [yfix]
    type = DirichletBC
    variable = disp_y
    boundary = bottom
    value = 0
  []
  [zfix]
    type = DirichletBC
    variable = disp_z
    boundary = back
    value = 0
  []
  [xdisp]
    type = FunctionDirichletBC
    variable = disp_x
    boundary = right
    function = strain_load
    #preset = false
  []
[]

[Preconditioning]
  [./SMP]
    type = SMP
    full = true
  [../]
[]

[Executioner]
  type = Transient
  solve_type = NEWTON
  petsc_options_iname = '-pc_type'
  petsc_options_value = ' lu'
  automatic_scaling = true
  nl_abs_tol=1e-12
  end_time=0.01
  residual_and_jacobian_together = true
  [TimeStepper]
      type = CSVTimeSequenceStepper
      file_name = timecsv.csv
  []
[]

[Outputs]
  exodus = true
  #console = false
  perf_graph = true
  #csv = true
  [perf_graph]
    type = PerfGraphOutput
    execute_on = 'final' 
    level = 3 
    heaviest_sections = 10
    heaviest_branch = true
  []
[]
