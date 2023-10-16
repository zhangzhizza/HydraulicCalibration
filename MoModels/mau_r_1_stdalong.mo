within ;
model mau_r_1_stdalong
   parameter Real mau_chw_m_nominal=11
    "Nominal mass flow rate of MAU chilled water (kg/s)";
  parameter Real mau_chwp_dp_nominal=100000
                                           "Nominal dp of MAU chilled water pump (Pa)";
  parameter Real mau_air_m_nominal=4   "Nominal air flow rate of MAU (kg/s)";
  Buildings.Fluid.Sources.Boundary_pT cold_water_in(
    redeclare package Medium = Buildings.Media.Water,
    use_T_in=true,
    nPorts=1) "Fluid source"  annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={-156,60})));
  Buildings.Fluid.Sources.Boundary_pT air_in(
    redeclare package Medium = Buildings.Media.Air,
    use_Xi_in=true,
    use_T_in=true,
    T=301.15,
    nPorts=1) "Fluid source" annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={-216,-64})));
  Buildings.Utilities.Psychrometrics.X_pTphi x_pTphi(use_p_in=false)
    annotation (Placement(transformation(extent={{-250,-154},{-230,-134}})));
  Buildings.Fluid.Movers.FlowControlled_m_flow mau_chw_pump(
    redeclare package Medium = Buildings.Media.Water,
    m_flow_nominal=mau_chw_m_nominal,
    dp_nominal=mau_chwp_dp_nominal)
                               annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=270,
        origin={-156,12})));

  HVAC.MAUSingleCoil_air_m mau_r_1(
    redeclare package MediumAir = Buildings.Media.Air,
    redeclare package MediumWater1 = Buildings.Media.Water,
    air_flow_nominal=mau_air_m_nominal,
    water1_flow_nominal=mau_chw_m_nominal,
    fan_per=mau_fan_per,
    coil1_UA=2200,
    coil1_water_dp_nominal=50000,
    coil1_air_dp_nominal=50,
    fan_dp_nominal=850,
    resis_dp_nominal=50)
    annotation (Placement(transformation(extent={{-176,-80},{-78,-38}})));
  Modelica.Blocks.Math.Add add1(k2=+1) annotation (Placement(transformation(
        extent={{-7,-7},{7,7}},
        rotation=270,
        origin={-155,87})));
  Modelica.Blocks.Sources.Constant const1(k=273.15)
    annotation (Placement(transformation(extent={{-188,94},{-176,106}})));
  Modelica.Blocks.Math.Add add2(k2=+1) annotation (Placement(transformation(
        extent={{-7,-7},{7,7}},
        rotation=0,
        origin={-265,-89})));
  Modelica.Blocks.Sources.Constant const2(k=273.15)
    annotation (Placement(transformation(extent={{-304,-76},{-292,-64}})));
  Buildings.Fluid.Sources.Boundary_pT cold_water_out(
    redeclare package Medium = Buildings.Media.Water,
    use_T_in=false,
    nPorts=1) "Fluid source" annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={-46,98})));
  Modelica.Blocks.Interfaces.RealInput oat "Outdoor air temperature input"
    annotation (Placement(transformation(extent={{-342,-116},{-302,-76}})));
  Modelica.Blocks.Interfaces.RealInput oarh "Outdoor air RH input"
    annotation (Placement(transformation(extent={{-342,-156},{-302,-116}})));
  Modelica.Blocks.Interfaces.RealInput chw_T_in
    "Chilled water inlet temperature" annotation (Placement(transformation(
        extent={{-20,-20},{20,20}},
        rotation=270,
        origin={-152,128})));
  Modelica.Blocks.Interfaces.RealInput mau_chw_m
    "MAU chilled water flow (kg/s)"
    annotation (Placement(transformation(extent={{-344,16},{-304,56}})));
  Modelica.Blocks.Interfaces.RealInput mau_fan_m "MAU fan speed ratio"
    annotation (Placement(transformation(extent={{-344,-38},{-304,2}})));
  Buildings.Fluid.Sources.Boundary_pT air_sink(
    redeclare package Medium = Buildings.Media.Air,
    use_T_in=false,
    nPorts=1) "Air sink" annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={-12,-54})));
  parameter Buildings.Fluid.Movers.Data.Generic mau_fan_per(
    pressure(V_flow={1.95,2.925,3.901,4.063,4.876,5.851,6.501}, dp={1080,1050,880,
          850,650,300,0}),
    use_powerCharacteristic=true,
    power(V_flow={5e-07,0.9751,1.95,2.925,3.901,4.876,5.851,6.501}, P={1300,2250,
          3150,3750,4340,4450,4250,3750}),
    speed_rpm_nominal=1343)
    annotation (Placement(transformation(extent={{-106,-118},{-86,-98}})));
equation
  connect(x_pTphi.X[1],air_in. Xi_in[1]) annotation (Line(points={{-229,-144},{-222,
          -144},{-222,-82},{-234,-82},{-234,-68},{-228,-68}},
                                                         color={0,0,127}));
  connect(cold_water_in.ports[1],mau_chw_pump. port_a) annotation (Line(points={{-156,50},
          {-154,50},{-154,26},{-156,26},{-156,22}},         color={0,127,255}));
  connect(oarh,x_pTphi. phi) annotation (Line(points={{-322,-136},{-260,-136},{-260,
          -150},{-252,-150}},
                           color={0,0,127}));
  connect(air_in.ports[1], mau_r_1.air_port_a) annotation (Line(points={{-206,-64},
          {-184,-64},{-184,-59.42},{-177.568,-59.42}}, color={0,127,255}));
  connect(mau_chw_pump.port_b, mau_r_1.water_port_a1) annotation (Line(points={{
          -156,2},{-156,-32},{-160,-32},{-160,-36},{-158.36,-36},{-158.36,-39.26}},
        color={0,127,255}));
  connect(mau_chw_m,mau_chw_pump. m_flow_in) annotation (Line(points={{-324,36},
          {-176,36},{-176,12},{-168,12}},color={0,0,127}));
  connect(chw_T_in,add1. u1) annotation (Line(points={{-152,128},{-152,100},{-150.8,
          100},{-150.8,95.4}},
                         color={0,0,127}));
  connect(const1.y,add1. u2) annotation (Line(points={{-175.4,100},{-168,100},{-168,
          95.4},{-159.2,95.4}},
                        color={0,0,127}));
  connect(const2.y,add2. u1) annotation (Line(points={{-291.4,-70},{-282,-70},{-282,
          -84.8},{-273.4,-84.8}},
                              color={0,0,127}));
  connect(oat,add2. u2) annotation (Line(points={{-322,-96},{-322,-94},{-273.4,-94},
          {-273.4,-93.2}},color={0,0,127}));
  connect(add2.y,air_in. T_in) annotation (Line(points={{-257.3,-89},{-236,-89},
          {-236,-60},{-228,-60}},
                     color={0,0,127}));
  connect(add2.y,x_pTphi. T) annotation (Line(points={{-257.3,-89},{-248,-89},{-248,
          -128},{-256,-128},{-256,-144},{-252,-144}},
                                          color={0,0,127}));
  connect(add1.y,cold_water_in. T_in) annotation (Line(points={{-155,79.3},{-155,
          76},{-140,76},{-140,72},{-152,72}},
                                       color={0,0,127}));
  connect(mau_r_1.water_port_b1, cold_water_out.ports[1]) annotation (Line(
        points={{-157.968,-79.16},{-157.968,-94},{-46,-94},{-46,88}},
                                                           color={0,127,255}));
  connect(mau_fan_m, mau_r_1.m_flow_air) annotation (Line(points={{-324,-18},{
          -94,-18},{-94,-36},{-93.288,-36},{-93.288,-35.06}},
                                                color={0,0,127}));
  connect(mau_r_1.air_port_b, air_sink.ports[1]) annotation (Line(points={{
          -82.312,-59},{-28,-59},{-28,-54},{-22,-54}}, color={0,127,255}));
  annotation (
    Icon(coordinateSystem(preserveAspectRatio=false, extent={{-300,-160},{60,
            120}})),
    Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-300,-160},{60,
            120}})),
    uses(Buildings(version="8.0.0"), Modelica(version="4.0.0")));
end mau_r_1_stdalong;
