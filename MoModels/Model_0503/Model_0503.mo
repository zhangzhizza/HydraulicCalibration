within ;
model Model_0503

  Buildings.Fluid.Sources.Boundary_pT chw_ret(
    redeclare package Medium = Buildings.Media.Water,
    use_Xi_in=false,
    use_p_in=true,
    p=460000,
    nPorts=1)
    annotation (Placement(transformation(extent={{142,102},{112,72}})));
  Buildings.Fluid.Movers.SpeedControlled_y chwp_1(redeclare package Medium =
        Buildings.Media.Water,
    energyDynamics=Modelica.Fluid.Types.Dynamics.SteadyState,
    massDynamics=Modelica.Fluid.Types.Dynamics.SteadyState,
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
    energyDynamics=Modelica.Fluid.Types.Dynamics.SteadyState,
    massDynamics=Modelica.Fluid.Types.Dynamics.SteadyState,
    T_start=291.95,
    allowFlowReversal=true,
    m_flow_nominal=80,
    dp_nominal=15000,
    thicknessIns=0.1,
    lambdaIns=0.1,
    diameter=0.1,
    length=20)
    annotation (Placement(transformation(extent={{-160,40},{-200,80}})));
  Buildings.Fluid.FixedResistances.Junction jun_1(
    redeclare package Medium = Buildings.Media.Water,
    m_flow_nominal={166,-111,-55},
    dp_nominal={500,-500,-500}) annotation (Placement(transformation(
        extent={{-14,-14},{14,14}},
        rotation=-90,
        origin={0,60})));

  Buildings.Fluid.Movers.SpeedControlled_y chwp_2(redeclare package Medium =
        Buildings.Media.Water,
    energyDynamics=Modelica.Fluid.Types.Dynamics.SteadyState,
    massDynamics=Modelica.Fluid.Types.Dynamics.SteadyState,
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
    energyDynamics=Modelica.Fluid.Types.Dynamics.SteadyState,
    massDynamics=Modelica.Fluid.Types.Dynamics.SteadyState,
    T_start=286.95,
    allowFlowReversal=true,
    m_flow_nominal=80,
    dp_nominal=15000,
    thicknessIns=0.1,
    lambdaIns=0.1,
    diameter=0.1,
    length=20)
    annotation (Placement(transformation(extent={{-160,-40},{-200,0}})));
  Buildings.Fluid.FixedResistances.Junction jun_2(
    redeclare package Medium = Buildings.Media.Water,
    m_flow_nominal={111,-55,-55},
    dp_nominal={500,-500,-500}) annotation (Placement(transformation(
        extent={{-14,-14},{14,14}},
        rotation=-90,
        origin={0,-20})));
  Buildings.Fluid.Movers.SpeedControlled_y chwp_3(redeclare package Medium =
        Buildings.Media.Water,
    energyDynamics=Modelica.Fluid.Types.Dynamics.SteadyState,
    massDynamics=Modelica.Fluid.Types.Dynamics.SteadyState,
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
    energyDynamics=Modelica.Fluid.Types.Dynamics.SteadyState,
    massDynamics=Modelica.Fluid.Types.Dynamics.SteadyState,
    T_start=286.65,
    allowFlowReversal=true,
    m_flow_nominal=80,
    dp_nominal=15000,
    thicknessIns=0.1,
    lambdaIns=0.1,
    diameter=0.1,
    length=20)
    annotation (Placement(transformation(extent={{-160,-120},{-200,-80}})));
  Buildings.Fluid.FixedResistances.Junction jun_3(
    redeclare package Medium = Buildings.Media.Water,
    m_flow_nominal={55,-25,-30},
    dp_nominal={500,-500,-500}) annotation (Placement(transformation(
        extent={{-14,-14},{14,14}},
        rotation=-90,
        origin={0,-100})));
  Buildings.Fluid.Movers.SpeedControlled_y chwp_4(redeclare package Medium =
        Buildings.Media.Water,
    energyDynamics=Modelica.Fluid.Types.Dynamics.SteadyState,
    massDynamics=Modelica.Fluid.Types.Dynamics.SteadyState,
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
    energyDynamics=Modelica.Fluid.Types.Dynamics.SteadyState,
    massDynamics=Modelica.Fluid.Types.Dynamics.SteadyState,
    T_start=284.65,
    allowFlowReversal=true,
    m_flow_nominal=80,
    dp_nominal=15000,
    thicknessIns=0.1,
    lambdaIns=0.1,
    diameter=0.1,
    length=20)
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
    use_p_in=true,
    p=404000,
    use_T_in=false,
    nPorts=1) annotation (Placement(transformation(
        extent={{-15,-15},{15,15}},
        rotation=180,
        origin={127,137})));
  Modelica.Blocks.Sources.Step ctr_chwp_y1(
    height=0.3,
    offset=0,
    startTime=10)
    annotation (Placement(transformation(extent={{-350,-328},{-324,-302}})));

  Modelica.Blocks.Sources.CombiTimeTable real_ret_p(
    columns={2},
    fileName=Modelica.Utilities.Files.loadResource(
        "./chew_return.csv"),
    tableName="csv",tableOnFile=true) "Reader for test.csv"
    annotation (Placement(transformation(extent={{212,38},{170,80}})));

  Modelica.Blocks.Sources.CombiTimeTable real_sup_p(
    columns={2},
    fileName=Modelica.Utilities.Files.loadResource(
        "./chew_supp.csv"), smoothness = Modelica.Blocks.Types.Smoothness.MonotoneContinuousDerivative2,
    tableName="csv",tableOnFile=true) "Reader for test.csv"
    annotation (Placement(transformation(extent={{212,104},{170,146}})));

  Modelica.Blocks.Sources.CombiTimeTable hz_1(
    columns={2},
    fileName=Modelica.Utilities.Files.loadResource(
        "./chew_hz1.csv"),
    tableName="csv",tableOnFile=true) "Reader for test.csv"
    annotation (Placement(transformation(extent={{-218,-256},{-198,-236}})));

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
  connect(jun_4.port_2, chw_sup.ports[1]) annotation (Line(points={{-260,74},{-260,
          137},{112,137}}, color={0,127,255}));
  connect(ctr_chwp_y1.y, chwp_3.y) annotation (Line(points={{-322.7,-315},{-80,
          -315},{-80,-208},{-104,-208},{-104,-132},{-80,-132},{-80,-119.2}},
        color={0,0,127}));
  connect(ctr_chwp_y1.y, chwp_2.y) annotation (Line(points={{-322.7,-315},{-80,
          -315},{-80,-208},{-104,-208},{-104,-52},{-80,-52},{-80,-39.2}}, color=
         {0,0,127}));
  connect(chw_ret.ports[1], jun_1.port_1) annotation (Line(points={{112,87},{
          112,84},{4.32987e-15,84},{4.32987e-15,74}}, color={0,127,255}));
  connect(chwp_4.y, ctr_chwp_y1.y) annotation (Line(points={{-80,-199.2},{-80,
          -315},{-322.7,-315}}, color={0,0,127}));
  connect(real_sup_p.y[1], chw_sup.p_in)
    annotation (Line(points={{167.9,125},{145,125}}, color={0,0,127}));
  connect(real_ret_p.y[1], chw_ret.p_in) annotation (Line(points={{167.9,59},{
          156.95,59},{156.95,75},{145,75}}, color={0,0,127}));
  connect(hz_1.y[1], chwp_1.y) annotation (Line(points={{-197,-246},{-197,40.8},
          {-80,40.8}}, color={0,0,127}));
  annotation (
    Diagram(coordinateSystem(extent={{-360,-340},{220,200}}), graphics={
                                  Rectangle(
          extent={{220,200},{100,-340}},
          lineColor={28,108,200},
          fillColor={175,175,175},
          fillPattern=FillPattern.Solid), Text(
          extent={{92,198},{192,164}},
          textColor={0,0,0},
          textString="Boundary
Conditions"),                     Rectangle(
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
end Model_0503;
