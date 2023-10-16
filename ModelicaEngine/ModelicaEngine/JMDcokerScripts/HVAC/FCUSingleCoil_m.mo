model FCUSingleCoil_m
  extends Buildings.Fluid.Interfaces.PartialFourPortInterface(show_T=false);
  replaceable parameter Buildings.Fluid.Movers.Data.Generic per1
    constrainedby Buildings.Fluid.Movers.Data.Generic
    "Record with performance data"
    annotation (choicesAllMatching=true,
      Placement(transformation(extent={{52,60},{72,80}})));
  replaceable parameter Buildings.Fluid.Movers.Data.Generic per2
    constrainedby Buildings.Fluid.Movers.Data.Generic
    "Record with performance data"
    annotation (choicesAllMatching=true,
      Placement(transformation(extent={{52,30},{72,50}})));
  parameter Modelica.SIunits.PressureDifference dp_nominal_1
  "Dp of mover 1 (Pa)"
  annotation(Dialog(group = "Nominal condition"));
  parameter Modelica.SIunits.PressureDifference dp_nominal_2
  "Dp of mover 2 (Pa)"
  annotation(Dialog(group = "Nominal condition"));
  parameter Real fcu_UA_nominal "Nominal UA of the FCU cooling coil"
  annotation(Dialog(group="Nominal condition"));
  Buildings.Fluid.Movers.FlowControlled_m_flow mover2(
    redeclare package Medium = Medium2,
    per=per2,
    m_flow_nominal=m2_flow_nominal,
    dp_nominal=dp_nominal_2)
    annotation (Placement(transformation(extent={{38,-34},{18,-14}})));
  Buildings.Fluid.HeatExchangers.WetCoilCounterFlow fcu2_coil(
    redeclare package Medium1 = Medium1,
    redeclare package Medium2 = Medium2,
    UA_nominal=fcu_UA_nominal,
    dp1_nominal=dp_nominal_1,
    dp2_nominal=dp_nominal_2,
    m1_flow_nominal=m1_flow_nominal,
    m2_flow_nominal=m2_flow_nominal)
                       annotation (Placement(visible=true, transformation(
        origin={-12,-18},
        extent={{-10,-10},{10,10}},
        rotation=0)));
  Buildings.Fluid.Movers.FlowControlled_m_flow mover1(
    redeclare package Medium = Medium1,
    per=per1,
    m_flow_nominal=m1_flow_nominal,
    dp_nominal=dp_nominal_1) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={-38,24})));
  Modelica.Blocks.Interfaces.RealInput m_flow_1(final unit="kg/s", nominal=
        m1_flow_nominal) "Prescribed mass flow rate (kg/s)"
                                annotation (Placement(transformation(
        extent={{-20,-20},{20,20}},
        rotation=-90,
        origin={0,120})));
  Modelica.Blocks.Interfaces.RealInput m_flow_2(final unit="kg/s", nominal=
        m2_flow_nominal) "Prescribed mass flow rate (kg/s)"
                                annotation (Placement(transformation(
        extent={{-20,-20},{20,20}},
        rotation=90,
        origin={0,-120})));
  Buildings.Fluid.Sensors.TemperatureTwoPort sen_T_porta1(redeclare package
      Medium = Medium1, m_flow_nominal=m1_flow_nominal)
    "Temperature sensor at port a1"
    annotation (Placement(transformation(extent={{-70,50},{-50,70}})));
  Buildings.Fluid.Sensors.TemperatureTwoPort sen_T_portb1(redeclare package
      Medium = Medium1, m_flow_nominal=m1_flow_nominal)
    "Temperature sensor at port b1"
    annotation (Placement(transformation(extent={{22,46},{42,66}})));
  Buildings.Fluid.Sensors.TemperatureTwoPort sen_T_porta2(redeclare package
      Medium = Medium2, m_flow_nominal=m2_flow_nominal)
    "Temperature sensor at port a2"
    annotation (Placement(transformation(extent={{72,-34},{52,-14}})));
  Buildings.Fluid.Sensors.TemperatureTwoPort sen_T_portb2(redeclare package
      Medium = Medium2, m_flow_nominal=m2_flow_nominal)
    "Temperature sensor at port a2"
    annotation (Placement(transformation(extent={{-52,-34},{-72,-14}})));
  Buildings.Fluid.Sensors.MassFlowRate sen_medium1_m(redeclare package Medium =
        Medium1) "Medium1 flow rate sensor"
    annotation (Placement(transformation(extent={{-44,56},{-32,68}})));
  Buildings.Fluid.Sensors.MassFlowRate sen_medium2_m(redeclare package Medium =
        Medium2) "Medium2 flow rate sensor"
    annotation (Placement(transformation(extent={{-34,-30},{-46,-18}})));
  Buildings.Fluid.Sensors.MassFractionTwoPort sen_HR_porta2(redeclare package
      Medium = Medium2, m_flow_nominal=m2_flow_nominal)
    "Humidity ratio sensor at port a2" annotation (Placement(transformation(
        extent={{6,-6},{-6,6}},
        rotation=270,
        origin={86,-40})));
  Buildings.Fluid.Sensors.MassFractionTwoPort sen_HR_portb2(redeclare package
      Medium = Medium2, m_flow_nominal=m2_flow_nominal)
    "Humidity ratio sensor at port b2" annotation (Placement(transformation(
        extent={{6,-6},{-6,6}},
        rotation=90,
        origin={-88,-38})));
equation
  connect(mover2.port_b, fcu2_coil.port_a2)
    annotation (Line(points={{18,-24},{-2,-24}}, color={0,127,255}));
  connect(mover1.port_b, fcu2_coil.port_a1) annotation (Line(points={{-38,14},{-38,
          -12},{-22,-12}}, color={0,127,255}));
  connect(m_flow_1, mover1.m_flow_in)
    annotation (Line(points={{0,120},{0,24},{-26,24}}, color={0,0,127}));
  connect(m_flow_2, mover2.m_flow_in) annotation (Line(points={{0,-120},{0,-40},
          {42,-40},{42,-6},{28,-6},{28,-12}},                 color={0,0,127}));
  connect(fcu2_coil.port_b1, sen_T_portb1.port_a) annotation (Line(points={{-2,-12},
          {12,-12},{12,56},{22,56}}, color={0,127,255}));
  connect(mover2.port_a, sen_T_porta2.port_b)
    annotation (Line(points={{38,-24},{52,-24}}, color={0,127,255}));
  connect(sen_T_porta1.port_b, sen_medium1_m.port_a)
    annotation (Line(points={{-50,60},{-46,60},{-46,62},{-44,62}},
                                                 color={0,127,255}));
  connect(sen_medium1_m.port_b, mover1.port_a)
    annotation (Line(points={{-32,62},{-28,62},{-28,48},{-38,48},{-38,34}},
                                                          color={0,127,255}));
  connect(fcu2_coil.port_b2, sen_medium2_m.port_a)
    annotation (Line(points={{-22,-24},{-34,-24}}, color={0,127,255}));
  connect(sen_medium2_m.port_b, sen_T_portb2.port_a)
    annotation (Line(points={{-46,-24},{-52,-24}}, color={0,127,255}));
  connect(sen_T_porta2.port_a, sen_HR_porta2.port_b)
    annotation (Line(points={{72,-24},{86,-24},{86,-34}}, color={0,127,255}));
  connect(sen_HR_porta2.port_a, port_a2)
    annotation (Line(points={{86,-46},{86,-60},{100,-60}}, color={0,127,255}));
  connect(sen_T_portb2.port_b, sen_HR_portb2.port_a) annotation (Line(points={{-72,-24},
          {-88,-24},{-88,-32}},      color={0,127,255}));
  connect(sen_HR_portb2.port_b, port_b2) annotation (Line(points={{-88,-44},{
          -88,-60},{-100,-60}},
                            color={0,127,255}));
  connect(port_a1, sen_T_porta1.port_a)
    annotation (Line(points={{-100,60},{-70,60}}, color={0,127,255}));
  connect(sen_T_portb1.port_b, port_b1) annotation (Line(points={{42,56},{84,56},
          {84,60},{100,60}}, color={0,127,255}));
  annotation (
    Icon(coordinateSystem(preserveAspectRatio=false), graphics={
        Rectangle(
          extent={{-90,88},{90,-88}},
          lineColor={28,108,200},
          lineThickness=1,
          fillColor={215,215,215},
          fillPattern=FillPattern.Solid),
        Rectangle(
          extent={{-80,80},{80,-80}},
          lineColor={28,108,200},
          lineThickness=1,
          fillColor={170,213,255},
          fillPattern=FillPattern.Solid),
        Rectangle(
          extent={{-60,60},{60,-60}},
          lineColor={28,108,200},
          lineThickness=1,
          fillColor={175,175,175},
          fillPattern=FillPattern.Solid),
        Line(
          points={{-60,40},{60,40}},
          color={28,108,200},
          thickness=1),
        Line(
          points={{-60,20},{60,20}},
          color={28,108,200},
          thickness=1),
        Line(
          points={{-60,0},{60,0}},
          color={28,108,200},
          thickness=1),
        Line(
          points={{-60,-20},{60,-20}},
          color={28,108,200},
          thickness=1),
        Line(
          points={{-60,-40},{60,-40}},
          color={28,108,200},
          thickness=1),
        Line(
          points={{-40,60},{-40,-60}},
          color={28,108,200},
          thickness=1),
        Line(
          points={{-20,60},{-20,-60}},
          color={28,108,200},
          thickness=1),
        Line(
          points={{0,60},{0,-60}},
          color={28,108,200},
          thickness=1),
        Line(
          points={{20,60},{20,-60}},
          color={28,108,200},
          thickness=1),
        Line(
          points={{40,60},{40,-60}},
          color={28,108,200},
          thickness=1)}),
    Diagram(coordinateSystem(preserveAspectRatio=false)),
    uses(Buildings(version="8.0.0"), Modelica(version="4.0.0")),
    Documentation(
   info="<html>
<p>
This is a fan coil unit with a single coil. Air side flow rate and water side flow rate are directly determined by input mass flow rate. 
</p>
</html>",
      revisions="<html>
<ul>
<li>
Mar 17, 2022, by Zhiang Zhang:<br/>
First creation.
</li>
</ul>
</html>"));
end FCUSingleCoil_m;
