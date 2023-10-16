within ;
model series_pump_test
  Buildings.Fluid.Movers.SpeedControlled_y chwp_1(
    redeclare package Medium = Buildings.Media.Water,
    redeclare
      Buildings.Fluid.Movers.Data.Pumps.Wilo.CronolineIL80slash220dash4slash4
      per(
      pressure(V_flow={0,99,300,497,800,999,1100,1198}, dp={373050,373000,
            363000,347000,317000,293000,276000,250000}),
      power(V_flow={0,55.6,111.4,166.7,219.2,276.9,333.1,389.7}, P={119188.42,
            129804,142486,156660,171580,187992,205150,223800}),
      speed_rpm_nominal=1480),
    addPowerToMedium=true)
    annotation (Placement(transformation(extent={{-14,28},{-32,10}})));
  Buildings.Fluid.Sources.Boundary_pT chw_sup(
    redeclare package Medium = Buildings.Media.Water,
    use_p_in=false,
    use_T_in=false,
    nPorts=1) annotation (Placement(transformation(
        extent={{-14,-14},{14,14}},
        rotation=180,
        origin={334,306})));
  Buildings.Fluid.Sources.Boundary_pT chw_ret(
    redeclare package Medium = Buildings.Media.Water,
    use_p_in=false,
    use_T_in=false,
    nPorts=1) annotation (Placement(transformation(
        extent={{-14,-14},{14,14}},
        rotation=180,
        origin={182,160})));
  Buildings.Fluid.FixedResistances.Pipe pipe_6(
    redeclare package Medium = Buildings.Media.Water,
    energyDynamics=Modelica.Fluid.Types.Dynamics.SteadyState,
    massDynamics=Modelica.Fluid.Types.Dynamics.SteadyState,
    T_start=286.65,
    allowFlowReversal=true,
    m_flow_nominal=305,
    dp_nominal=3000,
    thicknessIns=0.02,
    lambdaIns=0.1,
    diameter=1.2,
    length=50,
    v_nominal=0.13,
    roughness=0.5)
               annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={102,276})));
  Buildings.Fluid.FixedResistances.Pipe pipe_9(
    redeclare package Medium = Buildings.Media.Water,
    energyDynamics=Modelica.Fluid.Types.Dynamics.SteadyState,
    massDynamics=Modelica.Fluid.Types.Dynamics.SteadyState,
    T_start=286.65,
    allowFlowReversal=true,
    m_flow_nominal=800,
    dp_nominal=20000,
    thicknessIns=0.02,
    lambdaIns=0.1,
    diameter=1.2,
    length=50,
    v_nominal=0.13,
    roughness=0.5)
               annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={-144,60})));
  Buildings.Fluid.FixedResistances.Pipe pipe_10(
    redeclare package Medium = Buildings.Media.Water,
    energyDynamics=Modelica.Fluid.Types.Dynamics.SteadyState,
    massDynamics=Modelica.Fluid.Types.Dynamics.SteadyState,
    T_start=286.65,
    allowFlowReversal=true,
    m_flow_nominal=800,
    dp_nominal=200000,
    thicknessIns=0.02,
    lambdaIns=0.1,
    diameter=1.2,
    length=50,
    v_nominal=0.13,
    roughness=0.5)
               annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={18,66})));
  Buildings.Fluid.FixedResistances.Pipe chiller_1(
    redeclare package Medium = Buildings.Media.Water,
    energyDynamics=Modelica.Fluid.Types.Dynamics.SteadyState,
    massDynamics=Modelica.Fluid.Types.Dynamics.SteadyState,
    T_start=286.65,
    allowFlowReversal=true,
    m_flow_nominal=chr_flow_nom,
    thicknessIns=0.02,
    lambdaIns=0.5,
    diameter=0.35,
    length=chr_pipe_len,
    v_nominal=0.004,
    roughness=chr_roughness)
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},
        rotation=180,
        origin={-94,22})));
  Buildings.Fluid.FixedResistances.Pipe pipe_8(
    redeclare package Medium = Buildings.Media.Water,
    energyDynamics=Modelica.Fluid.Types.Dynamics.SteadyState,
    massDynamics=Modelica.Fluid.Types.Dynamics.SteadyState,
    T_start=286.65,
    allowFlowReversal=true,
    m_flow_nominal=800,
    dp_nominal=15000,
    thicknessIns=0.02,
    lambdaIns=0.1,
    diameter=1.2,
    length=50,
    v_nominal=0.13,
    roughness=0.5)
               annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={-144,158})));
  Buildings.Fluid.FixedResistances.Pipe secdy_ret_pipe(
    redeclare package Medium = Buildings.Media.Water,
    energyDynamics=Modelica.Fluid.Types.Dynamics.SteadyState,
    massDynamics=Modelica.Fluid.Types.Dynamics.SteadyState,
    T_start=286.65,
    allowFlowReversal=true,
    m_flow_nominal=800,
    dp_nominal=300000,
    thicknessIns=0.02,
    lambdaIns=0.1,
    diameter=1.2,
    length=50,
    v_nominal=0.13,
    roughness=0.5) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={100,128})));
  Buildings.Fluid.FixedResistances.PressureDrop terminal_resist(
    redeclare package Medium = Buildings.Media.Water,
    m_flow_nominal=305,
    dp_nominal=1000000) "Resistance of terminals"
    annotation (Placement(transformation(extent={{210,266},{250,296}})));
  parameter Real length=chr_pipe_len
    "Equivilent length of pipe for chiller pressure drop (m)";
  parameter Real chr_pipe_len=100
    "Equivilent length of pipe for chiller pressure drop (m)";
  parameter Real chr_flow_nom=100 "Nominal flow rate of each chiller (kg/s)";
  parameter Real chr_roughness=2.5e-5
    "Roughness of the equivilent pipe of chiller (m)";
  Modelica.Blocks.Sources.Constant chwp1_speed_const(k=1)
    annotation (Placement(transformation(extent={{-248,42},{-228,62}})));
  Buildings.Fluid.Actuators.Valves.TwoWayLinear chwp_1_val(
    redeclare package Medium = Buildings.Media.Water,
    m_flow_nominal=120,
    dpValve_nominal=5000) annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=0,
        origin={-48,20})));
  Modelica.Blocks.Sources.Constant chwp1_val_pos(k=1)
    annotation (Placement(transformation(extent={{90,32},{70,52}})));
  Buildings.Fluid.Movers.SpeedControlled_y chwp_18(
    redeclare package Medium = Buildings.Media.Water,
    redeclare
      Buildings.Fluid.Movers.Data.Pumps.Wilo.CronolineIL80slash220dash4slash4
      per(
      pressure(V_flow={0,237,603,994,1402,1802,2002,2202}, dp={734800,710000,660000,
            600000,520000,430000,370000,310000}),
      use_powerCharacteristic=true,
      power(V_flow={0,55.6,111.4,166.7,219.2,276.9,333.1,389.7}, P={119188.42,129804,
            142486,156660,171580,187992,205150,223800})),
    addPowerToMedium=true) annotation (Placement(transformation(
        extent={{9,9},{-9,-9}},
        rotation=180,
        origin={-81,215})));
  Buildings.Fluid.FixedResistances.Pipe pipe_13(
    redeclare package Medium = Buildings.Media.Water,
    energyDynamics=Modelica.Fluid.Types.Dynamics.SteadyState,
    massDynamics=Modelica.Fluid.Types.Dynamics.SteadyState,
    T_start=286.65,
    allowFlowReversal=true,
    m_flow_nominal=120,
    dp_nominal=15000,
    thicknessIns=0.02,
    lambdaIns=0.1,
    diameter=0.45,
    length=60,
    v_nominal=0.21,
    roughness=0.5)
               annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={-38,214})));
  Buildings.Fluid.Actuators.Valves.TwoWayLinear chwp_18_val(
    redeclare package Medium = Buildings.Media.Water,
    m_flow_nominal=120,
    dpValve_nominal=5000)
    annotation (Placement(transformation(extent={{-126,202},{-106,222}})));
  Modelica.Blocks.Sources.Constant chwp18_val_pos(k=1)
    annotation (Placement(transformation(extent={{68,192},{48,212}})));
  Modelica.Blocks.Sources.Constant chwp18_speed_const(k=1)
    annotation (Placement(transformation(extent={{-236,192},{-216,212}})));
equation
  connect(pipe_6.port_b, terminal_resist.port_a) annotation (Line(points={{112,276},
          {196,276},{196,281},{210,281}},      color={0,127,255}));
  connect(terminal_resist.port_b, chw_sup.ports[1]) annotation (Line(points={{
          250,281},{308,281},{308,306},{320,306}}, color={0,127,255}));
  connect(chwp1_speed_const.y, chwp_1.y) annotation (Line(points={{-227,52},{
          -214,52},{-214,48},{-62,48},{-62,2},{-23,2},{-23,8.2}}, color={0,0,
          127}));
  connect(chiller_1.port_a, chwp_1_val.port_b)
    annotation (Line(points={{-84,22},{-84,19},{-58,20}}, color={0,127,255}));
  connect(chwp_1_val.port_a, chwp_1.port_b) annotation (Line(points={{-38,20},{
          -35,20},{-35,19},{-32,19}}, color={0,127,255}));
  connect(chwp1_val_pos.y, chwp_1_val.y)
    annotation (Line(points={{69,42},{-48,42},{-48,32}}, color={0,0,127}));
  connect(pipe_13.port_a, chwp_18.port_b) annotation (Line(points={{-48,214},{-48,
          192},{-72,192},{-72,215}}, color={0,127,255}));
  connect(chwp_18.port_a, chwp_18_val.port_b) annotation (Line(points={{-90,215},
          {-90,212},{-106,212}}, color={0,127,255}));
  connect(chwp18_speed_const.y, chwp_18.y) annotation (Line(points={{-215,202},{
          -160,202},{-160,196},{-144,196},{-144,184},{-81,184},{-81,225.8}},
        color={0,0,127}));
  connect(pipe_10.port_b, chwp_1.port_a) annotation (Line(points={{18,56},{16,
          56},{16,19},{-14,19}}, color={0,127,255}));
  connect(pipe_9.port_a, chiller_1.port_b) annotation (Line(points={{-144,50},{
          -144,22},{-104,22}}, color={0,127,255}));
  connect(pipe_8.port_b, chwp_18_val.port_a) annotation (Line(points={{-144,168},
          {-144,180},{-128,180},{-128,188},{-136,188},{-136,212},{-126,212}},
        color={0,127,255}));
  connect(pipe_6.port_a, pipe_13.port_b) annotation (Line(points={{92,276},{34,
          276},{34,212},{-28,212},{-28,214}}, color={0,127,255}));
  connect(chwp18_val_pos.y, chwp_18_val.y) annotation (Line(points={{47,202},{
          24,202},{24,236},{-116,236},{-116,224}}, color={0,0,127}));
  connect(secdy_ret_pipe.port_a, chw_ret.ports[1]) annotation (Line(points={{
          110,128},{148,128},{148,160},{168,160}}, color={0,127,255}));
  connect(pipe_8.port_a, pipe_9.port_b)
    annotation (Line(points={{-144,148},{-144,70}}, color={0,127,255}));
  connect(secdy_ret_pipe.port_b, pipe_10.port_a) annotation (Line(points={{90,
          128},{16,128},{16,84},{18,84},{18,76}}, color={0,127,255}));
  annotation (
    Icon(coordinateSystem(preserveAspectRatio=false, extent={{-320,-360},{360,
            480}})),
    Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-320,-360},{
            360,480}})),
    uses(Buildings(version="8.1.3"), Modelica(version="4.0.0")));
end series_pump_test;
