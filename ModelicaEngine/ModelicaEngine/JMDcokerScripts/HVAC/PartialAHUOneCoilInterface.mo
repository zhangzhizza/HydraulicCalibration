partial model PartialAHUOneCoilInterface
  replaceable package MediumAir = Buildings.Media.Air constrainedby
    Modelica.Media.Interfaces.PartialMedium "Medium 1 in the component"
      annotation (choices(
        choice(redeclare package Medium = Buildings.Media.Air "Moist air"),
        choice(redeclare package Medium = Buildings.Media.Water "Water"),
        choice(redeclare package Medium =
            Buildings.Media.Antifreeze.PropyleneGlycolWater (
          property_T=293.15,
          X_a=0.40)
          "Propylene glycol water, 40% mass fraction")));
  replaceable package MediumWater1 = Buildings.Media.Water constrainedby
    Modelica.Media.Interfaces.PartialMedium "Medium 2 in the component"
      annotation (choices(
        choice(redeclare package Medium = Buildings.Media.Air "Moist air"),
        choice(redeclare package Medium = Buildings.Media.Water "Water"),
        choice(redeclare package Medium =
            Buildings.Media.Antifreeze.PropyleneGlycolWater (
          property_T=293.15,
          X_a=0.40)
          "Propylene glycol water, 40% mass fraction")));

  parameter Boolean allowFlowReversal1 = true
    "= false to simplify equations, assuming, but not enforcing, no flow reversal for medium 1"
    annotation(Dialog(tab="Assumptions"), Evaluate=true);

  parameter Boolean allowFlowReversal2 = true
    "= false to simplify equations, assuming, but not enforcing, no flow reversal for medium 1"
    annotation(Dialog(tab="Assumptions"), Evaluate=true);


  parameter Modelica.SIunits.MassFlowRate air_flow_nominal(min=0)
    "Nominal mass flow rate of air (kg/s)"
    annotation(Dialog(group = "Nominal condition"));
  parameter Modelica.SIunits.MassFlowRate water1_flow_nominal(min=0)
    "Nominal mass flow rate of water in coil 1 (kg/s)"
    annotation(Dialog(group = "Nominal condition"));
  parameter MediumAir.MassFlowRate air_flow_small(min=0) = 1E-4*abs(air_flow_nominal)
    "Small mass flow rate for regularization of zero flow for air"
    annotation(Dialog(tab = "Advanced"));
  parameter MediumWater1.MassFlowRate water1_flow_small(min=0) = 1E-4*abs(water1_flow_nominal)
    "Small mass flow rate for regularization of zero flow for water in coil 1"
    annotation(Dialog(tab = "Advanced"));
  // Diagnostics
  parameter Boolean show_T = false
    "= true, if actual temperature at port is computed"
    annotation (
      Dialog(tab="Advanced", group="Diagnostics"),
      HideResult=true);

  MediumAir.MassFlowRate air_flow=air_port_a.m_flow
    "Mass flow rate from air_port_a to air_port_b (air_flow > 0 is design flow direction)";
  Modelica.SIunits.PressureDifference air_dp(displayUnit="Pa") = air_port_a.p -
    air_port_b.p "Pressure difference between port_a1 and port_b1";

  MediumWater1.MassFlowRate water1_flow=water_port_a1.m_flow
    "Mass flow rate from water_port_a1 to water_port_b1 (water1_flow > 0 is design flow direction)";
  Modelica.SIunits.PressureDifference water1_dp(displayUnit="Pa") = water_port_a1.p -
    water_port_b1.p "Pressure difference between water_port_a1 and water_port_b1";

  MediumAir.ThermodynamicState sta_air_a=MediumAir.setState_phX(
      air_port_a.p,
      noEvent(actualStream(air_port_a.h_outflow)),
      noEvent(actualStream(air_port_a.Xi_outflow))) if show_T
    "Medium properties in air_port_a";
  MediumAir.ThermodynamicState sta_air_b=MediumAir.setState_phX(
      air_port_b.p,
      noEvent(actualStream(air_port_b.h_outflow)),
      noEvent(actualStream(air_port_b.Xi_outflow))) if show_T
    "Medium properties in air_port_b";
  MediumWater1.ThermodynamicState sta_water_a1=MediumWater1.setState_phX(
      water_port_a1.p,
      noEvent(actualStream(water_port_a1.h_outflow)),
      noEvent(actualStream(water_port_a1.Xi_outflow))) if show_T
    "Medium properties in water_port_a1";
  MediumWater1.ThermodynamicState sta_water_b1=MediumWater1.setState_phX(
      water_port_b1.p,
      noEvent(actualStream(water_port_b1.h_outflow)),
      noEvent(actualStream(water_port_b1.Xi_outflow))) if show_T
    "Medium properties in water_port_b1";
  Modelica.Fluid.Interfaces.FluidPort_a air_port_a(
    redeclare final package Medium = MediumAir,
    m_flow(min=if allowFlowReversal1 then -Modelica.Constants.inf else 0),
    h_outflow(start=MediumAir.h_default, nominal=MediumAir.h_default))
    "Fluid connector a (positive design flow direction is from port_a to port_b)"
    annotation (Placement(transformation(extent={{-118,-12},{-98,8}}),
        iconTransformation(extent={{-118,-12},{-98,8}})));
  Modelica.Fluid.Interfaces.FluidPort_b air_port_b(
    redeclare final package Medium = MediumAir,
    m_flow(max=if allowFlowReversal1 then +Modelica.Constants.inf else 0),
    h_outflow(start=MediumAir.h_default, nominal=MediumAir.h_default))
    "Fluid connector b (positive design flow direction is from port_a to port_b)"
    annotation (Placement(transformation(extent={{388,-10},{368,10}}),
        iconTransformation(extent={{388,-10},{368,10}})));
  Modelica.Fluid.Interfaces.FluidPort_a water_port_a1(
    redeclare final package Medium = MediumWater1,
    m_flow(min=if allowFlowReversal2 then -Modelica.Constants.inf else 0),
    h_outflow(start=MediumWater1.h_default, nominal=MediumWater1.h_default))
    "Fluid connector a (positive design flow direction is from port_a to port_b)"
    annotation (Placement(transformation(extent={{-20,84},{0,104}}),
        iconTransformation(extent={{-20,84},{0,104}})));
  Modelica.Fluid.Interfaces.FluidPort_b water_port_b1(
    redeclare final package Medium = MediumWater1,
    m_flow(max=if allowFlowReversal2 then +Modelica.Constants.inf else 0),
    h_outflow(start=MediumWater1.h_default, nominal=MediumWater1.h_default))
    "Fluid connector b (positive design flow direction is from port_a to port_b)"
    annotation (Placement(transformation(extent={{2,-106},{-18,-86}}),
        iconTransformation(extent={{2,-106},{-18,-86}})));
protected
  MediumAir.ThermodynamicState state_air_a_inflow=MediumAir.setState_phX(
      air_port_a.p,
      inStream(air_port_a.h_outflow),
      inStream(air_port_a.Xi_outflow))
    "state for medium inflowing through air_port_a";
  MediumAir.ThermodynamicState state_air_b_inflow=MediumAir.setState_phX(
      air_port_b.p,
      inStream(air_port_b.h_outflow),
      inStream(air_port_b.Xi_outflow))
    "state for medium inflowing through air_port_b";
  MediumWater1.ThermodynamicState state_water_a1_inflow=MediumWater1.setState_phX(
      water_port_a1.p,
      inStream(water_port_a1.h_outflow),
      inStream(water_port_a1.Xi_outflow))
    "state for medium inflowing through water_port_a1";
  MediumWater1.ThermodynamicState state_water_b1_inflow=MediumWater1.setState_phX(
      water_port_b1.p,
      inStream(water_port_b1.h_outflow),
      inStream(water_port_b1.Xi_outflow))
    "state for medium inflowing through water_port_b1";

 annotation (Placement(transformation(extent={{160,-106},{140,-86}}),
        iconTransformation(extent={{160,-106},{140,-86}})),
  preferredView="info",
    Documentation(info="<html>
<p>
This component defines the interface for an air handling unit (AHU) model with one water coil.
</p>
</html>", revisions="<html>
<ul>
<li>
Apr 1, 2022, by Zhiang Zhang:<br/>
First creation.
</li>
</ul>
</html>"),
    Diagram(coordinateSystem(extent={{-100,-100},{380,100}})),
    Icon(coordinateSystem(extent={{-100,-100},{380,100}}), graphics={
        Rectangle(
          extent={{-102,94},{380,-92}},
          lineColor={0,0,0},
          lineThickness=1,
          fillColor={175,175,175},
          fillPattern=FillPattern.Solid),
        Rectangle(
          extent={{-102,8},{380,-8}},
          lineColor={0,0,0},
          lineThickness=1,
          fillColor={170,255,255},
          fillPattern=FillPattern.Solid),
        Rectangle(
          extent={{-26,62},{10,-60}},
          lineColor={0,0,0},
          lineThickness=1,
          fillColor={85,170,255},
          fillPattern=FillPattern.Solid)}),
    uses(Modelica(version="4.0.0"), Buildings(version="8.0.0")));
end PartialAHUOneCoilInterface;
