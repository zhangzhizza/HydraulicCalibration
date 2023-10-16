within ;
model nb_hydr_static_v2

  Buildings.Fluid.Sources.Boundary_pT chw_ret(
    redeclare package Medium = Buildings.Media.Water,
    use_Xi_in=false,
    use_p_in=true,
    p=400000,
    nPorts=1)
    annotation (Placement(transformation(extent={{142,102},{112,72}})));
  Buildings.Fluid.Movers.SpeedControlled_y chwp_1(redeclare package Medium =
        Buildings.Media.Water,
    energyDynamics=Modelica.Fluid.Types.Dynamics.SteadyState,
    massDynamics=Modelica.Fluid.Types.Dynamics.SteadyState,
    p_start=400000,
    redeclare
      Buildings.Fluid.Movers.Data.Pumps.Wilo.CronolineIL80slash220dash4slash4
      per(
      pressure(V_flow={0,55.6,111.4,166.7,219.2,276.9,333.1,389.7}, dp={634500,
            625500,617660,608840,597100,577500,548100,503900}),
      use_powerCharacteristic=true,
      power(V_flow={0,55.6,111.4,166.7,219.2,276.9,333.1,389.7}, P={119188.42,
            129804,142486,156660,171580,187992,205150,223800})),
    addPowerToMedium=true)
    annotation (Placement(transformation(extent={{-64,76},{-96,44}})));
  Buildings.Fluid.FixedResistances.Pipe chiller_1(
    redeclare package Medium = Buildings.Media.Water,
    energyDynamics=Modelica.Fluid.Types.Dynamics.FixedInitial,
    massDynamics=Modelica.Fluid.Types.Dynamics.FixedInitial,
    allowFlowReversal=false,
    m_flow_nominal=chr_flow_nom,
    m_flow_small=0.0001,
    nSeg=10,
    thicknessIns=0.1,
    lambdaIns=0.1,
    length=chr_pipe_len,
    v_nominal=0.15,
    roughness=chr_roughness,
    useMultipleHeatPorts=false)
    annotation (Placement(transformation(extent={{-160,40},{-200,80}})));
  Buildings.Fluid.FixedResistances.Junction jun_1(
    redeclare package Medium = Buildings.Media.Water,
    m_flow_nominal={800,-600,-200},
    dp_nominal={jun_p1_dp,jun_p2_dp,jun_p3_dp})
                                annotation (Placement(transformation(
        extent={{-14,-14},{14,14}},
        rotation=-90,
        origin={0,60})));

  Buildings.Fluid.Movers.SpeedControlled_y chwp_2(redeclare package Medium =
        Buildings.Media.Water,
    energyDynamics=Modelica.Fluid.Types.Dynamics.SteadyState,
    massDynamics=Modelica.Fluid.Types.Dynamics.SteadyState,
    p_start=400000,
    redeclare
      Buildings.Fluid.Movers.Data.Pumps.Wilo.CronolineIL80slash220dash4slash4
      per(
      pressure(V_flow={0,55.6,111.4,166.7,219.2,276.9,333.1,389.7}, dp={634500,
            625500,617660,608840,597100,577500,548100,503900}),
      power(V_flow={0,55.6,111.4,166.7,219.2,276.9,333.1,389.7}, P={119188.42,
            129804,142486,156660,171580,187992,205150,223800}),
      speed_rpm_nominal=1480),
    addPowerToMedium=true)
    annotation (Placement(transformation(extent={{-64,-4},{-96,-36}})));
  Buildings.Fluid.FixedResistances.Pipe chiller_2(
    redeclare package Medium = Buildings.Media.Water,
    energyDynamics=Modelica.Fluid.Types.Dynamics.FixedInitial,
    massDynamics=Modelica.Fluid.Types.Dynamics.FixedInitial,
    allowFlowReversal=false,
    m_flow_nominal=chr_flow_nom,
    m_flow_small=0.0001,
    nSeg=10,
    thicknessIns=0.1,
    lambdaIns=0.1,
    length=chr_pipe_len,
    v_nominal=0.15,
    roughness=chr_roughness,
    useMultipleHeatPorts=false)
    annotation (Placement(transformation(extent={{-160,-40},{-200,0}})));
  Buildings.Fluid.FixedResistances.Junction jun_2(
    redeclare package Medium = Buildings.Media.Water,
    m_flow_nominal={600,-400,-200},
    dp_nominal={jun_p1_dp,jun_p2_dp,jun_p3_dp})
                                annotation (Placement(transformation(
        extent={{-14,-14},{14,14}},
        rotation=-90,
        origin={0,-20})));
  Buildings.Fluid.Movers.SpeedControlled_y chwp_3(redeclare package Medium =
        Buildings.Media.Water,
    energyDynamics=Modelica.Fluid.Types.Dynamics.SteadyState,
    massDynamics=Modelica.Fluid.Types.Dynamics.SteadyState,
    p_start=400000,
    redeclare
      Buildings.Fluid.Movers.Data.Pumps.Wilo.CronolineIL80slash220dash4slash4
      per(
      pressure(V_flow={0,55.6,111.4,166.7,219.2,276.9,333.1,389.7}, dp={634500,
            625500,617660,608840,597100,577500,548100,503900}),
      power(V_flow={0,55.6,111.4,166.7,219.2,276.9,333.1,389.7}, P={119188.42,
            129804,142486,156660,171580,187992,205150,223800}),
      speed_rpm_nominal=1480),
    addPowerToMedium=true)
    annotation (Placement(transformation(extent={{-64,-84},{-96,-116}})));
  Buildings.Fluid.FixedResistances.Pipe chiller_3(
    redeclare package Medium = Buildings.Media.Water,
    energyDynamics=Modelica.Fluid.Types.Dynamics.FixedInitial,
    massDynamics=Modelica.Fluid.Types.Dynamics.FixedInitial,
    allowFlowReversal=false,
    m_flow_nominal=chr_flow_nom,
    m_flow_small=0.0001,
    nSeg=10,
    thicknessIns=0.1,
    lambdaIns=0.1,
    length=chr_pipe_len,
    v_nominal=0.15,
    roughness=chr_roughness,
    useMultipleHeatPorts=false)
    annotation (Placement(transformation(extent={{-160,-120},{-200,-80}})));
  Buildings.Fluid.FixedResistances.Junction jun_3(
    redeclare package Medium = Buildings.Media.Water,
    m_flow_nominal={400,-200,-200},
    dp_nominal={jun_p1_dp,jun_p2_dp,jun_p3_dp})
                                annotation (Placement(transformation(
        extent={{-14,-14},{14,14}},
        rotation=-90,
        origin={0,-100})));
  Buildings.Fluid.Movers.SpeedControlled_y chwp_4(redeclare package Medium =
        Buildings.Media.Water,
    energyDynamics=Modelica.Fluid.Types.Dynamics.SteadyState,
    massDynamics=Modelica.Fluid.Types.Dynamics.SteadyState,
    p_start=400000,
    redeclare
      Buildings.Fluid.Movers.Data.Pumps.Wilo.CronolineIL80slash220dash4slash4
      per(
      pressure(V_flow={0,55.6,111.4,166.7,219.2,276.9,333.1,389.7}, dp={634500,
            625500,617660,608840,597100,577500,548100,503900}),
      power(V_flow={0,55.6,111.4,166.7,219.2,276.9,333.1,389.7}, P={119188.42,
            129804,142486,156660,171580,187992,205150,223800}),
      speed_rpm_nominal=1480),
    addPowerToMedium=true)
    annotation (Placement(transformation(extent={{-64,-164},{-96,-196}})));
  Buildings.Fluid.FixedResistances.Pipe chiller_4(
    redeclare package Medium = Buildings.Media.Water,
    energyDynamics=Modelica.Fluid.Types.Dynamics.FixedInitial,
    massDynamics=Modelica.Fluid.Types.Dynamics.FixedInitial,
    allowFlowReversal=false,
    m_flow_nominal=chr_flow_nom,
    m_flow_small=0.0001,
    nSeg=10,
    thicknessIns=0.1,
    lambdaIns=0.1,
    length=chr_pipe_len,
    v_nominal=0.15,
    roughness=chr_roughness,
    useMultipleHeatPorts=false)
    annotation (Placement(transformation(extent={{-160,-200},{-200,-160}})));
  Buildings.Fluid.FixedResistances.Junction jun_4(
    redeclare package Medium = Buildings.Media.Water,
    m_flow_nominal={111,55,-166},
    dp_nominal={500,500,-500}) annotation (Placement(transformation(
        extent={{14,14},{-14,-14}},
        rotation=-90,
        origin={-260,60})));
  Buildings.Fluid.FixedResistances.Junction jun_5(
    redeclare package Medium = Buildings.Media.Water,
    m_flow_nominal={55,55,-110},
    dp_nominal={500,500,-500}) annotation (Placement(transformation(
        extent={{14,14},{-14,-14}},
        rotation=-90,
        origin={-260,-20})));
  Buildings.Fluid.FixedResistances.Junction jun_6(redeclare package Medium =
        Buildings.Media.Water,
    m_flow_nominal={55,55,-110},
                               dp_nominal={55,55,-110}) annotation (Placement(
        transformation(
        extent={{14,14},{-14,-14}},
        rotation=-90,
        origin={-260,-100})));
  Buildings.Fluid.Sources.Boundary_pT chw_sup(
    redeclare package Medium = Buildings.Media.Water,
    use_p_in=false,
    use_T_in=false,
    nPorts=2) annotation (Placement(transformation(
        extent={{-15,-15},{15,15}},
        rotation=180,
        origin={161,157})));

  Buildings.Fluid.Sensors.MassFlowRate chw_sup_m(redeclare package Medium =
        Buildings.Media.Water) "Chille water supply mass flow rate (kg/s)"
    annotation (Placement(transformation(extent={{-210,128},{-190,148}})));
  Buildings.Fluid.Sensors.MassFlowRate chw_ret_m(redeclare package Medium =
        Buildings.Media.Water) "Chille water return mass flow rate (kg/s)"
    annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={58,84})));
  Modelica.Blocks.Sources.Constant pump_speed_1(k=1) "Pump speed constant"
    annotation (Placement(transformation(extent={{-276,-280},{-256,-260}})));
  Buildings.Fluid.Sensors.Pressure chw_sup_P(redeclare package Medium =
        Buildings.Media.Water) "Chilled water supply pressure"
    annotation (Placement(transformation(extent={{-22,152},{-2,172}})));
  Buildings.Fluid.Sensors.Pressure chw_ret_P(redeclare package Medium =
        Buildings.Media.Water) "Chilled water return pressure"
    annotation (Placement(transformation(extent={{18,96},{38,116}})));
  Buildings.Fluid.Sensors.Pressure chw_term_P(redeclare package Medium =
        Buildings.Media.Water) "Chilled water pressure after terminal"
    annotation (Placement(transformation(extent={{82,152},{102,172}})));
  parameter Real jun_p1_dp=5000 "Pa";
  parameter Real jun_p2_dp=-5000 "Pa";
  parameter Real jun_p3_dp=-5000 "Pa";
  parameter Real chr_pipe_len=50
    "Equivilent length of pipe for chiller pressure drop (m)";
  parameter Real chr_flow_nom=80 "Nominal flow rate of each chiller (kg/s)";
  parameter Real chr_roughness=2.5e-5
    "Roughness of the equivilent pipe of chiller (m)";
  Modelica.Blocks.Sources.Constant pump_speed_2(k=1) "Pump speed constant"
    annotation (Placement(transformation(extent={{-322,-282},{-302,-262}})));
  Modelica.Blocks.Sources.Constant pump_speed_3(k=1) "Pump speed constant"
    annotation (Placement(transformation(extent={{-320,-318},{-300,-298}})));
  Modelica.Blocks.Sources.Constant pump_speed_4(k=1) "Pump speed constant"
    annotation (Placement(transformation(extent={{-272,-324},{-252,-304}})));
  Modelica.Blocks.Sources.Constant ret_p(k=400000) "Return water pressure"
    annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={196,84})));
  Buildings.Fluid.Actuators.Valves.TwoWayLinear terminal_resist(
    redeclare package Medium = Buildings.Media.Water,
    m_flow_nominal=1000,
    CvData=Buildings.Fluid.Types.CvTypes.OpPoint,
    dpValve_nominal=100000,
    dpFixed_nominal=1000000)
    annotation (Placement(transformation(extent={{32,128},{52,148}})));
  Modelica.Blocks.Sources.Constant terminal_resist_ratio(k=1)
    "Pump speed constant"
    annotation (Placement(transformation(extent={{14,156},{34,176}})));
equation
  connect(jun_1.port_3, chwp_1.port_a)
    annotation (Line(points={{-14,60},{-64,60}}, color={0,127,255}));
  connect(chwp_1.port_b, chiller_1.port_a)
    annotation (Line(points={{-96,60},{-160,60}}, color={0,127,255}));
  connect(jun_2.port_3, chwp_2.port_a)
    annotation (Line(points={{-14,-20},{-64,-20}}, color={0,127,255}));
  connect(chwp_2.port_b, chiller_2.port_a)
    annotation (Line(points={{-96,-20},{-160,-20}}, color={0,127,255}));
  connect(jun_3.port_3, chwp_3.port_a)
    annotation (Line(points={{-14,-100},{-64,-100}}, color={0,127,255}));
  connect(chwp_3.port_b, chiller_3.port_a)
    annotation (Line(points={{-96,-100},{-160,-100}}, color={0,127,255}));
  connect(chwp_4.port_b, chiller_4.port_a)
    annotation (Line(points={{-96,-180},{-160,-180}}, color={0,127,255}));
  connect(jun_1.port_2, jun_2.port_1)
    annotation (Line(points={{0,46},{0,-6}}, color={0,127,255}));
  connect(jun_2.port_2, jun_3.port_1)
    annotation (Line(points={{0,-34},{0,-86}}, color={0,127,255}));
  connect(jun_3.port_2, chwp_4.port_a) annotation (Line(points={{0,-114},{0,
          -180},{-64,-180}}, color={0,127,255}));
  connect(chiller_1.port_b, jun_4.port_3)
    annotation (Line(points={{-200,60},{-246,60}}, color={0,127,255}));
  connect(chiller_2.port_b, jun_5.port_3)
    annotation (Line(points={{-200,-20},{-246,-20}}, color={0,127,255}));
  connect(chiller_3.port_b, jun_6.port_3)
    annotation (Line(points={{-200,-100},{-246,-100}}, color={0,127,255}));
  connect(chiller_4.port_b, jun_6.port_1) annotation (Line(points={{-200,-180},
          {-260,-180},{-260,-114}}, color={0,127,255}));
  connect(jun_6.port_2, jun_5.port_1)
    annotation (Line(points={{-260,-86},{-260,-34}}, color={0,127,255}));
  connect(jun_5.port_2, jun_4.port_1)
    annotation (Line(points={{-260,-6},{-260,46}}, color={0,127,255}));
  connect(jun_4.port_2, chw_sup_m.port_a) annotation (Line(points={{-260,74},{
          -260,137},{-210,138}}, color={0,127,255}));
  connect(chw_ret.ports[1], chw_ret_m.port_a)
    annotation (Line(points={{112,87},{112,84},{68,84}}, color={0,127,255}));
  connect(chw_ret_m.port_b, jun_1.port_1) annotation (Line(points={{48,84},{
          4.32987e-15,84},{4.32987e-15,74}}, color={0,127,255}));
  connect(chw_ret_P.port, jun_1.port_1) annotation (Line(points={{28,96},{28,84},
          {4.32987e-15,84},{4.32987e-15,74}}, color={0,127,255}));
  connect(chw_term_P.port, chw_sup.ports[1]) annotation (Line(points={{92,152},
          {92,138},{132,138},{132,154},{146,154}}, color={0,127,255}));
  connect(pump_speed_1.y, chwp_1.y) annotation (Line(points={{-255,-270},{-168,
          -270},{-168,-148},{-80,-148},{-80,40.8}}, color={0,0,127}));
  connect(pump_speed_2.y, chwp_2.y) annotation (Line(points={{-301,-272},{-206,
          -272},{-206,-136},{-80,-136},{-80,-39.2}}, color={0,0,127}));
  connect(pump_speed_3.y, chwp_3.y) annotation (Line(points={{-299,-308},{-208,
          -308},{-208,-222},{-80,-222},{-80,-119.2}}, color={0,0,127}));
  connect(pump_speed_4.y, chwp_4.y) annotation (Line(points={{-251,-314},{-160,
          -314},{-160,-208},{-104,-208},{-104,-199.2},{-80,-199.2}}, color={0,0,
          127}));
  connect(ret_p.y, chw_ret.p_in) annotation (Line(points={{185,84},{156,84},{
          156,64},{145,64},{145,75}}, color={0,0,127}));
  connect(chw_sup_m.port_b, terminal_resist.port_a)
    annotation (Line(points={{-190,138},{32,138}}, color={0,127,255}));
  connect(chw_sup_P.port, terminal_resist.port_a) annotation (Line(points={{-12,
          152},{-12,138},{32,138}}, color={0,127,255}));
  connect(terminal_resist.port_b, chw_sup.ports[2]) annotation (Line(points={{
          52,138},{132,138},{132,160},{146,160}}, color={0,127,255}));
  connect(terminal_resist_ratio.y, terminal_resist.y)
    annotation (Line(points={{35,166},{42,166},{42,150}}, color={0,0,127}));
  annotation (
    Diagram(coordinateSystem(extent={{-360,-340},{220,200}}), graphics={
                                  Rectangle(
          extent={{-360,-226},{-180,-340}},
          lineColor={28,108,200},
          fillColor={255,255,170},
          fillPattern=FillPattern.Solid), Text(
          extent={{-356,-234},{-256,-268}},
          textColor={0,0,0},
          textString="Control Signals
")}),
    Icon(coordinateSystem(extent={{-360,-340},{220,200}})),
    uses(                           Buildings(version="8.1.0"), Modelica(
          version="4.0.0")),
    version="1",
    conversion(noneFromVersion=""));
end nb_hydr_static_v2;
