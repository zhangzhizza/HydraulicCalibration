within HVAC;
model MAUSingleCoil_air_m
  "Make-up air unit with a single water coil and electric reheat coil"
  extends HVAC.PartialAHUOneCoilInterface;
    //constrainedby Buildings.Fluid.Movers.Data.Generic

  parameter Real air_flow_nominal "Nominal air flow rate (kg/s)"
  annotation(Dialog(group="Nominal condition"));
  parameter Real coil1_UA "Coil 1 UA value (w/k)";
  parameter Real coil1_water_dp_nominal "Nominal Dp of water in coil 1 (Pa)"
  annotation(Dialog(group="Nominal condition"));
  parameter Real coil1_air_dp_nominal "Nominal Dp of air across coil 1 (Pa)"
  annotation(Dialog(group="Nominal condition"));
  parameter Real water1_flow_nominal "Nominal flow rate of water in coil 1 (kg/s)"
  annotation(Dialog(group="Nominal condition"));


  Buildings.Fluid.HeatExchangers.WetCoilCounterFlow coil1(
    redeclare package Medium1 = MediumWater1,
    redeclare package Medium2 = MediumAir,
    UA_nominal=coil1_UA,
    dp1_nominal=coil1_water_dp_nominal,
    dp2_nominal=coil1_air_dp_nominal,
    m1_flow_nominal=water1_flow_nominal,
    m2_flow_nominal=air_flow_nominal) "First coil" annotation (Placement(
        visible=true, transformation(
        origin={40,12},
        extent={{10,10},{-10,-10}},
        rotation=90)));
  Buildings.Fluid.Sensors.TemperatureTwoPort sen_T_bfcoil1(redeclare package
      Medium = MediumAir, m_flow_nominal=air_flow_nominal)
    "Temperature sensor before the first coil"
    annotation (Placement(transformation(extent={{-22,-12},{-2,8}})));
  Buildings.Fluid.Sensors.RelativeHumidityTwoPort sen_RH_bfcoil1(redeclare
      package Medium = MediumAir, m_flow_nominal=air_flow_nominal)
    "RH sensor before the first coil" annotation (Placement(transformation(
        extent={{7,-7},{-7,7}},
        rotation=180,
        origin={-45,1})));
  Buildings.Fluid.Sensors.MassFractionTwoPort sen_HR_bfcoil1(redeclare package
      Medium = MediumAir, m_flow_nominal=air_flow_nominal)
    "Humidity ratio sensor before the first coil"
    annotation (Placement(transformation(extent={{-78,-6},{-64,8}})));
  Buildings.Fluid.Sensors.TemperatureTwoPort sen_T_afcoil2(redeclare package
      Medium = MediumAir, m_flow_nominal=air_flow_nominal)
    "Temperature sensor after the second coil"
    annotation (Placement(transformation(extent={{248,-8},{268,12}})));
  Buildings.Fluid.Sensors.RelativeHumidityTwoPort sen_RH_afcoil2(redeclare
      package Medium = MediumAir, m_flow_nominal=air_flow_nominal)
    "RH sensor after the first coil"
    annotation (Placement(transformation(
        extent={{7,-7},{-7,7}},
        rotation=180,
        origin={307,1})));
  Buildings.Fluid.Sensors.MassFractionTwoPort sen_HR_afcoil2(redeclare package
      Medium = MediumAir, m_flow_nominal=air_flow_nominal)
    "Humidity ratio sensor after the first coil"
    annotation (Placement(transformation(extent={{278,-6},{292,10}})));
  Modelica.Blocks.Interfaces.RealInput m_flow_air(final unit="kg/s", nominal=
        air_flow_nominal) "Fan speed ratio"                  annotation (
      Placement(transformation(
        extent={{-20,-20},{20,20}},
        rotation=-90,
        origin={314,120}), iconTransformation(
        extent={{-20,-20},{20,20}},
        rotation=-90,
        origin={322,114})));
  parameter Real fan_dp_nominal "Nominal fan differential pressure (Pa)"
    annotation (Dialog(group="Nominal condition"));

  Buildings.Fluid.FixedResistances.PressureDrop resistance(
    redeclare package Medium = MediumAir,
    m_flow_nominal=air_flow_nominal,
    dp_nominal=resis_dp_nominal) "Air resistance caused by filter"
    annotation (Placement(transformation(extent={{4,-12},{24,8}})));
  parameter Real resis_dp_nominal "Nominal Dp of air resistance (Pa)"
    annotation (Dialog(group="Nominal condition"));
  Buildings.Fluid.Sensors.MassFlowRate sen_air_m(redeclare package Medium =
        MediumAir) "Air flow rate sensor"
    annotation (Placement(transformation(extent={{320,-6},{332,6}})));
  Buildings.Fluid.Sensors.TemperatureTwoPort sen_Tw_bfcoil1(redeclare package
      Medium = MediumWater1, m_flow_nominal=water1_flow_nominal)
    "Temperature sensor of water after the first coil"
                                              annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={-10,54})));
  Buildings.Fluid.Sensors.TemperatureTwoPort sen_Tw_afcoil1(redeclare package
      Medium = MediumWater1, m_flow_nominal=water1_flow_nominal)
    "Temperature sensor of water after the first coil"
                                              annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={46,-44})));
  Buildings.Fluid.Sensors.MassFlowRate sen_wat1_m(redeclare package Medium =
        MediumWater1) "Water flow rate sensor"
    annotation (Placement(transformation(extent={{-6,-6},{6,6}},
        rotation=270,
        origin={-10,80})));
  Buildings.Fluid.Movers.FlowControlled_m_flow fan1(
    redeclare package Medium = MediumAir,
    m_flow_nominal=air_flow_nominal,
    per = fan_per,
    dp_nominal=fan_dp_nominal)
    annotation (Placement(transformation(extent={{342,-10},{362,10}})));
 replaceable parameter Buildings.Fluid.Movers.Data.Generic fan_per
    "Record with performance data"
    annotation (choicesAllMatching=true,
      Placement(transformation(extent={{350,42},{370,62}})));
equation
  connect(sen_RH_bfcoil1.port_b, sen_T_bfcoil1.port_a)
    annotation (Line(points={{-38,1},{-38,-2},{-22,-2}}, color={0,127,255}));
  connect(sen_HR_bfcoil1.port_b, sen_RH_bfcoil1.port_a) annotation (Line(points={{-64,1},
          {-52,1}},                         color={0,127,255}));
  connect(sen_T_afcoil2.port_b, sen_HR_afcoil2.port_a)
    annotation (Line(points={{268,2},{278,2}}, color={0,127,255}));
  connect(sen_HR_afcoil2.port_b, sen_RH_afcoil2.port_a) annotation (Line(points=
         {{292,2},{296,2},{296,1},{300,1}}, color={0,127,255}));
  connect(air_port_a, sen_HR_bfcoil1.port_a) annotation (Line(points={{-108,-2},
          {-84,-2},{-84,1},{-78,1}}, color={0,127,255}));
  connect(sen_T_bfcoil1.port_b, resistance.port_a)
    annotation (Line(points={{-2,-2},{4,-2}}, color={0,127,255}));
  connect(resistance.port_b, coil1.port_a2) annotation (Line(points={{24,-2},{26,
          -2},{26,-4},{34,-4},{34,2}}, color={0,127,255}));
  connect(sen_RH_afcoil2.port_b, sen_air_m.port_a)
    annotation (Line(points={{314,1},{314,0},{320,0}}, color={0,127,255}));
  connect(sen_Tw_bfcoil1.port_b, coil1.port_a1) annotation (Line(points={{-10,44},
          {-10,30},{46,30},{46,22}}, color={0,127,255}));
  connect(coil1.port_b1, sen_Tw_afcoil1.port_a)
    annotation (Line(points={{46,2},{46,-34}}, color={0,127,255}));
  connect(sen_Tw_afcoil1.port_b, water_port_b1) annotation (Line(points={{46,-54},
          {46,-82},{-8,-82},{-8,-96}}, color={0,127,255}));
  connect(water_port_a1, sen_wat1_m.port_a)
    annotation (Line(points={{-10,94},{-10,86}}, color={0,127,255}));
  connect(sen_wat1_m.port_b, sen_Tw_bfcoil1.port_a)
    annotation (Line(points={{-10,74},{-10,64}}, color={0,127,255}));
  connect(m_flow_air, fan1.m_flow_in) annotation (Line(points={{314,120},{334,120},
          {334,12},{352,12}}, color={0,0,127}));
  connect(fan1.port_b, air_port_b)
    annotation (Line(points={{362,0},{378,0}}, color={0,127,255}));
  connect(sen_air_m.port_b, fan1.port_a)
    annotation (Line(points={{332,0},{342,0}}, color={0,127,255}));
  connect(coil1.port_b2, sen_T_afcoil2.port_a) annotation (Line(points={{34,22},
          {52,22},{52,28},{70,28},{70,2},{248,2}}, color={0,127,255}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},
            {400,100}}), graphics={
        Ellipse(
          extent={{248,60},{368,-60}},
          lineColor={0,0,0},
          lineThickness=1,
          fillColor={215,215,215},
          fillPattern=FillPattern.Solid),
        Polygon(
          points={{276,48},{276,-48},{368,0},{276,48}},
          lineColor={0,0,0},
          lineThickness=1,
          fillColor={0,0,0},
          fillPattern=FillPattern.Solid),
        Rectangle(
          extent={{-12,90},{-6,62}},
          lineColor={0,0,255},
          fillColor={0,0,255},
          fillPattern=FillPattern.Solid),
        Rectangle(
          extent={{-10,-60},{-4,-88}},
          lineColor={0,0,255},
          fillColor={0,0,255},
          fillPattern=FillPattern.Solid)}),                      Diagram(
        coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{400,100}})),
    uses(Modelica(version="4.0.0"), Buildings(version="8.0.0")),
    Documentation(
   info="<html>
<p>
This is a make-up air unit with a single water coil. Air flow rate is determined by inputing fan speed ratio, and water flow rate is directly determined by input mass flow rate. 
</p>
</html>",
      revisions="<html>
<ul>
<li>
Apr 21, 2022, by Zhiang Zhang:<br/>
First creation.
</li>
</ul>
</html>"));
end MAUSingleCoil_air_m;
