model tongwei_shuili_balance_v5
  Buildings.Fluid.Movers.SpeedControlled_y chwp_1(
    redeclare package Medium = Buildings.Media.Water,
    redeclare
      Buildings.Fluid.Movers.Data.Pumps.Wilo.CronolineIL80slash220dash4slash4
      per(
      pressure(V_flow={0, 0.050,0.100,0.150,0.200,0.250}, dp={161000, 153000,140000,
            125000,100000,66000}),
      power(V_flow={0,0.050,0.100,0.150,0.200,0.250}, P={13726,17680,20664,22976,24394,23872})),
    addPowerToMedium=true,
    use_inputFilter=true)
    annotation (Placement(transformation(extent={{-14,28},{-32,10}})));
  Buildings.Fluid.FixedResistances.Junction jun_1(
    redeclare package Medium = Buildings.Media.Water,
    m_flow_nominal={166,-111,-55},
    dp_nominal={0,0,0})         annotation (Placement(transformation(
        extent={{8,8},{-8,-8}},
        rotation=90,
        origin={18,20})));
  Buildings.Fluid.FixedResistances.Junction jun_2(
    redeclare package Medium = Buildings.Media.Water,
    m_flow_nominal={166,-111,-55},
    dp_nominal={0,0,0}) annotation (Placement(transformation(
        extent={{8,8},{-8,-8}},
        rotation=90,
        origin={18,-12})));
  Buildings.Fluid.FixedResistances.Junction jun_3(
    redeclare package Medium = Buildings.Media.Water,
    m_flow_nominal={166,-111,-55},
    dp_nominal={0,0,0}) annotation (Placement(transformation(
        extent={{8,8},{-8,-8}},
        rotation=90,
        origin={18,-48})));
  Buildings.Fluid.FixedResistances.Junction jun_4(
    redeclare package Medium = Buildings.Media.Water,
    m_flow_nominal={166,-111,-55},
    dp_nominal={0,0,0}) annotation (Placement(transformation(
        extent={{8,8},{-8,-8}},
        rotation=90,
        origin={18,-82})));
  Buildings.Fluid.FixedResistances.Junction jun_5(
    redeclare package Medium = Buildings.Media.Water,
    m_flow_nominal={166,-111,-55},
    dp_nominal={0,0,0}) annotation (Placement(transformation(
        extent={{8,8},{-8,-8}},
        rotation=90,
        origin={18,-114})));
  Buildings.Fluid.FixedResistances.Junction jun_6(
    redeclare package Medium = Buildings.Media.Water,
    m_flow_nominal={5000,1000,-6000},
    dp_nominal={0,0,0})      annotation (Placement(transformation(
        extent={{8,8},{-8,-8}},
        rotation=270,
        origin={-144,18})));
  Buildings.Fluid.FixedResistances.Junction jun_7(
    redeclare package Medium = Buildings.Media.Water,
    m_flow_nominal={4000,1000,-5000},
    dp_nominal={0,0,0})      annotation (Placement(transformation(
        extent={{8,8},{-8,-8}},
        rotation=270,
        origin={-146,-18})));
  Buildings.Fluid.FixedResistances.Junction jun_8(
    redeclare package Medium = Buildings.Media.Water,
    m_flow_nominal={3000,1000,-4000},
    dp_nominal={0,0,0})      annotation (Placement(transformation(
        extent={{8,8},{-8,-8}},
        rotation=270,
        origin={-146,-46})));
  Buildings.Fluid.FixedResistances.Junction jun_9(
    redeclare package Medium = Buildings.Media.Water,
    m_flow_nominal={2000,1000,-3000},
    dp_nominal={0,0,0})      annotation (Placement(transformation(
        extent={{8,8},{-8,-8}},
        rotation=270,
        origin={-148,-76})));
  Buildings.Fluid.FixedResistances.Junction jun_10(
    redeclare package Medium = Buildings.Media.Water,
    m_flow_nominal={1000,1000,-2000},
    dp_nominal={0,0,0})      annotation (Placement(transformation(
        extent={{8,8},{-8,-8}},
        rotation=270,
        origin={-148,-110})));
  Buildings.Fluid.Movers.SpeedControlled_y chwp_12(
    redeclare package Medium = Buildings.Media.Water,
    redeclare
      Buildings.Fluid.Movers.Data.Pumps.Wilo.CronolineIL80slash220dash4slash4
      per(
      pressure(V_flow={0,0.050,0.100,0.150,0.200,0.250,0.300,0.350,0.400,0.450, 0.500, 0.550}, dp={
            520000, 514000,502000,487000,471000,452000,432000,407000,377000,
            338000, 289000, 223000}),
      use_powerCharacteristic=true,
      power(V_flow={0,0.05,0.1,0.15,0.2,0.25,0.3,0.35,0.4,0.45, 0.5, 0.55}, P={175985,
            179714,182696,184934,187171,188662,190153,190899, 189408, 184188, 173002, 147649})),
    addPowerToMedium=true,
    use_inputFilter=true) annotation (Placement(transformation(
        extent={{9,9},{-9,-9}},
        rotation=180,
        origin={-85,423})));
  Buildings.Fluid.FixedResistances.Junction jun_11(
    redeclare package Medium = Buildings.Media.Water,
    m_flow_nominal={5000,-4000,-1000},
    dp_nominal={0,0,0})      annotation (Placement(transformation(
        extent={{8,8},{-8,-8}},
        rotation=270,
        origin={-144,290})));
  Buildings.Fluid.FixedResistances.Junction jun_12(
    redeclare package Medium = Buildings.Media.Water,
    m_flow_nominal={4000,-3000,-1000},
    dp_nominal={0,0,0})      annotation (Placement(transformation(
        extent={{8,8},{-8,-8}},
        rotation=270,
        origin={-144,322})));
  Buildings.Fluid.FixedResistances.Junction jun_13(
    redeclare package Medium = Buildings.Media.Water,
    m_flow_nominal={3000,-2000,-1000},
    dp_nominal={0,0,0})      annotation (Placement(transformation(
        extent={{8,8},{-8,-8}},
        rotation=270,
        origin={-144,358})));
  Buildings.Fluid.FixedResistances.Junction jun_14(
    redeclare package Medium = Buildings.Media.Water,
    m_flow_nominal={2000,-1000,-1000},
    dp_nominal={0,0,0})      annotation (Placement(transformation(
        extent={{8,8},{-8,-8}},
        rotation=270,
        origin={-144,396})));
  Buildings.Fluid.FixedResistances.Junction jun_15(
    redeclare package Medium = Buildings.Media.Water,
    m_flow_nominal={4000,-5000,1000},
    dp_nominal={0,0,0}) annotation (Placement(transformation(
        extent={{8,8},{-8,-8}},
        rotation=90,
        origin={6,290})));
  Buildings.Fluid.FixedResistances.Junction jun_16(
    redeclare package Medium = Buildings.Media.Water,
    m_flow_nominal={3000,-4000,1000},
    dp_nominal={0,0,0}) annotation (Placement(transformation(
        extent={{8,8},{-8,-8}},
        rotation=90,
        origin={8,324})));
  Buildings.Fluid.FixedResistances.Junction jun_17(
    redeclare package Medium = Buildings.Media.Water,
    m_flow_nominal={2000,-3000,1000},
    dp_nominal={0,0,0}) annotation (Placement(transformation(
        extent={{8,8},{-8,-8}},
        rotation=90,
        origin={8,360})));
  Buildings.Fluid.FixedResistances.Junction jun_18(
    redeclare package Medium = Buildings.Media.Water,
    m_flow_nominal={1000,-2000,1000},
    dp_nominal={0,0,0}) annotation (Placement(transformation(
        extent={{8,8},{-8,-8}},
        rotation=90,
        origin={8,394})));
  Buildings.Fluid.FixedResistances.Pipe chiller_5(
    redeclare package Medium = Buildings.Media.Water,
    energyDynamics=Modelica.Fluid.Types.Dynamics.SteadyState,
    massDynamics=Modelica.Fluid.Types.Dynamics.SteadyState,
    T_start=286.65,
    allowFlowReversal=false,
    m_flow_nominal=prim_pipe_m_nominal,
    thicknessIns=0.5,
    lambdaIns=0.5,
    length=prim_pipe_len,
    v_nominal=prim_pipe_v_nominal,
    roughness=prim_pipe_roughness)
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},
        rotation=180,
        origin={-96,-110})));

  Buildings.Fluid.FixedResistances.Junction jun_19(
    redeclare package Medium = Buildings.Media.Water,
    m_flow_nominal={5000,-6000,1000},
    dp_nominal={0,0,0}) annotation (Placement(transformation(
        extent={{8,8},{-8,-8}},
        rotation=90,
        origin={18,116})));
  Buildings.Fluid.FixedResistances.Junction jun_20(
    redeclare package Medium = Buildings.Media.Water,
    m_flow_nominal={6000,-5000,-1000},
    dp_nominal={0,0,0})      annotation (Placement(transformation(
        extent={{8,8},{-8,-8}},
        rotation=270,
        origin={-146,118})));
  Buildings.Fluid.FixedResistances.Pipe chwp_12_pipe(
    redeclare package Medium = Buildings.Media.Water,
    energyDynamics=Modelica.Fluid.Types.Dynamics.SteadyState,
    massDynamics=Modelica.Fluid.Types.Dynamics.SteadyState,
    T_start=286.65,
    allowFlowReversal=true,
    m_flow_nominal=secd_pipe_m_nominal,
    thicknessIns=secd_pipe_thickness,
    lambdaIns=0.1,
    length=secd_pipe_len,
    v_nominal=secd_pipe_v_nominal,
    roughness=secd_pipe_roughness) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={-36,424})));

  Buildings.Fluid.FixedResistances.Pipe secd_sup_pipe(
    redeclare package Medium = Buildings.Media.Water,
    energyDynamics=Modelica.Fluid.Types.Dynamics.SteadyState,
    massDynamics=Modelica.Fluid.Types.Dynamics.SteadyState,
    T_start=286.65,
    allowFlowReversal=true,
    m_flow_nominal=3100,
    thicknessIns=0.02,
    lambdaIns=0.1,
    diameter=1.2,
    length=50,
    v_nominal=0.13,
    roughness=2.5e-5) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={100,276})));
  Buildings.Fluid.FixedResistances.Pipe prim_sup_pipe(
    redeclare package Medium = Buildings.Media.Water,
    energyDynamics=Modelica.Fluid.Types.Dynamics.SteadyState,
    massDynamics=Modelica.Fluid.Types.Dynamics.SteadyState,
    T_start=286.65,
    allowFlowReversal=true,
    m_flow_nominal=3366,
    thicknessIns=0.02,
    lambdaIns=0.1,
    length=5,
    v_nominal=1,
    roughness=2.5e-5) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={-144,60})));
  Buildings.Fluid.FixedResistances.Pipe prim_ret_pipe(
    redeclare package Medium = Buildings.Media.Water,
    energyDynamics=Modelica.Fluid.Types.Dynamics.SteadyState,
    massDynamics=Modelica.Fluid.Types.Dynamics.SteadyState,
    T_start=286.65,
    allowFlowReversal=true,
    m_flow_nominal=3366,
    thicknessIns=0.02,
    lambdaIns=0.1,
    length=5,
    v_nominal=1,
    roughness=2.5e-5) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={18,66})));
 Buildings.Fluid.FixedResistances.PressureDrop bypass_pipe(
    redeclare package Medium = Buildings.Media.Water,
    m_flow_nominal=bypass_m_nominal,
    dp_nominal=bypass_dp_nominal)
                   annotation (Placement(transformation(
        extent={{-12,-12},{12,12}},
        rotation=0,
        origin={-58,118})));
  Buildings.Fluid.Movers.SpeedControlled_y chwp_2(
    redeclare package Medium = Buildings.Media.Water,
    redeclare
      Buildings.Fluid.Movers.Data.Pumps.Wilo.CronolineIL80slash220dash4slash4
      per(
      pressure(V_flow={0,0.050,0.100,0.150,0.200,0.250}, dp={161000,153000,140000,
            125000,100000,66000}),
      power(V_flow={0,0.050,0.100,0.150,0.200,0.250}, P={13726,17680,20664,22976,24394,23872})),
    addPowerToMedium=true,
    use_inputFilter=true)
    annotation (Placement(transformation(extent={{-14,-4},{-32,-22}})));
  Buildings.Fluid.Movers.SpeedControlled_y chwp_3(
    redeclare package Medium = Buildings.Media.Water,
    redeclare
      Buildings.Fluid.Movers.Data.Pumps.Wilo.CronolineIL80slash220dash4slash4
      per(
      pressure(V_flow={0,0.050,0.100,0.150,0.200,0.250}, dp={161000,153000,140000,
            125000,100000,66000}),
      power(V_flow={0,0.050,0.100,0.150,0.200,0.250}, P={13726,17680,20664,22976,24394,23872})),
    addPowerToMedium=true,
    use_inputFilter=true)
    annotation (Placement(transformation(extent={{-16,-36},{-34,-54}})));
  Buildings.Fluid.Movers.SpeedControlled_y chwp_4(
    redeclare package Medium = Buildings.Media.Water,
    redeclare
      Buildings.Fluid.Movers.Data.Pumps.Wilo.CronolineIL80slash220dash4slash4
      per(
      pressure(V_flow={0,0.050,0.100,0.150,0.200,0.250}, dp={161000,153000,140000,
            125000,100000,66000}),
      power(V_flow={0,0.050,0.100,0.150,0.200,0.250}, P={13726,17680,20664,22976,24394,23872})),
    addPowerToMedium=true,
    use_inputFilter=true)
    annotation (Placement(transformation(extent={{-16,-72},{-34,-90}})));
  Buildings.Fluid.Movers.SpeedControlled_y chwp_5(
    redeclare package Medium = Buildings.Media.Water,
    redeclare
      Buildings.Fluid.Movers.Data.Pumps.Wilo.CronolineIL80slash220dash4slash4
      per(
      pressure(V_flow={0,0.050,0.100,0.150,0.200,0.250}, dp={161000,153000,140000,
            125000,100000,66000}),
      power(V_flow={0,0.050,0.100,0.150,0.200,0.250}, P={13726,17680,20664,22976,24394,23872})),
    addPowerToMedium=true,
    use_inputFilter=true)
    annotation (Placement(transformation(extent={{-16,-100},{-34,-118}})));
  Buildings.Fluid.Movers.SpeedControlled_y chwp_6(
    redeclare package Medium = Buildings.Media.Water,
    redeclare
      Buildings.Fluid.Movers.Data.Pumps.Wilo.CronolineIL80slash220dash4slash4
      per(
      pressure(V_flow={0,0.050,0.100,0.150,0.200,0.250}, dp={161000,153000,140000,
            125000,100000,66000}),
      power(V_flow={0,0.050,0.100,0.150,0.200,0.250}, P={13726,17680,20664,22976,24394,23872})),
    addPowerToMedium=true,
    use_inputFilter=true)
    annotation (Placement(transformation(extent={{-16,-132},{-34,-150}})));
  Buildings.Fluid.Movers.SpeedControlled_y chwp_13(
    redeclare package Medium = Buildings.Media.Water,
    redeclare
      Buildings.Fluid.Movers.Data.Pumps.Wilo.CronolineIL80slash220dash4slash4
      per(
      pressure(V_flow={0,0.050,0.100,0.150,0.200,0.250,0.300,0.350,0.400,0.450, 0.500, 0.550}, dp={
            520000, 514000,502000,487000,471000,452000,432000,407000,377000,
            338000, 289000, 223000}),
      use_powerCharacteristic=true,
      power(V_flow={0,0.05,0.1,0.15,0.2,0.25,0.3,0.35,0.4,0.45, 0.5, 0.55}, P={175985,
            179714,182696,184934,187171,188662,190153,190899, 189408, 184188, 173002, 147649})),
    addPowerToMedium=true,
    use_inputFilter=true) annotation (Placement(transformation(
        extent={{9,9},{-9,-9}},
        rotation=180,
        origin={-85,395})));
  Buildings.Fluid.Movers.SpeedControlled_y chwp_14(
    redeclare package Medium = Buildings.Media.Water,
    redeclare
      Buildings.Fluid.Movers.Data.Pumps.Wilo.CronolineIL80slash220dash4slash4
      per(
      pressure(V_flow={0,0.050,0.100,0.150,0.200,0.250,0.300,0.350,0.400,0.450, 0.500, 0.550}, dp={
            520000, 514000,502000,487000,471000,452000,432000,407000,377000,
            338000, 289000, 223000}),
      use_powerCharacteristic=true,
      power(V_flow={0,0.05,0.1,0.15,0.2,0.25,0.3,0.35,0.4,0.45, 0.5, 0.55}, P={175985,
            179714,182696,184934,187171,188662,190153,190899, 189408, 184188, 173002, 147649})),
    addPowerToMedium=true,
    use_inputFilter=true) annotation (Placement(transformation(
        extent={{9,9},{-9,-9}},
        rotation=180,
        origin={-83,359})));
  Buildings.Fluid.Movers.SpeedControlled_y chwp_15(
    redeclare package Medium = Buildings.Media.Water,
    redeclare
      Buildings.Fluid.Movers.Data.Pumps.Wilo.CronolineIL80slash220dash4slash4
      per(
      pressure(V_flow={0,0.050,0.100,0.150,0.200,0.250,0.300,0.350,0.400,0.450, 0.500, 0.550}, dp={
            520000, 514000,502000,487000,471000,452000,432000,407000,377000,
            338000, 289000, 223000}),
      use_powerCharacteristic=true,
      power(V_flow={0,0.05,0.1,0.15,0.2,0.25,0.3,0.35,0.4,0.45, 0.5, 0.55}, P={175985,
            179714,182696,184934,187171,188662,190153,190899, 189408, 184188, 173002, 147649})),
    addPowerToMedium=true,
    use_inputFilter=true) annotation (Placement(transformation(
        extent={{9,9},{-9,-9}},
        rotation=180,
        origin={-83,325})));
  Buildings.Fluid.Movers.SpeedControlled_y chwp_16(
    redeclare package Medium = Buildings.Media.Water,
    redeclare
      Buildings.Fluid.Movers.Data.Pumps.Wilo.CronolineIL80slash220dash4slash4
      per(
      pressure(V_flow={0,0.050,0.100,0.150,0.200,0.250,0.300,0.350,0.400,0.450, 0.500, 0.550}, dp={
            520000, 514000,502000,487000,471000,452000,432000,407000,377000,
            338000, 289000, 223000}),
      use_powerCharacteristic=true,
      power(V_flow={0,0.05,0.1,0.15,0.2,0.25,0.3,0.35,0.4,0.45, 0.5, 0.55}, P={175985,
            179714,182696,184934,187171,188662,190153,190899, 189408, 184188, 173002, 147649})),
    addPowerToMedium=true,
    use_inputFilter=true) annotation (Placement(transformation(
        extent={{9,9},{-9,-9}},
        rotation=180,
        origin={-83,295})));
  Buildings.Fluid.FixedResistances.Pipe chiller_1(
    redeclare package Medium = Buildings.Media.Water,
    energyDynamics=Modelica.Fluid.Types.Dynamics.SteadyState,
    massDynamics=Modelica.Fluid.Types.Dynamics.SteadyState,
    T_start=286.65,
    allowFlowReversal=false,
    m_flow_nominal=prim_pipe_m_nominal,
    thicknessIns=0.5,
    lambdaIns=0.5,
    length=prim_pipe_len,
    v_nominal=prim_pipe_v_nominal,
    roughness=prim_pipe_roughness)
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},
        rotation=180,
        origin={-94,22})));

  Buildings.Fluid.FixedResistances.Pipe chiller_2(
    redeclare package Medium = Buildings.Media.Water,
    energyDynamics=Modelica.Fluid.Types.Dynamics.SteadyState,
    massDynamics=Modelica.Fluid.Types.Dynamics.SteadyState,
    T_start=286.65,
    allowFlowReversal=false,
    m_flow_nominal=prim_pipe_m_nominal,
    thicknessIns=0.5,
    lambdaIns=0.5,
    length=prim_pipe_len,
    v_nominal=prim_pipe_v_nominal,
    roughness=prim_pipe_roughness)
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},
        rotation=180,
        origin={-92,-16})));

  Buildings.Fluid.FixedResistances.Pipe chiller_3(
    redeclare package Medium = Buildings.Media.Water,
    energyDynamics=Modelica.Fluid.Types.Dynamics.SteadyState,
    massDynamics=Modelica.Fluid.Types.Dynamics.SteadyState,
    T_start=286.65,
    allowFlowReversal=false,
    m_flow_nominal=prim_pipe_m_nominal,
    thicknessIns=0.5,
    lambdaIns=0.5,
    length=prim_pipe_len,
    v_nominal=prim_pipe_v_nominal,
    roughness=prim_pipe_roughness)
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},
        rotation=180,
        origin={-94,-48})));

  Buildings.Fluid.FixedResistances.Pipe chiller_4(
    redeclare package Medium = Buildings.Media.Water,
    energyDynamics=Modelica.Fluid.Types.Dynamics.SteadyState,
    massDynamics=Modelica.Fluid.Types.Dynamics.SteadyState,
    T_start=286.65,
    allowFlowReversal=false,
    m_flow_nominal=prim_pipe_m_nominal,
    thicknessIns=0.5,
    lambdaIns=0.5,
    length=prim_pipe_len,
    v_nominal=prim_pipe_v_nominal,
    roughness=prim_pipe_roughness)
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},
        rotation=180,
        origin={-96,-76})));

  Buildings.Fluid.FixedResistances.Pipe chiller_6(
    redeclare package Medium = Buildings.Media.Water,
    energyDynamics=Modelica.Fluid.Types.Dynamics.SteadyState,
    massDynamics=Modelica.Fluid.Types.Dynamics.SteadyState,
    T_start=286.65,
    allowFlowReversal=false,
    m_flow_nominal=prim_pipe_m_nominal,
    thicknessIns=0.5,
    lambdaIns=0.5,
    length=prim_pipe_len,
    v_nominal=prim_pipe_v_nominal,
    roughness=prim_pipe_roughness)
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},
        rotation=180,
        origin={-94,-142})));

  Buildings.Fluid.FixedResistances.Pipe secd_ret_pipe(
    redeclare package Medium = Buildings.Media.Water,
    energyDynamics=Modelica.Fluid.Types.Dynamics.SteadyState,
    massDynamics=Modelica.Fluid.Types.Dynamics.SteadyState,
    T_start=286.65,
    allowFlowReversal=true,
    m_flow_nominal=3100,
    thicknessIns=0.02,
    lambdaIns=0.1,
    length=5,
    v_nominal=1,
    roughness=2.5e-5) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={-144,158})));
  Buildings.Fluid.FixedResistances.Pipe chw_ret_pipe(
    redeclare package Medium = Buildings.Media.Water,
    energyDynamics=Modelica.Fluid.Types.Dynamics.SteadyState,
    massDynamics=Modelica.Fluid.Types.Dynamics.SteadyState,
    T_start=286.65,
    allowFlowReversal=true,
    m_flow_nominal=3100,
    thicknessIns=0.02,
    lambdaIns=0.1,
    length=5,
    v_nominal=1,
    roughness=2.5e-5) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={104,130})));
  Buildings.Fluid.FixedResistances.Pipe chwp_13_pipe(
    redeclare package Medium = Buildings.Media.Water,
    energyDynamics=Modelica.Fluid.Types.Dynamics.SteadyState,
    massDynamics=Modelica.Fluid.Types.Dynamics.SteadyState,
    T_start=286.65,
    allowFlowReversal=true,
    m_flow_nominal=secd_pipe_m_nominal,
    thicknessIns=secd_pipe_thickness,
    lambdaIns=0.1,
    length=secd_pipe_len,
    v_nominal=secd_pipe_v_nominal,
    roughness=secd_pipe_roughness) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={-36,394})));

  Buildings.Fluid.FixedResistances.Pipe chwp_14_pipe(
    redeclare package Medium = Buildings.Media.Water,
    energyDynamics=Modelica.Fluid.Types.Dynamics.SteadyState,
    massDynamics=Modelica.Fluid.Types.Dynamics.SteadyState,
    T_start=286.65,
    allowFlowReversal=true,
    m_flow_nominal=secd_pipe_m_nominal,
    thicknessIns=secd_pipe_thickness,
    lambdaIns=0.1,
    length=secd_pipe_len,
    v_nominal=secd_pipe_v_nominal,
    roughness=secd_pipe_roughness) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={-36,364})));

  Buildings.Fluid.FixedResistances.Pipe chwp_15_pipe(
    redeclare package Medium = Buildings.Media.Water,
    energyDynamics=Modelica.Fluid.Types.Dynamics.SteadyState,
    massDynamics=Modelica.Fluid.Types.Dynamics.SteadyState,
    T_start=286.65,
    allowFlowReversal=true,
    m_flow_nominal=secd_pipe_m_nominal,
    thicknessIns=secd_pipe_thickness,
    lambdaIns=0.1,
    length=secd_pipe_len,
    v_nominal=secd_pipe_v_nominal,
    roughness=secd_pipe_roughness) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={-36,324})));

  Buildings.Fluid.FixedResistances.Pipe chwp_16_pipe(
    redeclare package Medium = Buildings.Media.Water,
    energyDynamics=Modelica.Fluid.Types.Dynamics.SteadyState,
    massDynamics=Modelica.Fluid.Types.Dynamics.SteadyState,
    T_start=286.65,
    allowFlowReversal=true,
    m_flow_nominal=secd_pipe_m_nominal,
    thicknessIns=secd_pipe_thickness,
    lambdaIns=0.1,
    length=secd_pipe_len,
    v_nominal=secd_pipe_v_nominal,
    roughness=secd_pipe_roughness) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={-38,292})));

  Buildings.Fluid.FixedResistances.Pipe chiller_7(
    redeclare package Medium = Buildings.Media.Water,
    energyDynamics=Modelica.Fluid.Types.Dynamics.SteadyState,
    massDynamics=Modelica.Fluid.Types.Dynamics.SteadyState,
    T_start=286.65,
    allowFlowReversal=false,
    m_flow_nominal=prim_pipe_m_nominal,
    thicknessIns=0.5,
    lambdaIns=0.5,
    length=prim_pipe_len,
    v_nominal=prim_pipe_v_nominal,
    roughness=prim_pipe_roughness)
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},
        rotation=180,
        origin={-96,-170})));

  Buildings.Fluid.FixedResistances.Pipe chiller_8(
    redeclare package Medium = Buildings.Media.Water,
    energyDynamics=Modelica.Fluid.Types.Dynamics.SteadyState,
    massDynamics=Modelica.Fluid.Types.Dynamics.SteadyState,
    T_start=286.65,
    allowFlowReversal=false,
    m_flow_nominal=prim_pipe_m_nominal,
    thicknessIns=0.5,
    lambdaIns=0.5,
    length=prim_pipe_len,
    v_nominal=prim_pipe_v_nominal,
    roughness=prim_pipe_roughness)
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},
        rotation=180,
        origin={-96,-202})));

  Buildings.Fluid.FixedResistances.Pipe chiller_9(
    redeclare package Medium = Buildings.Media.Water,
    energyDynamics=Modelica.Fluid.Types.Dynamics.SteadyState,
    massDynamics=Modelica.Fluid.Types.Dynamics.SteadyState,
    T_start=286.65,
    allowFlowReversal=false,
    m_flow_nominal=prim_pipe_m_nominal,
    thicknessIns=0.5,
    lambdaIns=0.5,
    length=prim_pipe_len,
    v_nominal=prim_pipe_v_nominal,
    roughness=prim_pipe_roughness)
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},
        rotation=180,
        origin={-96,-228})));

  Buildings.Fluid.FixedResistances.Pipe chiller_10(
    redeclare package Medium = Buildings.Media.Water,
    energyDynamics=Modelica.Fluid.Types.Dynamics.SteadyState,
    massDynamics=Modelica.Fluid.Types.Dynamics.SteadyState,
    T_start=286.65,
    allowFlowReversal=false,
    m_flow_nominal=prim_pipe_m_nominal,
    thicknessIns=0.5,
    lambdaIns=0.5,
    length=prim_pipe_len,
    v_nominal=prim_pipe_v_nominal,
    roughness=prim_pipe_roughness)
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},
        rotation=180,
        origin={-96,-256})));

  Buildings.Fluid.FixedResistances.Pipe chiller_11(
    redeclare package Medium = Buildings.Media.Water,
    energyDynamics=Modelica.Fluid.Types.Dynamics.SteadyState,
    massDynamics=Modelica.Fluid.Types.Dynamics.SteadyState,
    T_start=286.65,
    allowFlowReversal=false,
    m_flow_nominal=prim_pipe_m_nominal,
    thicknessIns=0.5,
    lambdaIns=0.5,
    length=prim_pipe_len,
    v_nominal=prim_pipe_v_nominal,
    roughness=prim_pipe_roughness)
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},
        rotation=180,
        origin={-110,-334})));

  Buildings.Fluid.Movers.SpeedControlled_y chwp_7(
    redeclare package Medium = Buildings.Media.Water,
    redeclare
      Buildings.Fluid.Movers.Data.Pumps.Wilo.CronolineIL80slash220dash4slash4
      per(
      pressure(V_flow={0,0.050,0.100,0.150,0.200,0.250}, dp={161000,153000,140000,
            125000,100000,66000}),
      power(V_flow={0,0.050,0.100,0.150,0.200,0.250}, P={13726,17680,20664,22976,24394,23872})),
    addPowerToMedium=true,
    use_inputFilter=true)
    annotation (Placement(transformation(extent={{-16,-164},{-34,-182}})));
  Buildings.Fluid.Movers.SpeedControlled_y chwp_8(
    redeclare package Medium = Buildings.Media.Water,
    redeclare
      Buildings.Fluid.Movers.Data.Pumps.Wilo.CronolineIL80slash220dash4slash4
      per(
      pressure(V_flow={0,0.050,0.100,0.150,0.200,0.250}, dp={161000,153000,140000,
            125000,100000,66000}),
      power(V_flow={0,0.050,0.100,0.150,0.200,0.250}, P={13726,17680,20664,22976,24394,23872})),
    addPowerToMedium=true,
    use_inputFilter=true)
    annotation (Placement(transformation(extent={{-18,-194},{-36,-212}})));
  Buildings.Fluid.Movers.SpeedControlled_y chwp_9(
    redeclare package Medium = Buildings.Media.Water,
    redeclare
      Buildings.Fluid.Movers.Data.Pumps.Wilo.CronolineIL80slash220dash4slash4
      per(
      pressure(V_flow={0,0.050,0.100,0.150,0.200,0.250}, dp={161000,153000,140000,
            125000,100000,66000}),
      power(V_flow={0,0.050,0.100,0.150,0.200,0.250}, P={13726,17680,20664,22976,24394,23872})),
    addPowerToMedium=true,
    use_inputFilter=true)
    annotation (Placement(transformation(extent={{-18,-222},{-36,-240}})));
  Buildings.Fluid.Movers.SpeedControlled_y chwp_10(
    redeclare package Medium = Buildings.Media.Water,
    redeclare
      Buildings.Fluid.Movers.Data.Pumps.Wilo.CronolineIL80slash220dash4slash4
      per(
      pressure(V_flow={0,0.050,0.100,0.150,0.200,0.250}, dp={161000,153000,140000,
            125000,100000,66000}),
      power(V_flow={0,0.050,0.100,0.150,0.200,0.250}, P={13726,17680,20664,22976,24394,23872})),
    addPowerToMedium=true,
    use_inputFilter=true)
    annotation (Placement(transformation(extent={{-18,-250},{-36,-268}})));
  Buildings.Fluid.Movers.SpeedControlled_y chwp_11(
    redeclare package Medium = Buildings.Media.Water,
    redeclare
      Buildings.Fluid.Movers.Data.Pumps.Wilo.CronolineIL80slash220dash4slash4
      per(
      pressure(V_flow={0,0.050,0.100,0.150,0.200,0.250}, dp={161000,153000,140000,
            125000,100000,66000}),
      power(V_flow={0,0.050,0.100,0.150,0.200,0.250}, P={13726,17680,20664,22976,24394,23872})),
    addPowerToMedium=true,
    use_inputFilter=true)
    annotation (Placement(transformation(extent={{-8,-328},{-26,-346}})));
  Buildings.Fluid.FixedResistances.Junction jun_21(
    redeclare package Medium = Buildings.Media.Water,
    m_flow_nominal={1000,1000,-2000},
    dp_nominal={0,0,0})      annotation (Placement(transformation(
        extent={{8,8},{-8,-8}},
        rotation=270,
        origin={-148,-142})));
  Buildings.Fluid.FixedResistances.Junction jun_22(
    redeclare package Medium = Buildings.Media.Water,
    m_flow_nominal={1000,1000,-2000},
    dp_nominal={0,0,0})      annotation (Placement(transformation(
        extent={{8,8},{-8,-8}},
        rotation=270,
        origin={-148,-174})));
  Buildings.Fluid.FixedResistances.Junction jun_23(
    redeclare package Medium = Buildings.Media.Water,
    m_flow_nominal={1000,1000,-2000},
    dp_nominal={0,0,0})      annotation (Placement(transformation(
        extent={{8,8},{-8,-8}},
        rotation=270,
        origin={-148,-202})));
  Buildings.Fluid.FixedResistances.Junction jun_24(
    redeclare package Medium = Buildings.Media.Water,
    m_flow_nominal={1000,1000,-2000},
    dp_nominal={0,0,0})      annotation (Placement(transformation(
        extent={{8,8},{-8,-8}},
        rotation=270,
        origin={-148,-228})));
  Buildings.Fluid.FixedResistances.Junction jun_25(
    redeclare package Medium = Buildings.Media.Water,
    m_flow_nominal={1000,1000,-2000},
    dp_nominal={0,0,0})      annotation (Placement(transformation(
        extent={{8,8},{-8,-8}},
        rotation=270,
        origin={-148,-256})));
  Buildings.Fluid.FixedResistances.Junction jun_26(
    redeclare package Medium = Buildings.Media.Water,
    m_flow_nominal={166,-111,-55},
    dp_nominal={0,0,0}) annotation (Placement(transformation(
        extent={{8,8},{-8,-8}},
        rotation=90,
        origin={18,-142})));
  Buildings.Fluid.FixedResistances.Junction jun_27(
    redeclare package Medium = Buildings.Media.Water,
    m_flow_nominal={166,-111,-55},
    dp_nominal={0,0,0}) annotation (Placement(transformation(
        extent={{8,8},{-8,-8}},
        rotation=90,
        origin={18,-172})));
  Buildings.Fluid.FixedResistances.Junction jun_28(
    redeclare package Medium = Buildings.Media.Water,
    m_flow_nominal={166,-111,-55},
    dp_nominal={0,0,0}) annotation (Placement(transformation(
        extent={{8,8},{-8,-8}},
        rotation=90,
        origin={18,-202})));
  Buildings.Fluid.FixedResistances.Junction jun_29(
    redeclare package Medium = Buildings.Media.Water,
    m_flow_nominal={166,-111,-55},
    dp_nominal={0,0,0}) annotation (Placement(transformation(
        extent={{8,8},{-8,-8}},
        rotation=90,
        origin={20,-230})));
  Buildings.Fluid.FixedResistances.Junction jun_30(
    redeclare package Medium = Buildings.Media.Water,
    m_flow_nominal={166,-111,-55},
    dp_nominal={0,0,0}) annotation (Placement(transformation(
        extent={{8,8},{-8,-8}},
        rotation=90,
        origin={20,-258})));
  Modelica.Blocks.Sources.Constant chwp1_speed_const(k=1)
    annotation (Placement(transformation(extent={{-248,42},{-228,62}})));
  Modelica.Blocks.Sources.Constant chwp2_speed_const(k=1)
    annotation (Placement(transformation(extent={{-246,6},{-226,26}})));
  Modelica.Blocks.Sources.Constant chwp3_speed_const(k=1)
    annotation (Placement(transformation(extent={{-246,-32},{-226,-12}})));
  Modelica.Blocks.Sources.Constant chwp4_speed_const(k=1)
    annotation (Placement(transformation(extent={{-244,-68},{-224,-48}})));
  Modelica.Blocks.Sources.Constant chwp5_speed_const(k=1)
    annotation (Placement(transformation(extent={{-244,-106},{-224,-86}})));
  Modelica.Blocks.Sources.Constant chwp6_speed_const(k=1)
    annotation (Placement(transformation(extent={{-242,-144},{-222,-124}})));
  Modelica.Blocks.Sources.Constant chwp7_speed_const(k=1)
    annotation (Placement(transformation(extent={{-244,-176},{-224,-156}})));
  Modelica.Blocks.Sources.Constant chwp8_speed_const(k=1)
    annotation (Placement(transformation(extent={{-244,-208},{-224,-188}})));
  Modelica.Blocks.Sources.Constant chwp9_speed_const(k=1)
    annotation (Placement(transformation(extent={{-244,-242},{-224,-222}})));
  Modelica.Blocks.Sources.Constant chwp10_speed_const(k=1)
    annotation (Placement(transformation(extent={{-244,-278},{-224,-258}})));
  Modelica.Blocks.Sources.Constant chwp11_speed_const(k=1)
    annotation (Placement(transformation(extent={{-242,-316},{-222,-296}})));
  Modelica.Blocks.Sources.Constant chwp12_speed_const(k=1)
    annotation (Placement(transformation(extent={{-238,420},{-218,440}})));
  Modelica.Blocks.Sources.Constant chwp13_speed_const(k=1)
    annotation (Placement(transformation(extent={{-238,386},{-218,406}})));
  Modelica.Blocks.Sources.Constant chwp14_speed_const(k=1)
    annotation (Placement(transformation(extent={{-238,350},{-218,370}})));
  Modelica.Blocks.Sources.Constant chwp15_speed_const(k=1)
    annotation (Placement(transformation(extent={{-238,312},{-218,332}})));
  Modelica.Blocks.Sources.Constant chwp16_speed_const(k=1)
    annotation (Placement(transformation(extent={{-238,274},{-218,294}})));
  Buildings.Fluid.Actuators.Valves.TwoWayLinear chwp_12_val(
    redeclare package Medium = Buildings.Media.Water,
    m_flow_nominal=555,
    dpValve_nominal=5000,
    use_inputFilter=true)
    annotation (Placement(transformation(extent={{-128,416},{-108,436}})));
  Buildings.Fluid.Actuators.Valves.TwoWayLinear chwp_13_val(
    redeclare package Medium = Buildings.Media.Water,
    m_flow_nominal=555,
    dpValve_nominal=5000,
    use_inputFilter=true)
    annotation (Placement(transformation(extent={{-124,384},{-104,404}})));
  Buildings.Fluid.Actuators.Valves.TwoWayLinear chwp_14_val(
    redeclare package Medium = Buildings.Media.Water,
    m_flow_nominal=555,
    dpValve_nominal=5000,
    use_inputFilter=true)
    annotation (Placement(transformation(extent={{-122,348},{-102,368}})));
  Buildings.Fluid.Actuators.Valves.TwoWayLinear chwp_15_val(
    redeclare package Medium = Buildings.Media.Water,
    m_flow_nominal=555,
    dpValve_nominal=5000,
    use_inputFilter=true)
    annotation (Placement(transformation(extent={{-120,316},{-100,336}})));
  Buildings.Fluid.Actuators.Valves.TwoWayLinear chwp_16_val(
    redeclare package Medium = Buildings.Media.Water,
    m_flow_nominal=555,
    dpValve_nominal=5000,
    use_inputFilter=true)
    annotation (Placement(transformation(extent={{-122,282},{-102,302}})));
  Buildings.Fluid.Actuators.Valves.TwoWayLinear chwp_1_val(
    redeclare package Medium = Buildings.Media.Water,
    m_flow_nominal=305,
    dpValve_nominal=5000,
    use_inputFilter=true) annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=0,
        origin={-48,20})));
  Buildings.Fluid.Actuators.Valves.TwoWayLinear chwp_2_val(
    redeclare package Medium = Buildings.Media.Water,
    m_flow_nominal=305,
    dpValve_nominal=5000,
    use_inputFilter=true) annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=0,
        origin={-52,-14})));
  Buildings.Fluid.Actuators.Valves.TwoWayLinear chwp_3_val(
    redeclare package Medium = Buildings.Media.Water,
    m_flow_nominal=305,
    dpValve_nominal=5000,
    use_inputFilter=true) annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=0,
        origin={-56,-46})));
  Buildings.Fluid.Actuators.Valves.TwoWayLinear chwp_4_val(
    redeclare package Medium = Buildings.Media.Water,
    m_flow_nominal=305,
    dpValve_nominal=5000,
    use_inputFilter=true) annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=0,
        origin={-48,-82})));
  Buildings.Fluid.Actuators.Valves.TwoWayLinear chwp_5_val(
    redeclare package Medium = Buildings.Media.Water,
    m_flow_nominal=305,
    dpValve_nominal=5000,
    use_inputFilter=true) annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=0,
        origin={-58,-114})));
  Buildings.Fluid.Actuators.Valves.TwoWayLinear chwp_6_val(
    redeclare package Medium = Buildings.Media.Water,
    m_flow_nominal=305,
    dpValve_nominal=5000,
    use_inputFilter=true) annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=0,
        origin={-60,-144})));
  Buildings.Fluid.Actuators.Valves.TwoWayLinear chwp_7_val(
    redeclare package Medium = Buildings.Media.Water,
    m_flow_nominal=305,
    dpValve_nominal=5000,
    use_inputFilter=true) annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=0,
        origin={-64,-178})));
  Buildings.Fluid.Actuators.Valves.TwoWayLinear chwp_8_val(
    redeclare package Medium = Buildings.Media.Water,
    m_flow_nominal=305,
    dpValve_nominal=5000,
    use_inputFilter=true) annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=0,
        origin={-56,-202})));
  Buildings.Fluid.Actuators.Valves.TwoWayLinear chwp_9_val(
    redeclare package Medium = Buildings.Media.Water,
    m_flow_nominal=305,
    dpValve_nominal=5000,
    use_inputFilter=true) annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=0,
        origin={-64,-236})));
  Buildings.Fluid.Actuators.Valves.TwoWayLinear chwp_10_val(
    redeclare package Medium = Buildings.Media.Water,
    m_flow_nominal=305,
    dpValve_nominal=5000,
    use_inputFilter=true) annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=0,
        origin={-60,-264})));
  Buildings.Fluid.Actuators.Valves.TwoWayLinear chwp_11_val(
    redeclare package Medium = Buildings.Media.Water,
    m_flow_nominal=305,
    dpValve_nominal=5000,
    use_inputFilter=true) annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=0,
        origin={-66,-340})));
  Modelica.Blocks.Sources.Constant chwp12_val_pos(k=1)
    annotation (Placement(transformation(extent={{64,432},{44,452}})));
  Modelica.Blocks.Sources.Constant chwp13_val_pos(k=1)
    annotation (Placement(transformation(extent={{68,398},{48,418}})));
  Modelica.Blocks.Sources.Constant chwp14_val_pos(k=1)
    annotation (Placement(transformation(extent={{68,364},{48,384}})));
  Modelica.Blocks.Sources.Constant chwp15_val_pos(k=1)
    annotation (Placement(transformation(extent={{70,330},{50,350}})));
  Modelica.Blocks.Sources.Constant chwp16_val_pos(k=1)
    annotation (Placement(transformation(extent={{68,294},{48,314}})));
  Modelica.Blocks.Sources.Constant chwp1_val_pos(k=1)
    annotation (Placement(transformation(extent={{90,32},{70,52}})));
  Modelica.Blocks.Sources.Constant chwp2_val_pos(k=1)
    annotation (Placement(transformation(extent={{88,-6},{68,14}})));
  Modelica.Blocks.Sources.Constant chwp3_val_pos(k=1)
    annotation (Placement(transformation(extent={{90,-44},{70,-24}})));
  Modelica.Blocks.Sources.Constant chwp4_val_pos(k=1)
    annotation (Placement(transformation(extent={{88,-80},{68,-60}})));
  Modelica.Blocks.Sources.Constant chwp5_val_pos(k=1)
    annotation (Placement(transformation(extent={{88,-118},{68,-98}})));
  Modelica.Blocks.Sources.Constant chwp6_val_pos(k=1)
    annotation (Placement(transformation(extent={{86,-148},{66,-128}})));
  Modelica.Blocks.Sources.Constant chwp7_val_pos(k=1)
    annotation (Placement(transformation(extent={{112,-172},{92,-152}})));
  Modelica.Blocks.Sources.Constant chwp8_val_pos(k=1)
    annotation (Placement(transformation(extent={{82,-198},{62,-178}})));
  Modelica.Blocks.Sources.Constant chwp9_val_pos(k=1)
    annotation (Placement(transformation(extent={{82,-232},{62,-212}})));
  Modelica.Blocks.Sources.Constant chwp10_val_pos(k=1)
    annotation (Placement(transformation(extent={{82,-268},{62,-248}})));
  Modelica.Blocks.Sources.Constant chwp11_val_pos(k=1)
    annotation (Placement(transformation(extent={{84,-336},{64,-316}})));
  Buildings.Fluid.Movers.SpeedControlled_y chwp_17(
    redeclare package Medium = Buildings.Media.Water,
    redeclare
      Buildings.Fluid.Movers.Data.Pumps.Wilo.CronolineIL80slash220dash4slash4
      per(
      pressure(V_flow={0,0.050,0.100,0.150,0.200,0.250,0.300,0.350,0.400,0.450, 0.500, 0.550}, dp={
            520000, 514000,502000,487000,471000,452000,432000,407000,377000,
            338000, 289000, 223000}),
      use_powerCharacteristic=true,
      power(V_flow={0,0.05,0.1,0.15,0.2,0.25,0.3,0.35,0.4,0.45, 0.5, 0.55}, P={175985,
            179714,182696,184934,187171,188662,190153,190899, 189408, 184188, 173002, 147649})),
    addPowerToMedium=true,
    use_inputFilter=true) annotation (Placement(transformation(
        extent={{9,9},{-9,-9}},
        rotation=180,
        origin={-77,249})));
  Buildings.Fluid.Movers.SpeedControlled_y chwp_18(
    redeclare package Medium = Buildings.Media.Water,
    redeclare
      Buildings.Fluid.Movers.Data.Pumps.Wilo.CronolineIL80slash220dash4slash4
      per(
      pressure(V_flow={0,0.050,0.100,0.150,0.200,0.250,0.300,0.350,0.400,0.450, 0.500, 0.550}, dp={
            520000, 514000,502000,487000,471000,452000,432000,407000,377000,
            338000, 289000, 223000}),
      use_powerCharacteristic=true,
      power(V_flow={0,0.05,0.1,0.15,0.2,0.25,0.3,0.35,0.4,0.45, 0.5, 0.55}, P={175985,
            179714,182696,184934,187171,188662,190153,190899, 189408, 184188, 173002, 147649})),
    addPowerToMedium=true,
    use_inputFilter=true) annotation (Placement(transformation(
        extent={{9,9},{-9,-9}},
        rotation=180,
        origin={-81,215})));
  Buildings.Fluid.FixedResistances.Junction jun_31(
    redeclare package Medium = Buildings.Media.Water,
    m_flow_nominal={4000,-5000,1000},
    dp_nominal={0,0,0}) annotation (Placement(transformation(
        extent={{8,8},{-8,-8}},
        rotation=90,
        origin={6,250})));
  Buildings.Fluid.FixedResistances.Junction jun_32(
    redeclare package Medium = Buildings.Media.Water,
    m_flow_nominal={4000,-5000,1000},
    dp_nominal={0,0,0}) annotation (Placement(transformation(
        extent={{8,8},{-8,-8}},
        rotation=90,
        origin={4,216})));
  Buildings.Fluid.FixedResistances.Pipe chwp_17_pipe(
    redeclare package Medium = Buildings.Media.Water,
    energyDynamics=Modelica.Fluid.Types.Dynamics.SteadyState,
    massDynamics=Modelica.Fluid.Types.Dynamics.SteadyState,
    T_start=286.65,
    allowFlowReversal=true,
    m_flow_nominal=secd_pipe_m_nominal,
    thicknessIns=secd_pipe_thickness,
    lambdaIns=0.1,
    length=secd_pipe_len,
    v_nominal=secd_pipe_v_nominal,
    roughness=secd_pipe_roughness) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={-38,250})));

  Buildings.Fluid.FixedResistances.Pipe chwp_18_pipe(
    redeclare package Medium = Buildings.Media.Water,
    energyDynamics=Modelica.Fluid.Types.Dynamics.SteadyState,
    massDynamics=Modelica.Fluid.Types.Dynamics.SteadyState,
    T_start=286.65,
    allowFlowReversal=true,
    m_flow_nominal=secd_pipe_m_nominal,
    thicknessIns=secd_pipe_thickness,
    lambdaIns=0.1,
    length=secd_pipe_len,
    v_nominal=secd_pipe_v_nominal,
    roughness=secd_pipe_roughness) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={-38,214})));

  Buildings.Fluid.Actuators.Valves.TwoWayLinear chwp_17_val(
    redeclare package Medium = Buildings.Media.Water,
    m_flow_nominal=555,
    dpValve_nominal=5000,
    use_inputFilter=true)
    annotation (Placement(transformation(extent={{-124,240},{-104,260}})));
  Buildings.Fluid.Actuators.Valves.TwoWayLinear chwp_18_val(
    redeclare package Medium = Buildings.Media.Water,
    m_flow_nominal=555,
    dpValve_nominal=5000,
    use_inputFilter=true)
    annotation (Placement(transformation(extent={{-126,202},{-106,222}})));
  Buildings.Fluid.FixedResistances.Junction jun_33(
    redeclare package Medium = Buildings.Media.Water,
    m_flow_nominal={5000,-4000,-1000},
    dp_nominal={0,0,0})      annotation (Placement(transformation(
        extent={{8,8},{-8,-8}},
        rotation=270,
        origin={-160,252})));
  Buildings.Fluid.FixedResistances.Junction jun_34(
    redeclare package Medium = Buildings.Media.Water,
    m_flow_nominal={5000,-4000,-1000},
    dp_nominal={0,0,0})      annotation (Placement(transformation(
        extent={{8,8},{-8,-8}},
        rotation=270,
        origin={-158,212})));
  Modelica.Blocks.Sources.Constant chwp17_val_pos(k=1)
    annotation (Placement(transformation(extent={{66,240},{46,260}})));
  Modelica.Blocks.Sources.Constant chwp18_val_pos(k=1)
    annotation (Placement(transformation(extent={{68,192},{48,212}})));
  Modelica.Fluid.Valves.ValveIncompressible chwp_valveIncompressible_1(
    redeclare package Medium = Modelica.Media.Water.ConstantPropertyLiquidWater,
    dp_nominal(displayUnit="Pa") = 5000,
    m_flow_nominal=305,
      checkValve=true) annotation (Placement(transformation(
        extent={{-7,-7},{7,7}},
        rotation=180,
        origin={-1,19})));

  Modelica.Blocks.Sources.Constant chwp17_speed_const(k=1)
    annotation (Placement(transformation(extent={{-236,228},{-216,248}})));
  Modelica.Blocks.Sources.Constant chwp18_speed_const(k=1)
    annotation (Placement(transformation(extent={{-236,192},{-216,212}})));
  Modelica.Blocks.Sources.Constant chwp_valveIncompressible_const1(k=1)
    annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={112,90})));
  Modelica.Fluid.Valves.ValveIncompressible chwp_valveIncompressible_2(
    redeclare package Medium = Modelica.Media.Water.ConstantPropertyLiquidWater,
    dp_nominal(displayUnit="Pa") = 5000,
    m_flow_nominal=305,
    checkValve=true)   annotation (Placement(transformation(
        extent={{-7,-7},{7,7}},
        rotation=180,
        origin={-3,-13})));

  Modelica.Fluid.Valves.ValveIncompressible chwp_valveIncompressible_3(
    redeclare package Medium = Modelica.Media.Water.ConstantPropertyLiquidWater,
    dp_nominal(displayUnit="Pa") = 5000,
    m_flow_nominal=305,
    checkValve=true)   annotation (Placement(transformation(
        extent={{-7,-7},{7,7}},
        rotation=180,
        origin={-3,-47})));

  Modelica.Fluid.Valves.ValveIncompressible chwp_valveIncompressible_4(
    redeclare package Medium = Modelica.Media.Water.ConstantPropertyLiquidWater,
    dp_nominal(displayUnit="Pa") = 5000,
    m_flow_nominal=305,
    checkValve=true)   annotation (Placement(transformation(
        extent={{-7,-7},{7,7}},
        rotation=180,
        origin={-1,-81})));

  Modelica.Fluid.Valves.ValveIncompressible chwp_valveIncompressible_5(
    redeclare package Medium = Modelica.Media.Water.ConstantPropertyLiquidWater,
    dp_nominal(displayUnit="Pa") = 5000,
    m_flow_nominal=305,
    checkValve=true)   annotation (Placement(transformation(
        extent={{-7,-7},{7,7}},
        rotation=180,
        origin={-3,-113})));

  Modelica.Fluid.Valves.ValveIncompressible chwp_valveIncompressible_6(
    redeclare package Medium = Modelica.Media.Water.ConstantPropertyLiquidWater,
    dp_nominal(displayUnit="Pa") = 5000,
    m_flow_nominal=305,
    checkValve=true)   annotation (Placement(transformation(
        extent={{-7,-7},{7,7}},
        rotation=180,
        origin={-3,-143})));

  Modelica.Fluid.Valves.ValveIncompressible chwp_valveIncompressible_7(
    redeclare package Medium = Modelica.Media.Water.ConstantPropertyLiquidWater,
    dp_nominal(displayUnit="Pa") = 5000,
    m_flow_nominal=3053,
    checkValve=true)   annotation (Placement(transformation(
        extent={{-7,-7},{7,7}},
        rotation=180,
        origin={-3,-171})));

  Modelica.Fluid.Valves.ValveIncompressible chwp_valveIncompressible_8(
    redeclare package Medium = Modelica.Media.Water.ConstantPropertyLiquidWater,
    dp_nominal(displayUnit="Pa") = 5000,
    m_flow_nominal=305,
    checkValve=true)   annotation (Placement(transformation(
        extent={{-7,-7},{7,7}},
        rotation=180,
        origin={-3,-201})));

  Modelica.Fluid.Valves.ValveIncompressible chwp_valveIncompressible_9(
    redeclare package Medium = Modelica.Media.Water.ConstantPropertyLiquidWater,
    dp_nominal(displayUnit="Pa") = 5000,
    m_flow_nominal=305,
    checkValve=true)   annotation (Placement(transformation(
        extent={{-7,-7},{7,7}},
        rotation=180,
        origin={-3,-231})));

  Modelica.Fluid.Valves.ValveIncompressible chwp_valveIncompressible_10(
    redeclare package Medium = Modelica.Media.Water.ConstantPropertyLiquidWater,
    dp_nominal(displayUnit="Pa") = 5000,
    m_flow_nominal=305,
    checkValve=true)   annotation (Placement(transformation(
        extent={{-7,-7},{7,7}},
        rotation=180,
        origin={-3,-259})));

  Modelica.Fluid.Valves.ValveIncompressible chwp_valveIncompressible_11(
    redeclare package Medium = Modelica.Media.Water.ConstantPropertyLiquidWater,
    dp_nominal(displayUnit="Pa") = 5000,
    m_flow_nominal=305,
    checkValve=true)   annotation (Placement(transformation(
        extent={{-7,-7},{7,7}},
        rotation=180,
        origin={13,-337})));

  parameter Real secd_pipe_len=20 "the length of second pump pipe(m)";
parameter Real secd_pipe_v_nominal=3.2501678428725373   "the water velocity of second pump(m/s)";
  parameter Real secd_pipe_roughness=2.5e-2
    "the roughness of second pump pipes(m)";
  parameter Real secd_pipe_thickness=0.02 "the thickness of second pump pipes(m)";
  parameter Real secd_pipe_m_nominal=251
    "the nominal mass rate of second pump(kg/s)";
parameter Real prim_pipe_v_nominal=2.3763504987570574 "the velocity of chiller water(m/s";
  parameter Real prim_pipe_len=20
    "Equivilent length of pipe for chiller pressure drop (m)";
  parameter Real prim_pipe_m_nominal=300 "Nominal flow rate of each chiller (kg/s)";
  parameter Real prim_pipe_roughness=2.5e-2
    "Roughness of the equivilent pipe of chiller (m)";
  parameter Real terminal_m_nominal=1000
    "the nominal mass flow rate of terminal (kg/s)";
parameter Real terminal_dpopen=324378.2241561998    "the pressure drop when the valve is fully open (pa)";
  parameter Real bypass_m_nominal=300
    "the nominal mass flow rate of the bypass pipe (kg/s)";
  parameter Real bypass_dp_nominal=500000
    "the nominal dp of the bypass pipe (pa)";
  Buildings.Fluid.Sources.Boundary_pT chw_sup(
    redeclare package Medium = Buildings.Media.Water,
    use_p_in=true,
    use_T_in=false,
    nPorts=1) annotation (Placement(transformation(
        extent={{-16,-16},{16,16}},
        rotation=180,
        origin={308,338})));
  Buildings.Fluid.Sources.Boundary_pT chw_ret(
    redeclare package Medium = Buildings.Media.Water,
    use_p_in=true,
    use_T_in=false,
    nPorts=1) annotation (Placement(transformation(
        extent={{-16,-16},{16,16}},
        rotation=180,
        origin={214,154})));
  Buildings.Fluid.Actuators.Valves.TwoWayLinear terminal_resist1(
    redeclare package Medium = Buildings.Media.Water,
    m_flow_nominal=terminal_m_nominal,
    CvData=Buildings.Fluid.Types.CvTypes.OpPoint,
    dpValve_nominal=terminal_dpopen,
    dpFixed_nominal=0,
    use_inputFilter=true)
    annotation (Placement(transformation(extent={{174,266},{194,286}})));
  Buildings.Fluid.Sensors.Pressure chw_term_P(redeclare package Medium =
        Buildings.Media.Water) "Chilled water pressure after terminal"
    annotation (Placement(transformation(extent={{230,300},{250,320}})));
  Modelica.Blocks.Sources.Constant terminal_resist_ratio(k=1)
    "Pump speed constant"
    annotation (Placement(transformation(extent={{152,306},{172,326}})));
  Modelica.Blocks.Sources.Constant ret_p(k=400000) "Return water pressure"
    annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={342,262})));
  Buildings.Fluid.Sensors.Pressure chw_sup_P(redeclare package Medium =
        Buildings.Media.Water) "Supply chilled water pressure"
    annotation (Placement(transformation(extent={{106,310},{126,330}})));
  Buildings.Fluid.Sensors.MassFlowRate chw_sup_m(redeclare package Medium =
        Buildings.Media.Water) "Chille water supply mass flow rate (kg/s)"
    annotation (Placement(transformation(extent={{132,266},{152,286}})));
  Buildings.Fluid.Sensors.RelativePressure secd_p_diff(redeclare package Medium
      = Buildings.Media.Water)
    annotation (Placement(transformation(extent={{30,156},{50,176}})));
  Buildings.Fluid.Sensors.RelativePressure prim_p_diff(redeclare package Medium
      = Buildings.Media.Water) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={-70,92})));
equation
  connect(jun_4.port_2, jun_5.port_1)
    annotation (Line(points={{18,-90},{18,-106}},color={0,127,255}));
  connect(jun_2.port_2, jun_3.port_1)
    annotation (Line(points={{18,-20},{18,-40}},
                                               color={0,127,255}));
  connect(jun_3.port_2, jun_4.port_1)
    annotation (Line(points={{18,-56},{18,-74}}, color={0,127,255}));
  connect(jun_1.port_2, jun_2.port_1)
    annotation (Line(points={{18,12},{18,-4}}, color={0,127,255}));
  connect(jun_10.port_2, jun_9.port_1)
    annotation (Line(points={{-148,-102},{-148,-84}},color={0,127,255}));
  connect(jun_9.port_2, jun_8.port_1) annotation (Line(points={{-148,-68},{-146,
          -68},{-146,-54}}, color={0,127,255}));
  connect(jun_8.port_2, jun_7.port_1) annotation (Line(points={{-146,-38},{-146,
          -26}},                   color={0,127,255}));
  connect(jun_7.port_2, jun_6.port_1) annotation (Line(points={{-146,-10},{-144,
          -10},{-144,10}},color={0,127,255}));
  connect(jun_12.port_2, jun_13.port_1) annotation (Line(points={{-144,330},{-146,
          330},{-146,350},{-144,350}},      color={0,127,255}));
  connect(jun_13.port_2, jun_14.port_1)
    annotation (Line(points={{-144,366},{-144,388}}, color={0,127,255}));
  connect(jun_11.port_2, jun_12.port_1)
    annotation (Line(points={{-144,298},{-144,314}}, color={0,127,255}));
  connect(jun_18.port_2, jun_17.port_1)
    annotation (Line(points={{8,386},{8,368}},     color={0,127,255}));
  connect(jun_17.port_2, jun_16.port_1)
    annotation (Line(points={{8,352},{8,332}},     color={0,127,255}));
  connect(jun_16.port_2, jun_15.port_1)
    annotation (Line(points={{8,316},{8,298},{6,298}},
                                                   color={0,127,255}));
  connect(chiller_5.port_b, jun_10.port_3)
    annotation (Line(points={{-106,-110},{-140,-110}}, color={0,127,255}));
  connect(chwp_12.port_b, chwp_12_pipe.port_a) annotation (Line(points={{-76,
          423},{-64,423},{-64,422},{-46,422},{-46,424}}, color={0,127,255}));
  connect(chwp_12_pipe.port_b, jun_18.port_1) annotation (Line(points={{-26,424},
          {-18,424},{-18,422},{8,422},{8,402}}, color={0,127,255}));
  connect(jun_6.port_2, prim_sup_pipe.port_a)
    annotation (Line(points={{-144,26},{-144,50}}, color={0,127,255}));
  connect(jun_19.port_2, prim_ret_pipe.port_a)
    annotation (Line(points={{18,108},{18,76}}, color={0,127,255}));
  connect(prim_ret_pipe.port_b, jun_1.port_1)
    annotation (Line(points={{18,56},{18,28}}, color={0,127,255}));
  connect(jun_6.port_3, chiller_1.port_b) annotation (Line(points={{-136,18},{
          -136,22},{-104,22}}, color={0,127,255}));
  connect(jun_7.port_3, chiller_2.port_b) annotation (Line(points={{-138,-18},{
          -120,-18},{-120,-16},{-102,-16}}, color={0,127,255}));
  connect(jun_8.port_3, chiller_3.port_b) annotation (Line(points={{-138,-46},{
          -136,-46},{-136,-48},{-104,-48}}, color={0,127,255}));
  connect(jun_9.port_3, chiller_4.port_b)
    annotation (Line(points={{-140,-76},{-106,-76}}, color={0,127,255}));
  connect(chwp_13.port_b, chwp_13_pipe.port_a) annotation (Line(points={{-76,
          395},{-61,395},{-61,394},{-46,394}}, color={0,127,255}));
  connect(chwp_13_pipe.port_b, jun_18.port_3)
    annotation (Line(points={{-26,394},{0,394}}, color={0,127,255}));
  connect(chwp_14.port_b, chwp_14_pipe.port_a) annotation (Line(points={{-74,
          359},{-74,364},{-46,364}}, color={0,127,255}));
  connect(chwp_14_pipe.port_b, jun_17.port_3) annotation (Line(points={{-26,364},
          {-24,364},{-24,360},{0,360}}, color={0,127,255}));
  connect(chwp_15.port_b, chwp_15_pipe.port_a) annotation (Line(points={{-74,
          325},{-60,325},{-60,324},{-46,324}}, color={0,127,255}));
  connect(chwp_15_pipe.port_b, jun_16.port_3)
    annotation (Line(points={{-26,324},{0,324}}, color={0,127,255}));
  connect(chwp_16.port_b, chwp_16_pipe.port_a) annotation (Line(points={{-74,
          295},{-61,295},{-61,292},{-48,292}}, color={0,127,255}));
  connect(chwp_16_pipe.port_b, jun_15.port_3) annotation (Line(points={{-28,292},
          {-28,290},{-2,290}}, color={0,127,255}));
  connect(prim_sup_pipe.port_b, jun_20.port_1) annotation (Line(points={{-144,
          70},{-144,90},{-146,90},{-146,110}}, color={0,127,255}));
  connect(jun_20.port_2, secd_ret_pipe.port_a) annotation (Line(points={{-146,
          126},{-164,126},{-164,148},{-144,148}}, color={0,127,255}));
  connect(jun_10.port_1, jun_21.port_2) annotation (Line(points={{-148,-118},{
          -150,-118},{-150,-134},{-148,-134}}, color={0,127,255}));
  connect(jun_21.port_1, jun_22.port_2) annotation (Line(points={{-148,-150},{
          -148,-162},{-148,-162},{-148,-166}}, color={0,127,255}));
  connect(jun_22.port_1, jun_23.port_2)
    annotation (Line(points={{-148,-182},{-148,-194}}, color={0,127,255}));
  connect(jun_23.port_1, jun_24.port_2)
    annotation (Line(points={{-148,-210},{-148,-220}}, color={0,127,255}));
  connect(jun_24.port_1, jun_25.port_2)
    annotation (Line(points={{-148,-236},{-148,-248}}, color={0,127,255}));
  connect(jun_21.port_3, chiller_6.port_b) annotation (Line(points={{-140,-142},
          {-126,-142},{-126,-144},{-104,-144},{-104,-142}}, color={0,127,255}));
  connect(jun_22.port_3, chiller_7.port_b) annotation (Line(points={{-140,-174},
          {-110,-174},{-110,-170},{-106,-170}}, color={0,127,255}));
  connect(jun_23.port_3, chiller_8.port_b) annotation (Line(points={{-140,-202},
          {-106,-202}},             color={0,127,255}));
  connect(jun_24.port_3, chiller_9.port_b)
    annotation (Line(points={{-140,-228},{-106,-228}}, color={0,127,255}));
  connect(chiller_10.port_b, jun_25.port_3)
    annotation (Line(points={{-106,-256},{-140,-256}}, color={0,127,255}));
  connect(jun_25.port_1, chiller_11.port_b) annotation (Line(points={{-148,-264},
          {-148,-334},{-120,-334}},             color={0,127,255}));
  connect(chwp12_speed_const.y, chwp_12.y) annotation (Line(points={{-217,430},{
          -158,430},{-158,442},{-85,442},{-85,433.8}},  color={0,0,127}));
  connect(chwp13_speed_const.y, chwp_13.y) annotation (Line(points={{-217,396},{
          -176,396},{-176,412},{-85,412},{-85,405.8}},  color={0,0,127}));
  connect(chwp14_speed_const.y, chwp_14.y) annotation (Line(points={{-217,360},{
          -198,360},{-198,376},{-83,376},{-83,369.8}},  color={0,0,127}));
  connect(chwp15_speed_const.y, chwp_15.y) annotation (Line(points={{-217,322},{
          -182,322},{-182,342},{-83,342},{-83,335.8}},  color={0,0,127}));
  connect(chwp16_speed_const.y, chwp_16.y) annotation (Line(points={{-217,284},{
          -188,284},{-188,312},{-83,312},{-83,305.8}},  color={0,0,127}));
  connect(chwp1_speed_const.y, chwp_1.y) annotation (Line(points={{-227,52},{
          -214,52},{-214,48},{-62,48},{-62,2},{-23,2},{-23,8.2}}, color={0,0,
          127}));
  connect(chwp2_speed_const.y, chwp_2.y) annotation (Line(points={{-225,16},{
          -206,16},{-206,18},{-172,18},{-172,4},{-66,4},{-66,-30},{-23,-30},{
          -23,-23.8}}, color={0,0,127}));
  connect(chwp3_speed_const.y, chwp_3.y) annotation (Line(points={{-225,-22},{
          -196,-22},{-196,-26},{-166,-26},{-166,-30},{-74,-30},{-74,-60},{-25,
          -60},{-25,-55.8}}, color={0,0,127}));
  connect(chwp4_speed_const.y, chwp_4.y) annotation (Line(points={{-223,-58},{
          -82,-58},{-82,-98},{-25,-98},{-25,-91.8}}, color={0,0,127}));
  connect(chwp_5.y, chwp5_speed_const.y) annotation (Line(points={{-25,-119.8},
          {-25,-126},{-182,-126},{-182,-96},{-223,-96}}, color={0,0,127}));
  connect(chwp_6.y, chwp6_speed_const.y) annotation (Line(points={{-25,-151.8},
          {-25,-160},{-188,-160},{-188,-134},{-221,-134}}, color={0,0,127}));
  connect(chwp7_speed_const.y, chwp_7.y) annotation (Line(points={{-223,-166},{
          -210,-166},{-210,-186},{-25,-186},{-25,-183.8}}, color={0,0,127}));
  connect(chwp8_speed_const.y, chwp_8.y) annotation (Line(points={{-223,-198},{
          -210,-198},{-210,-200},{-184,-200},{-184,-218},{-27,-218},{-27,-213.8}},
        color={0,0,127}));
  connect(chwp9_speed_const.y, chwp_9.y) annotation (Line(points={{-223,-232},{
          -198,-232},{-198,-248},{-27,-248},{-27,-241.8}}, color={0,0,127}));
  connect(chwp10_speed_const.y, chwp_10.y) annotation (Line(points={{-223,-268},
          {-174,-268},{-174,-276},{-27,-276},{-27,-269.8}}, color={0,0,127}));
  connect(chwp11_speed_const.y, chwp_11.y) annotation (Line(points={{-221,-306},
          {-152,-306},{-152,-364},{-17,-364},{-17,-347.8}},
                                    color={0,0,127}));
  connect(jun_5.port_2, jun_26.port_1)
    annotation (Line(points={{18,-122},{18,-134}}, color={0,127,255}));
  connect(jun_26.port_2, jun_27.port_1)
    annotation (Line(points={{18,-150},{18,-164}}, color={0,127,255}));
  connect(jun_27.port_2, jun_28.port_1)
    annotation (Line(points={{18,-180},{18,-194}}, color={0,127,255}));
  connect(jun_28.port_2, jun_29.port_1) annotation (Line(points={{18,-210},{20,
          -210},{20,-222}}, color={0,127,255}));
  connect(jun_29.port_2, jun_30.port_1)
    annotation (Line(points={{20,-238},{20,-250}}, color={0,127,255}));
  connect(chwp_12.port_a, chwp_12_val.port_b) annotation (Line(points={{-94,423},
          {-101,423},{-101,426},{-108,426}}, color={0,127,255}));
  connect(chwp_12_val.port_a, jun_14.port_2) annotation (Line(points={{-128,426},
          {-144,426},{-144,404}}, color={0,127,255}));
  connect(jun_14.port_3, chwp_13_val.port_a) annotation (Line(points={{-136,396},
          {-136,394},{-124,394}}, color={0,127,255}));
  connect(chwp_13_val.port_b, chwp_13.port_a)
    annotation (Line(points={{-104,394},{-94,395}}, color={0,127,255}));
  connect(jun_13.port_3, chwp_14_val.port_a)
    annotation (Line(points={{-136,358},{-122,358}}, color={0,127,255}));
  connect(chwp_14_val.port_b, chwp_14.port_a)
    annotation (Line(points={{-102,358},{-92,359}}, color={0,127,255}));
  connect(jun_12.port_3, chwp_15_val.port_a) annotation (Line(points={{-136,322},
          {-132,322},{-132,325},{-120,326}}, color={0,127,255}));
  connect(chwp_15_val.port_b, chwp_15.port_a) annotation (Line(points={{-100,326},
          {-96,326},{-96,325},{-92,325}},      color={0,127,255}));
  connect(jun_11.port_3, chwp_16_val.port_a) annotation (Line(points={{-136,290},
          {-132,290},{-132,292},{-122,292}}, color={0,127,255}));
  connect(chwp_16_val.port_b, chwp_16.port_a) annotation (Line(points={{-102,292},
          {-96,292},{-96,295},{-92,295}},      color={0,127,255}));
  connect(chiller_1.port_a, chwp_1_val.port_b)
    annotation (Line(points={{-84,22},{-84,19},{-58,20}}, color={0,127,255}));
  connect(chwp_1_val.port_a, chwp_1.port_b) annotation (Line(points={{-38,20},{
          -35,20},{-35,19},{-32,19}}, color={0,127,255}));
  connect(chiller_2.port_a, chwp_2_val.port_b) annotation (Line(points={{-82,
          -16},{-76,-16},{-76,-13},{-62,-14}}, color={0,127,255}));
  connect(chwp_2_val.port_a, chwp_2.port_b) annotation (Line(points={{-42,-14},
          {-38,-14},{-38,-13},{-32,-13}}, color={0,127,255}));
  connect(chiller_3.port_a, chwp_3_val.port_b) annotation (Line(points={{-84,
          -48},{-80,-48},{-80,-45},{-66,-46}}, color={0,127,255}));
  connect(chwp_3_val.port_a, chwp_3.port_b) annotation (Line(points={{-46,-46},
          {-40,-46},{-40,-45},{-34,-45}}, color={0,127,255}));
  connect(chiller_4.port_a, chwp_4_val.port_b) annotation (Line(points={{-86,
          -76},{-60,-76},{-60,-81},{-58,-82}}, color={0,127,255}));
  connect(chwp_4_val.port_a, chwp_4.port_b) annotation (Line(points={{-38,-82},
          {-36,-82},{-36,-81},{-34,-81}}, color={0,127,255}));
  connect(chwp_5.port_b, chwp_5_val.port_a)
    annotation (Line(points={{-34,-109},{-48,-114}}, color={0,127,255}));
  connect(chwp_5_val.port_b, chiller_5.port_a) annotation (Line(points={{-68,
          -114},{-76,-114},{-76,-110},{-86,-110}}, color={0,127,255}));
  connect(chiller_6.port_a, chwp_6_val.port_b) annotation (Line(points={{-84,
          -142},{-80,-142},{-80,-144},{-70,-144}}, color={0,127,255}));
  connect(chwp_6_val.port_a, chwp_6.port_b) annotation (Line(points={{-50,-144},
          {-41,-144},{-41,-141},{-34,-141}}, color={0,127,255}));
  connect(chwp_7.port_b, chwp_7_val.port_a)
    annotation (Line(points={{-34,-173},{-54,-178}}, color={0,127,255}));
  connect(chwp_7_val.port_b, chiller_7.port_a) annotation (Line(points={{-74,
          -178},{-80,-178},{-80,-170},{-86,-170}}, color={0,127,255}));
  connect(chiller_8.port_a, chwp_8_val.port_b)
    annotation (Line(points={{-86,-202},{-66,-202}}, color={0,127,255}));
  connect(chwp_8_val.port_a, chwp_8.port_b) annotation (Line(points={{-46,-202},
          {-38,-202},{-38,-203},{-36,-203}}, color={0,127,255}));
  connect(chiller_9.port_a, chwp_9_val.port_b) annotation (Line(points={{-86,
          -228},{-78,-228},{-78,-236},{-74,-236}}, color={0,127,255}));
  connect(chwp_9_val.port_a, chwp_9.port_b) annotation (Line(points={{-54,-236},
          {-54,-231},{-36,-231}}, color={0,127,255}));
  connect(chiller_10.port_a, chwp_10_val.port_b) annotation (Line(points={{-86,
          -256},{-86,-264},{-70,-264}},            color={0,127,255}));
  connect(chwp_10_val.port_a, chwp_10.port_b) annotation (Line(points={{-50,
          -264},{-36,-264},{-36,-259}},            color={0,127,255}));
  connect(chwp_11.port_b, chwp_11_val.port_a) annotation (Line(points={{-26,
          -337},{-40,-337},{-40,-340},{-56,-340}}, color={0,127,255}));
  connect(chwp_11_val.port_b, chiller_11.port_a) annotation (Line(points={{-76,
          -340},{-84,-340},{-84,-334},{-100,-334}}, color={0,127,255}));
  connect(chwp12_val_pos.y, chwp_12_val.y) annotation (Line(points={{43,442},{-12,
          442},{-12,454},{-118,454},{-118,438}},     color={0,0,127}));
  connect(chwp13_val_pos.y, chwp_13_val.y) annotation (Line(points={{47,408},{-76,
          408},{-76,406},{-114,406}},     color={0,0,127}));
  connect(chwp14_val_pos.y, chwp_14_val.y) annotation (Line(points={{47,374},{-20,
          374},{-20,378},{-60,378},{-60,370},{-112,370}},     color={0,0,127}));
  connect(chwp15_val_pos.y, chwp_15_val.y)
    annotation (Line(points={{49,340},{49,338},{-110,338}}, color={0,0,127}));
  connect(chwp16_val_pos.y, chwp_16_val.y) annotation (Line(points={{47,304},{-12,
          304},{-12,270},{-112,270},{-112,304}},     color={0,0,127}));
  connect(chwp1_val_pos.y, chwp_1_val.y)
    annotation (Line(points={{69,42},{-48,42},{-48,32}}, color={0,0,127}));
  connect(chwp2_val_pos.y, chwp_2_val.y) annotation (Line(points={{67,4},{-16,4},
          {-16,-2},{-52,-2}}, color={0,0,127}));
  connect(chwp3_val_pos.y, chwp_3_val.y)
    annotation (Line(points={{69,-34},{-56,-34}}, color={0,0,127}));
  connect(chwp4_val_pos.y, chwp_4_val.y)
    annotation (Line(points={{67,-70},{-48,-70}}, color={0,0,127}));
  connect(chwp5_val_pos.y, chwp_5_val.y) annotation (Line(points={{67,-108},{28,
          -108},{28,-102},{-58,-102}}, color={0,0,127}));
  connect(chwp6_val_pos.y, chwp_6_val.y) annotation (Line(points={{65,-138},{28,
          -138},{28,-128},{-40,-128},{-40,-100},{-52,-100},{-52,-96},{-72,-96},
          {-72,-132},{-60,-132}}, color={0,0,127}));
  connect(chwp7_val_pos.y, chwp_7_val.y) annotation (Line(points={{91,-162},{20,
          -162},{20,-156},{-64,-156},{-64,-166}}, color={0,0,127}));
  connect(chwp8_val_pos.y, chwp_8_val.y)
    annotation (Line(points={{61,-188},{-56,-190}}, color={0,0,127}));
  connect(chwp9_val_pos.y, chwp_9_val.y) annotation (Line(points={{61,-222},{32,
          -222},{32,-216},{-64,-216},{-64,-224}}, color={0,0,127}));
  connect(chwp10_val_pos.y, chwp_10_val.y) annotation (Line(points={{61,-258},{
          40,-258},{40,-316},{-60,-316},{-60,-252}}, color={0,0,127}));
  connect(chwp11_val_pos.y, chwp_11_val.y) annotation (Line(points={{63,-326},{
          -56,-326},{-56,-320},{-66,-320},{-66,-328}}, color={0,0,127}));
  connect(jun_31.port_3, chwp_17_pipe.port_b)
    annotation (Line(points={{-2,250},{-28,250}}, color={0,127,255}));
  connect(chwp_17_pipe.port_a, chwp_17.port_b)
    annotation (Line(points={{-48,250},{-68,249}}, color={0,127,255}));
  connect(chwp_17.port_a, chwp_17_val.port_b) annotation (Line(points={{-86,249},
          {-86,250},{-104,250}}, color={0,127,255}));
  connect(jun_32.port_3, chwp_18_pipe.port_b)
    annotation (Line(points={{-4,216},{-4,214},{-28,214}}, color={0,127,255}));
  connect(chwp_18_pipe.port_a, chwp_18.port_b) annotation (Line(points={{-48,
          214},{-48,192},{-72,192},{-72,215}}, color={0,127,255}));
  connect(chwp_18.port_a, chwp_18_val.port_b) annotation (Line(points={{-90,215},
          {-90,212},{-106,212}}, color={0,127,255}));
  connect(jun_11.port_1, jun_33.port_2) annotation (Line(points={{-144,282},{-180,
          282},{-180,260},{-160,260}}, color={0,127,255}));
  connect(jun_33.port_3, chwp_17_val.port_a)
    annotation (Line(points={{-152,252},{-124,250}}, color={0,127,255}));
  connect(jun_33.port_1, jun_34.port_2) annotation (Line(points={{-160,244},{-180,
          244},{-180,220},{-158,220}}, color={0,127,255}));
  connect(jun_34.port_3, chwp_18_val.port_a)
    annotation (Line(points={{-150,212},{-126,212}}, color={0,127,255}));
  connect(jun_34.port_1, secd_ret_pipe.port_b) annotation (Line(points={{-158,
          204},{-158,180},{-144,180},{-144,168}}, color={0,127,255}));
  connect(jun_15.port_2, jun_31.port_1)
    annotation (Line(points={{6,282},{6,258}}, color={0,127,255}));
  connect(jun_31.port_2, jun_32.port_1) annotation (Line(points={{6,242},{6,234},
          {6,224},{4,224}}, color={0,127,255}));
  connect(secd_sup_pipe.port_a, jun_32.port_2) annotation (Line(points={{90,276},
          {24,276},{24,188},{0,188},{0,200},{4,200},{4,208}}, color={0,127,255}));
  connect(chwp17_val_pos.y, chwp_17_val.y) annotation (Line(points={{45,250},{16,
          250},{16,236},{-128,236},{-128,262},{-114,262}}, color={0,0,127}));
  connect(chwp18_val_pos.y, chwp_18_val.y) annotation (Line(points={{47,202},{-96,
          202},{-96,232},{-116,232},{-116,224}}, color={0,0,127}));
  connect(chwp17_speed_const.y, chwp_17.y) annotation (Line(points={{-215,238},{
          -92,238},{-92,259.8},{-77,259.8}}, color={0,0,127}));
  connect(chwp18_speed_const.y, chwp_18.y) annotation (Line(points={{-215,202},{
          -160,202},{-160,196},{-144,196},{-144,184},{-81,184},{-81,225.8}},
        color={0,0,127}));
  connect(chwp_valveIncompressible_1.port_b, chwp_1.port_a)
    annotation (Line(points={{-8,19},{-14,19}}, color={0,127,255}));
  connect(jun_1.port_3, chwp_valveIncompressible_1.port_a) annotation (Line(
        points={{10,20},{8,20},{8,19},{6,19}}, color={0,127,255}));
  connect(chwp_2.port_a, chwp_valveIncompressible_2.port_b)
    annotation (Line(points={{-14,-13},{-10,-13}}, color={0,127,255}));
  connect(chwp_valveIncompressible_2.port_a, jun_2.port_3) annotation (Line(
        points={{4,-13},{7,-13},{7,-12},{10,-12}}, color={0,127,255}));
  connect(chwp_3.port_a, chwp_valveIncompressible_3.port_b) annotation (Line(
        points={{-16,-45},{-16,-47},{-10,-47}}, color={0,127,255}));
  connect(chwp_valveIncompressible_3.port_a, jun_3.port_3) annotation (Line(
        points={{4,-47},{7,-47},{7,-48},{10,-48}}, color={0,127,255}));
  connect(chwp_valveIncompressible_4.port_b, chwp_4.port_a) annotation (Line(
        points={{-8,-81},{-12,-81},{-12,-81},{-16,-81}}, color={0,127,255}));
  connect(chwp_valveIncompressible_4.port_a, jun_4.port_3) annotation (Line(
        points={{6,-81},{8,-81},{8,-82},{10,-82}}, color={0,127,255}));
  connect(chwp_5.port_a, chwp_valveIncompressible_5.port_b) annotation (Line(
        points={{-16,-109},{-16,-113},{-10,-113}}, color={0,127,255}));
  connect(chwp_valveIncompressible_5.port_a, jun_5.port_3) annotation (Line(
        points={{4,-113},{7,-113},{7,-114},{10,-114}}, color={0,127,255}));
  connect(chwp_7.port_a, chwp_valveIncompressible_7.port_b) annotation (Line(
        points={{-16,-173},{-13,-173},{-13,-171},{-10,-171}}, color={0,127,255}));
  connect(chwp_valveIncompressible_7.port_a, jun_27.port_3) annotation (Line(
        points={{4,-171},{7,-171},{7,-172},{10,-172}}, color={0,127,255}));
  connect(chwp_8.port_a, chwp_valveIncompressible_8.port_b) annotation (Line(
        points={{-18,-203},{-18,-201},{-10,-201}}, color={0,127,255}));
  connect(chwp_valveIncompressible_8.port_a, jun_28.port_3) annotation (Line(
        points={{4,-201},{7,-201},{7,-202},{10,-202}}, color={0,127,255}));
  connect(chwp_9.port_a, chwp_valveIncompressible_9.port_b)
    annotation (Line(points={{-18,-231},{-10,-231}}, color={0,127,255}));
  connect(chwp_valveIncompressible_9.port_a, jun_29.port_3) annotation (Line(
        points={{4,-231},{6,-231},{6,-230},{12,-230}}, color={0,127,255}));
  connect(chwp_10.port_a, chwp_valveIncompressible_10.port_b)
    annotation (Line(points={{-18,-259},{-10,-259}}, color={0,127,255}));
  connect(chwp_valveIncompressible_10.port_a, jun_30.port_3)
    annotation (Line(points={{4,-259},{4,-258},{12,-258}}, color={0,127,255}));
  connect(jun_30.port_2, chwp_valveIncompressible_11.port_a) annotation (Line(
        points={{20,-266},{20,-312},{28,-312},{28,-337},{20,-337}}, color={0,
          127,255}));
  connect(chwp_valveIncompressible_11.port_b, chwp_11.port_a)
    annotation (Line(points={{6,-337},{-8,-337}}, color={0,127,255}));
  connect(chwp_valveIncompressible_11.opening, chwp_valveIncompressible_const1.y)
    annotation (Line(points={{13,-342.6},{13,-346},{60,-346},{60,90},{101,90}},
        color={0,0,127}));
  connect(chwp_valveIncompressible_1.opening, chwp_valveIncompressible_const1.y)
    annotation (Line(points={{-1,13.4},{-1,10},{60,10},{60,90},{101,90}}, color=
         {0,0,127}));
  connect(chwp_valveIncompressible_2.opening, chwp_valveIncompressible_const1.y)
    annotation (Line(points={{-3,-18.6},{-3,-26},{60,-26},{60,90},{101,90}},
        color={0,0,127}));
  connect(chwp_valveIncompressible_3.opening, chwp_valveIncompressible_const1.y)
    annotation (Line(points={{-3,-52.6},{-3,-64},{60,-64},{60,90},{101,90}},
        color={0,0,127}));
  connect(chwp_valveIncompressible_4.opening, chwp_valveIncompressible_const1.y)
    annotation (Line(points={{-1,-86.6},{-1,-94},{60,-94},{60,90},{101,90}},
        color={0,0,127}));
  connect(chwp_valveIncompressible_5.opening, chwp_valveIncompressible_const1.y)
    annotation (Line(points={{-3,-118.6},{-3,-126},{60,-126},{60,90},{101,90}},
        color={0,0,127}));
  connect(chwp_valveIncompressible_6.opening, chwp_valveIncompressible_const1.y)
    annotation (Line(points={{-3,-148.6},{-3,-154},{60,-154},{60,90},{101,90}},
        color={0,0,127}));
  connect(chwp_valveIncompressible_8.opening, chwp_valveIncompressible_const1.y)
    annotation (Line(points={{-3,-206.6},{-3,-214},{60,-214},{60,90},{101,90}},
        color={0,0,127}));
  connect(chwp_valveIncompressible_9.opening, chwp_valveIncompressible_const1.y)
    annotation (Line(points={{-3,-236.6},{-3,-240},{60,-240},{60,90},{101,90}},
        color={0,0,127}));
  connect(chwp_valveIncompressible_10.opening, chwp_valveIncompressible_const1.y)
    annotation (Line(points={{-3,-264.6},{-3,-278},{60,-278},{60,90},{101,90}},
        color={0,0,127}));
  connect(chwp_valveIncompressible_6.port_b, chwp_6.port_a)
    annotation (Line(points={{-10,-143},{-14,-143},{-14,-141},{-16,-141}},
                                                     color={0,127,255}));
  connect(chwp_valveIncompressible_7.opening, chwp_valveIncompressible_const1.y)
    annotation (Line(points={{-3,-176.6},{-3,-184},{60,-184},{60,90},{101,90}},
        color={0,0,127}));
  connect(chwp_valveIncompressible_6.port_a, jun_26.port_3) annotation (Line(
        points={{4,-143},{7,-143},{7,-142},{10,-142}}, color={0,127,255}));
  connect(bypass_pipe.port_a, jun_20.port_3)
    annotation (Line(points={{-70,118},{-138,118}}, color={0,127,255}));
  connect(bypass_pipe.port_b, jun_19.port_3) annotation (Line(points={{-46,118},
          {-20,118},{-20,116},{10,116}}, color={0,127,255}));
  connect(chw_ret_pipe.port_b, jun_19.port_1) annotation (Line(points={{94,130},
          {78,130},{78,134},{18,134},{18,124}}, color={0,127,255}));
  connect(chw_ret_pipe.port_a, chw_ret.ports[1]) annotation (Line(points={{114,
          130},{158,130},{158,154},{198,154}}, color={0,127,255}));
  connect(terminal_resist1.port_b, chw_sup.ports[1]) annotation (Line(points={{
          194,276},{276,276},{276,338},{292,338}}, color={0,127,255}));
  connect(chw_term_P.port, terminal_resist1.port_b) annotation (Line(points={{
          240,300},{240,276},{194,276}}, color={0,127,255}));
  connect(terminal_resist_ratio.y, terminal_resist1.y)
    annotation (Line(points={{173,316},{184,316},{184,288}}, color={0,0,127}));
  connect(ret_p.y, chw_sup.p_in) annotation (Line(points={{331,262},{316,262},{
          316,308},{324,308},{324,316},{327.2,316},{327.2,325.2}}, color={0,0,
          127}));
  connect(ret_p.y, chw_ret.p_in) annotation (Line(points={{331,262},{252,262},{
          252,141.2},{233.2,141.2}}, color={0,0,127}));
  connect(secd_sup_pipe.port_b, chw_sup_m.port_a) annotation (Line(points={{110,
          276},{110,252},{132,252},{132,276}}, color={0,127,255}));
  connect(chw_sup_m.port_b, terminal_resist1.port_a)
    annotation (Line(points={{152,276},{174,276}}, color={0,127,255}));
  connect(chw_sup_P.port, secd_sup_pipe.port_b) annotation (Line(points={{116,
          310},{116,296},{120,296},{120,276},{110,276}}, color={0,127,255}));
  connect(secd_p_diff.port_a, secd_ret_pipe.port_b) annotation (Line(points={{
          30,166},{28,166},{28,180},{-144,180},{-144,168}}, color={0,127,255}));
  connect(secd_p_diff.port_b, chw_sup_m.port_a) annotation (Line(points={{50,
          166},{80,166},{80,274},{110,274},{110,252},{132,252},{132,276}},
        color={0,127,255}));
  connect(prim_p_diff.port_a, jun_19.port_2) annotation (Line(points={{-60,92},
          {-60,68},{-4,68},{-4,88},{16,88},{16,100},{18,100},{18,108}}, color={
          0,127,255}));
  connect(prim_p_diff.port_b, jun_20.port_1) annotation (Line(points={{-80,92},
          {-146,92},{-146,110}}, color={0,127,255}));
  annotation (
    Icon(coordinateSystem(preserveAspectRatio=false, extent={{-320,-360},{360,
            480}})),
    Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-320,-360},{
            360,480}})),
    uses(Buildings(version="8.1.3"), Modelica(version="4.0.0")));
end tongwei_shuili_balance_v5;
