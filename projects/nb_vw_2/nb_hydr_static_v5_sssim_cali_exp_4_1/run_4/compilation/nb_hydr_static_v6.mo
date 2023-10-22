model nb_hydr_static_v6
  Buildings.Fluid.Sources.Boundary_pT chw_ret(redeclare package Medium =
        Buildings.Media.Water,                                                                  use_Xi_in = false, use_p_in = true, p = 400000, nPorts = 1) annotation (
    Placement(transformation(extent = {{142, 102}, {112, 72}})));
  Buildings.Fluid.Movers.SpeedControlled_y chwp_1(redeclare package Medium =
        Buildings.Media.Water,                                                                      energyDynamics = Modelica.Fluid.Types.Dynamics.SteadyState, massDynamics = Modelica.Fluid.Types.Dynamics.SteadyState, p_start = 400000, redeclare Buildings.Fluid.Movers.Data.Pumps.Wilo.CronolineIL80slash220dash4slash4 per(pressure(V_flow = {0, 55.6, 111.4, 166.7, 219.2, 276.9, 333.1, 389.7}, dp = {634500, 625500, 617660, 608840, 597100, 577500, 548100, 503900}), use_powerCharacteristic = true, power(V_flow = {0, 55.6, 111.4, 166.7, 219.2, 276.9, 333.1, 389.7}, P = {119188.42, 129804, 142486, 156660, 171580, 187992, 205150, 223800})), addPowerToMedium = true) annotation (
    Placement(transformation(extent = {{-64, 76}, {-96, 44}})));
  Buildings.Fluid.FixedResistances.Pipe chiller_1(redeclare package Medium =
        Buildings.Media.Water,                                                                      energyDynamics = Modelica.Fluid.Types.Dynamics.FixedInitial, massDynamics = Modelica.Fluid.Types.Dynamics.FixedInitial, allowFlowReversal = true, m_flow_nominal = chr_flow_nom, m_flow_small = 0.0001, nSeg = 10, thicknessIns = 0.1, lambdaIns = 0.1, length = chiller_pipe_len, v_nominal = chiller_v_nominal, roughness = chr_roughness, useMultipleHeatPorts = false) annotation (
    Placement(transformation(extent = {{-162, 40}, {-202, 80}})));
  Buildings.Fluid.FixedResistances.Junction jun_1(redeclare package Medium =
        Buildings.Media.Water,                                                                      m_flow_nominal = {100, -100, -100}, dp_nominal = {10, 0, 0}) annotation (
    Placement(transformation(extent = {{-14, -14}, {14, 14}}, rotation = -90, origin = {0, 60})));
  Buildings.Fluid.Movers.SpeedControlled_y chwp_2(redeclare package Medium =
        Buildings.Media.Water,                                                                      energyDynamics = Modelica.Fluid.Types.Dynamics.SteadyState, massDynamics = Modelica.Fluid.Types.Dynamics.SteadyState, p_start = 400000, redeclare Buildings.Fluid.Movers.Data.Pumps.Wilo.CronolineIL80slash220dash4slash4 per(pressure(V_flow = {0, 55.6, 111.4, 166.7, 219.2, 276.9, 333.1, 389.7}, dp = {634500, 625500, 617660, 608840, 597100, 577500, 548100, 503900}), power(V_flow = {0, 55.6, 111.4, 166.7, 219.2, 276.9, 333.1, 389.7}, P = {119188.42, 129804, 142486, 156660, 171580, 187992, 205150, 223800}), speed_rpm_nominal = 1480), addPowerToMedium = true) annotation (
    Placement(transformation(extent = {{-64, -4}, {-96, -36}})));
  Buildings.Fluid.FixedResistances.Pipe chiller_2(redeclare package Medium =
        Buildings.Media.Water,                                                                      energyDynamics = Modelica.Fluid.Types.Dynamics.FixedInitial, massDynamics = Modelica.Fluid.Types.Dynamics.FixedInitial, allowFlowReversal = true, m_flow_nominal = chr_flow_nom, m_flow_small = 0.0001, nSeg = 10, thicknessIns = 0.1, lambdaIns = 0.1, length = chiller_pipe_len, v_nominal = chiller_v_nominal, roughness = chr_roughness, useMultipleHeatPorts = false) annotation (
    Placement(transformation(extent = {{-160, -40}, {-200, 0}})));
  Buildings.Fluid.FixedResistances.Junction jun_2(redeclare package Medium =
        Buildings.Media.Water,                                                                      m_flow_nominal = {100, -100, -100}, dp_nominal = {10, 0, 0}) annotation (
    Placement(transformation(extent = {{-14, -14}, {14, 14}}, rotation = -90, origin = {0, -20})));
  Buildings.Fluid.Movers.SpeedControlled_y chwp_3(redeclare package Medium =
        Buildings.Media.Water,                                                                      energyDynamics = Modelica.Fluid.Types.Dynamics.SteadyState, massDynamics = Modelica.Fluid.Types.Dynamics.SteadyState, p_start = 400000, redeclare Buildings.Fluid.Movers.Data.Pumps.Wilo.CronolineIL80slash220dash4slash4 per(pressure(V_flow = {0, 55.6, 111.4, 166.7, 219.2, 276.9, 333.1, 389.7}, dp = {634500, 625500, 617660, 608840, 597100, 577500, 548100, 503900}), power(V_flow = {0, 55.6, 111.4, 166.7, 219.2, 276.9, 333.1, 389.7}, P = {119188.42, 129804, 142486, 156660, 171580, 187992, 205150, 223800}), speed_rpm_nominal = 1480), addPowerToMedium = true) annotation (
    Placement(transformation(extent = {{-64, -84}, {-96, -116}})));
  Buildings.Fluid.FixedResistances.Pipe chiller_3(redeclare package Medium =
        Buildings.Media.Water,                                                                      energyDynamics = Modelica.Fluid.Types.Dynamics.FixedInitial, massDynamics = Modelica.Fluid.Types.Dynamics.FixedInitial, allowFlowReversal = true, m_flow_nominal = chr_flow_nom, m_flow_small = 0.0001, nSeg = 10, thicknessIns = 0.1, lambdaIns = 0.1, length = chiller_pipe_len, v_nominal = chiller_v_nominal, roughness = chr_roughness, useMultipleHeatPorts = false) annotation (
    Placement(transformation(extent = {{-160, -120}, {-200, -80}})));
  Buildings.Fluid.FixedResistances.Junction jun_3(redeclare package Medium =
        Buildings.Media.Water,                                                                      m_flow_nominal = {100, -100, -100}, dp_nominal = {10, 0, 0}) annotation (
    Placement(transformation(extent = {{-14, -14}, {14, 14}}, rotation = -90, origin = {0, -100})));
  Buildings.Fluid.Movers.SpeedControlled_y chwp_4(redeclare package Medium =
        Buildings.Media.Water,                                                                      energyDynamics = Modelica.Fluid.Types.Dynamics.SteadyState, massDynamics = Modelica.Fluid.Types.Dynamics.SteadyState, p_start = 400000, redeclare Buildings.Fluid.Movers.Data.Pumps.Wilo.CronolineIL80slash220dash4slash4 per(pressure(V_flow = {0, 55.6, 111.4, 166.7, 219.2, 276.9, 333.1, 389.7}, dp = {634500, 625500, 617660, 608840, 597100, 577500, 548100, 503900}), power(V_flow = {0, 55.6, 111.4, 166.7, 219.2, 276.9, 333.1, 389.7}, P = {119188.42, 129804, 142486, 156660, 171580, 187992, 205150, 223800}), speed_rpm_nominal = 1480), addPowerToMedium = true) annotation (
    Placement(transformation(extent = {{-64, -164}, {-96, -196}})));
  Buildings.Fluid.FixedResistances.Pipe chiller_4(redeclare package Medium =
        Buildings.Media.Water,                                                                      energyDynamics = Modelica.Fluid.Types.Dynamics.FixedInitial, massDynamics = Modelica.Fluid.Types.Dynamics.FixedInitial, allowFlowReversal = true, m_flow_nominal = chr_flow_nom, m_flow_small = 0.0001, nSeg = 10, thicknessIns = 0.1, lambdaIns = 0.1, length = chiller_pipe_len, v_nominal = chiller_v_nominal, roughness = chr_roughness, useMultipleHeatPorts = false) annotation (
    Placement(transformation(extent = {{-160, -200}, {-200, -160}})));
  Buildings.Fluid.FixedResistances.Junction jun_4(redeclare package Medium =
        Buildings.Media.Water,                                                                      m_flow_nominal = {100, -100, 100}, dp_nominal = {10, 0, 10}) annotation (
    Placement(transformation(extent = {{14, 14}, {-14, -14}}, rotation = -90, origin = {-260, 60})));
  Buildings.Fluid.FixedResistances.Junction jun_5(redeclare package Medium =
        Buildings.Media.Water,                                                                      m_flow_nominal = {100, -100, 100}, dp_nominal = {10, 0, 10}) annotation (
    Placement(transformation(extent = {{14, 14}, {-14, -14}}, rotation = -90, origin = {-260, -20})));
  Buildings.Fluid.FixedResistances.Junction jun_6(redeclare package Medium =
        Buildings.Media.Water,                                                                      m_flow_nominal = {100, -100, 100}, dp_nominal = {10, 0, 10}) annotation (
    Placement(transformation(extent = {{14, 14}, {-14, -14}}, rotation = -90, origin = {-260, -100})));
  Buildings.Fluid.Sources.Boundary_pT chw_sup(redeclare package Medium =
        Buildings.Media.Water,                                                                  use_p_in = true, use_T_in = false, nPorts = 2) annotation (
    Placement(transformation(extent = {{-15, -15}, {15, 15}}, rotation = 180, origin = {161, 157})));
  Buildings.Fluid.Sensors.MassFlowRate chw_sup_m(redeclare package Medium =
        Buildings.Media.Water)                                                                     "Chille water supply mass flow rate (kg/s)" annotation (
    Placement(transformation(extent = {{-210, 128}, {-190, 148}})));
  Buildings.Fluid.Sensors.MassFlowRate chw_ret_m(redeclare package Medium =
        Buildings.Media.Water)                                                                     "Chille water return mass flow rate (kg/s)" annotation (
    Placement(transformation(extent = {{-10, -10}, {10, 10}}, rotation = 180, origin = {58, 84})));
  Modelica.Blocks.Sources.Constant pump_speed_1(k = 0) "Pump speed constant" annotation (
    Placement(transformation(extent = {{-288, -286}, {-268, -266}})));
  Buildings.Fluid.Sensors.Pressure chw_sup_P(redeclare package Medium =
        Buildings.Media.Water)                                                                 "Chilled water supply pressure" annotation (
    Placement(transformation(extent = {{-22, 152}, {-2, 172}})));
  Buildings.Fluid.Sensors.Pressure chw_ret_P(redeclare package Medium =
        Buildings.Media.Water)                                                                 "Chilled water return pressure" annotation (
    Placement(transformation(extent = {{18, 96}, {38, 116}})));
  Buildings.Fluid.Sensors.Pressure chw_term_P(redeclare package Medium =
        Buildings.Media.Water)                                                                  "Chilled water pressure after terminal" annotation (
    Placement(transformation(extent = {{82, 152}, {102, 172}})));
parameter Real chiller_pipe_len=86.56970089548908 "m";
parameter Real chiller_v_nominal=1.3693586129873054 "m/s";
  parameter Real jun_p1_dp=5000 "Pa";
  parameter Real jun_p2_dp = -5000 "Pa";
  parameter Real jun_p3_dp = -5000 "Pa";
  parameter Real chr_pipe_len = 50 "Equivilent length of pipe for chiller pressure drop (m)";
  parameter Real chr_flow_nom = 80 "Nominal flow rate of each chiller (kg/s)";
  parameter Real chr_roughness = 2.5e-5 "Roughness of the equivilent pipe of chiller (m)";
  Modelica.Blocks.Sources.Constant pump_speed_2(k = 0) "Pump speed constant" annotation (
    Placement(transformation(extent = {{-338, -280}, {-318, -260}})));
  Modelica.Blocks.Sources.Constant pump_speed_3(k = 0.5) "Pump speed constant" annotation (
    Placement(transformation(extent = {{-340, -318}, {-320, -298}})));
  Modelica.Blocks.Sources.Constant pump_speed_4(k = 0.5) "Pump speed constant" annotation (
    Placement(transformation(extent = {{-296, -324}, {-276, -304}})));
  Modelica.Blocks.Sources.Constant ret_p(k = 380000) "Return water pressure" annotation (
    Placement(transformation(extent = {{-10, -10}, {10, 10}}, rotation = 180, origin = {202, 102})));
  Buildings.Fluid.Actuators.Valves.TwoWayLinear terminal_resist(redeclare
      package                                                                     Medium =
        Buildings.Media.Water,                                                                                    m_flow_nominal = 1500, CvData = Buildings.Fluid.Types.CvTypes.OpPoint, dpValve_nominal = 200000, dpFixed_nominal = 0) annotation (
    Placement(transformation(extent = {{32, 128}, {52, 148}})));
  Modelica.Fluid.Valves.ValveIncompressible checkvalve_1(redeclare package Medium =
        Buildings.Media.Water,                                                                             dp_nominal(displayUnit = "Pa") = 1000, m_flow_nominal = chr_flow_nom, checkValve = true) annotation (
    Placement(transformation(extent = {{-116, 50}, {-136, 70}})));
  Modelica.Fluid.Valves.ValveIncompressible checkvalve_2(redeclare package Medium =
        Buildings.Media.Water,                                                                             dp_nominal(displayUnit = "Pa") = 1000, m_flow_nominal = chr_flow_nom, checkValve = true) annotation (
    Placement(transformation(extent = {{-118, -30}, {-138, -10}})));
  Modelica.Fluid.Valves.ValveIncompressible checkvalve_3(redeclare package Medium =
        Buildings.Media.Water,                                                                             dp_nominal(displayUnit = "Pa") = 1000, m_flow_nominal = chr_flow_nom, checkValve = true) annotation (
    Placement(transformation(extent = {{-116, -110}, {-136, -90}})));
  Modelica.Fluid.Valves.ValveIncompressible checkvalve_4(redeclare package Medium =
        Buildings.Media.Water,                                                                             dp_nominal(displayUnit = "Pa") = 1000, m_flow_nominal = chr_flow_nom, checkValve = true) annotation (
    Placement(transformation(extent = {{-116, -190}, {-136, -170}})));
  Modelica.Blocks.Sources.Constant const_1(k = 1) "A constant" annotation (
    Placement(visible = true, transformation(origin = {-16, 6}, extent = {{-248, -262}, {-228, -242}}, rotation = 0)));
  Buildings.Fluid.Actuators.Valves.TwoWayLinear chwp_val_1(redeclare package Medium =
        Buildings.Media.Water,                                                                               m_flow_nominal = chr_flow_nom, dpValve_nominal = 5000) annotation (
    Placement(transformation(extent = {{10, -10}, {-10, 10}}, rotation = 0, origin = {-42, 60})));
  Buildings.Fluid.Actuators.Valves.TwoWayLinear chwp_val_2(redeclare package Medium =
        Buildings.Media.Water,                                                                               m_flow_nominal = chr_flow_nom, dpValve_nominal = 5000) annotation (
    Placement(transformation(extent = {{10, -10}, {-10, 10}}, rotation = 0, origin = {-40, -20})));
  Buildings.Fluid.Actuators.Valves.TwoWayLinear chwp_val_3(redeclare package Medium =
        Buildings.Media.Water,                                                                               m_flow_nominal = chr_flow_nom, dpValve_nominal = 5000) annotation (
    Placement(transformation(extent = {{10, -10}, {-10, 10}}, rotation = 0, origin = {-40, -100})));
  Buildings.Fluid.Actuators.Valves.TwoWayLinear chwp_val_4(redeclare package Medium =
        Buildings.Media.Water,                                                                               m_flow_nominal = chr_flow_nom, dpValve_nominal = 5000) annotation (
    Placement(transformation(extent = {{10, -10}, {-10, 10}}, rotation = 0, origin = {-40, -180})));
  Modelica.Blocks.Sources.Constant val_pos_1(k = 0) "Valve position constant" annotation (
    Placement(transformation(extent = {{-254, -300}, {-234, -280}})));
  Modelica.Blocks.Sources.Constant val_pos_2(k = 0) "Valve position constant" annotation (
    Placement(transformation(extent = {{-256, -334}, {-236, -314}})));
  Modelica.Blocks.Sources.Constant val_pos_3(k = 1) "Valve position constant" annotation (
    Placement(transformation(extent = {{-210, -274}, {-190, -254}})));
  Modelica.Blocks.Sources.Constant val_pos_4(k = 1) "Valve position constant" annotation (
    Placement(transformation(extent = {{-210, -312}, {-190, -292}})));
  Buildings.Controls.Continuous.LimPID conPID(Ti = 25, controllerType = Modelica.Blocks.Types.SimpleController.PI, k = 0.000005, reverseActing = false, yMax = 1, yMin = 0.1) annotation (
    Placement(transformation(extent = {{8, 176}, {28, 196}})));
  Modelica.Blocks.Sources.Constant chw_sup_PSP(k = 440000) "Supply chilled water pressure setpoint" annotation (
    Placement(transformation(extent = {{-10, -10}, {10, 10}}, rotation = 0, origin = {-50, 180})));
  Modelica.Blocks.Math.Add difference annotation (
    Placement(visible = true, transformation(origin = {68, 184}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Abs sup_P_err annotation (
    Placement(visible = true, transformation(origin = {102, 184}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(jun_1.port_2, jun_2.port_1) annotation (
    Line(points = {{0, 46}, {0, -6}}, color = {0, 127, 255}));
  connect(jun_2.port_2, jun_3.port_1) annotation (
    Line(points = {{0, -34}, {0, -86}}, color = {0, 127, 255}));
  connect(chiller_1.port_b, jun_4.port_3) annotation (
    Line(points = {{-202, 60}, {-246, 60}}, color = {0, 127, 255}));
  connect(chiller_2.port_b, jun_5.port_3) annotation (
    Line(points = {{-200, -20}, {-246, -20}}, color = {0, 127, 255}));
  connect(chiller_3.port_b, jun_6.port_3) annotation (
    Line(points = {{-200, -100}, {-246, -100}}, color = {0, 127, 255}));
  connect(chiller_4.port_b, jun_6.port_1) annotation (
    Line(points = {{-200, -180}, {-260, -180}, {-260, -114}}, color = {0, 127, 255}));
  connect(jun_6.port_2, jun_5.port_1) annotation (
    Line(points = {{-260, -86}, {-260, -34}}, color = {0, 127, 255}));
  connect(jun_5.port_2, jun_4.port_1) annotation (
    Line(points = {{-260, -6}, {-260, 46}}, color = {0, 127, 255}));
  connect(jun_4.port_2, chw_sup_m.port_a) annotation (
    Line(points = {{-260, 74}, {-260, 137}, {-210, 138}}, color = {0, 127, 255}));
  connect(chw_ret.ports[1], chw_ret_m.port_a) annotation (
    Line(points = {{112, 87}, {112, 84}, {68, 84}}, color = {0, 127, 255}));
  connect(chw_ret_m.port_b, jun_1.port_1) annotation (
    Line(points = {{48, 84}, {4.32987e-15, 84}, {4.32987e-15, 74}}, color = {0, 127, 255}));
  connect(chw_ret_P.port, jun_1.port_1) annotation (
    Line(points = {{28, 96}, {28, 84}, {4.32987e-15, 84}, {4.32987e-15, 74}}, color = {0, 127, 255}));
  connect(chw_term_P.port, chw_sup.ports[1]) annotation (
    Line(points = {{92, 152}, {92, 138}, {132, 138}, {132, 154}, {146, 154}}, color = {0, 127, 255}));
  connect(pump_speed_1.y, chwp_1.y) annotation (
    Line(points = {{-267, -276}, {-212, -276}, {-212, 24}, {-80, 24}, {-80, 40.8}}, color = {0, 0, 127}));
  connect(pump_speed_2.y, chwp_2.y) annotation (
    Line(points = {{-317, -270}, {-288, -270}, {-288, -76}, {-224, -76}, {-224, -52}, {-104, -52}, {-104, -39.2}, {-80, -39.2}}, color = {0, 0, 127}));
  connect(pump_speed_3.y, chwp_3.y) annotation (
    Line(points = {{-319, -308}, {-284, -308}, {-284, -176}, {-228, -176}, {-228, -132}, {-104, -132}, {-104, -119.2}, {-80, -119.2}}, color = {0, 0, 127}));
  connect(pump_speed_4.y, chwp_4.y) annotation (
    Line(points = {{-275, -314}, {-80, -314}, {-80, -199.2}}, color = {0, 0, 127}));
  connect(ret_p.y, chw_ret.p_in) annotation (
    Line(points = {{191, 102}, {160, 102}, {160, 64}, {145, 64}, {145, 75}}, color = {0, 0, 127}));
  connect(chw_sup_m.port_b, terminal_resist.port_a) annotation (
    Line(points = {{-190, 138}, {32, 138}}, color = {0, 127, 255}));
  connect(chw_sup_P.port, terminal_resist.port_a) annotation (
    Line(points = {{-12, 152}, {-12, 138}, {32, 138}}, color = {0, 127, 255}));
  connect(terminal_resist.port_b, chw_sup.ports[2]) annotation (
    Line(points = {{52, 138}, {132, 138}, {132, 160}, {146, 160}}, color = {0, 127, 255}));
  connect(chwp_1.port_b, checkvalve_1.port_a) annotation (
    Line(points = {{-96, 60}, {-116, 60}}, color = {0, 127, 255}));
  connect(checkvalve_1.port_b, chiller_1.port_a) annotation (
    Line(points = {{-136, 60}, {-162, 60}}, color = {0, 127, 255}));
  connect(chwp_2.port_b, checkvalve_2.port_a) annotation (
    Line(points = {{-96, -20}, {-118, -20}}, color = {0, 127, 255}));
  connect(checkvalve_2.port_b, chiller_2.port_a) annotation (
    Line(points = {{-138, -20}, {-160, -20}}, color = {0, 127, 255}));
  connect(chwp_3.port_b, checkvalve_3.port_a) annotation (
    Line(points = {{-96, -100}, {-116, -100}}, color = {0, 127, 255}));
  connect(checkvalve_3.port_b, chiller_3.port_a) annotation (
    Line(points = {{-136, -100}, {-160, -100}}, color = {0, 127, 255}));
  connect(chwp_4.port_b, checkvalve_4.port_a) annotation (
    Line(points = {{-96, -180}, {-116, -180}}, color = {0, 127, 255}));
  connect(checkvalve_4.port_b, chiller_4.port_a) annotation (
    Line(points = {{-136, -180}, {-160, -180}}, color = {0, 127, 255}));
  connect(const_1.y, checkvalve_4.opening) annotation (
    Line(points = {{-243, -246}, {-232, -246}, {-232, -160}, {-126, -160}, {-126, -172}}, color = {0, 0, 127}));
  connect(const_1.y, checkvalve_3.opening) annotation (
    Line(points = {{-243, -246}, {-234, -246}, {-234, -66}, {-124, -66}, {-124, -64}, {-122, -64}, {-122, -66}, {-124, -66}, {-124, -86}, {-126, -86}, {-126, -92}}, color = {0, 0, 127}));
  connect(const_1.y, checkvalve_2.opening) annotation (
    Line(points = {{-243, -246}, {-234, -246}, {-234, 4}, {-128, 4}, {-128, -12}}, color = {0, 0, 127}));
  connect(const_1.y, checkvalve_1.opening) annotation (
    Line(points = {{-243, -246}, {-234, -246}, {-234, 88}, {-126, 88}, {-126, 68}}, color = {0, 0, 127}));
  connect(jun_1.port_3, chwp_val_1.port_a) annotation (
    Line(points = {{-14, 60}, {-32, 60}}, color = {0, 127, 255}));
  connect(chwp_val_1.port_b, chwp_1.port_a) annotation (
    Line(points = {{-52, 60}, {-64, 60}}, color = {0, 127, 255}));
  connect(jun_2.port_3, chwp_val_2.port_a) annotation (
    Line(points = {{-14, -20}, {-30, -20}}, color = {0, 127, 255}));
  connect(chwp_val_2.port_b, chwp_2.port_a) annotation (
    Line(points = {{-50, -20}, {-64, -20}}, color = {0, 127, 255}));
  connect(jun_3.port_3, chwp_val_3.port_a) annotation (
    Line(points = {{-14, -100}, {-30, -100}}, color = {0, 127, 255}));
  connect(chwp_val_3.port_b, chwp_3.port_a) annotation (
    Line(points = {{-50, -100}, {-64, -100}}, color = {0, 127, 255}));
  connect(jun_3.port_2, chwp_val_4.port_a) annotation (
    Line(points = {{0, -114}, {0, -180}, {-30, -180}}, color = {0, 127, 255}));
  connect(chwp_val_4.port_b, chwp_4.port_a) annotation (
    Line(points = {{-50, -180}, {-64, -180}}, color = {0, 127, 255}));
  connect(val_pos_1.y, chwp_val_1.y) annotation (
    Line(points = {{-233, -290}, {-142, -290}, {-142, -244}, {14, -244}, {14, 90}, {-42, 90}, {-42, 72}}, color = {0, 0, 127}));
  connect(val_pos_2.y, chwp_val_2.y) annotation (
    Line(points = {{-235, -324}, {-144, -324}, {-144, -284}, {14, -284}, {14, 4}, {-40, 4}, {-40, -8}}, color = {0, 0, 127}));
  connect(val_pos_3.y, chwp_val_3.y) annotation (
    Line(points = {{-189, -264}, {-104, -264}, {-104, -238}, {14, -238}, {14, -78}, {-40, -78}, {-40, -88}}, color = {0, 0, 127}));
  connect(val_pos_4.y, chwp_val_4.y) annotation (
    Line(points = {{-189, -302}, {14, -302}, {14, -156}, {-40, -156}, {-40, -168}}, color = {0, 0, 127}));
  connect(ret_p.y, chw_sup.p_in) annotation (
    Line(points = {{191, 102}, {179, 102}, {179, 145}}, color = {0, 0, 127}));
  connect(conPID.y, terminal_resist.y) annotation (
    Line(points = {{29, 186}, {40, 186}, {40, 160}, {42, 160}, {42, 150}}, color = {0, 0, 127}));
  connect(chw_sup_P.p, conPID.u_m) annotation (
    Line(points = {{-1, 162}, {18, 162}, {18, 174}}, color = {0, 0, 127}));
  connect(chw_sup_PSP.y, conPID.u_s) annotation (
    Line(points = {{-39, 180}, {-17.5, 180}, {-17.5, 186}, {6, 186}}, color = {0, 0, 127}));
  connect(chw_sup_P.p, difference.u2) annotation (
    Line(points={{-1,162},{48,162},{48,178},{56,178}},         color = {0, 0, 127}));
  connect(chw_sup_PSP.y, difference.u1) annotation (
    Line(points={{-39,180},{-24,180},{-24,202},{50,202},{50,190},{56,190}},              color = {0, 0, 127}));
  connect(difference.y, sup_P_err.u) annotation (
    Line(points={{79,184},{90,184}},      color = {0, 0, 127}));
  annotation (
    Diagram(coordinateSystem(extent = {{-360, -340}, {220, 200}}), graphics={  Rectangle(lineColor = {28, 108, 200}, fillColor = {255, 255, 170},
            fillPattern =                                                                                                                                       FillPattern.Solid, extent = {{-360, -226}, {-180, -340}}), Text(extent = {{-356, -234}, {-256, -268}}, textString = "Control Signals
    ")}),
    Icon(coordinateSystem(extent = {{-360, -340}, {220, 200}})),
    uses(Buildings(version = "8.1.0"), Modelica(version = "3.2.3")),
    version = "1",
    conversion(noneFromVersion = ""));
end nb_hydr_static_v6;
