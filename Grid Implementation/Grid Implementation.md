In this documentation, the procedure that is experienced during the grid implementation will be noted. The emulated grid should exhibit the same performance with the real MW size generator. First of all, in order to generate power, the generator should have a prime-mover. This prime mover will be the DC motor which coupled on the same shaft of the synchronous generator. 

![](/Images/DCmotor_ACsyngen.jpg)  

Without any external control, this structure will not behave as same as the real generator behaviour. Therefore, there needs to be two controller which will manage the generated voltage amplitude and frequency. These controllers are called exciter and governor respectively. Governor manages the active power given from DC motor to AC generator. In the real case, governor adjusts the water flow rate to the generator turbine. Meanwhile, the exciter tracks the voltage amplitude and manages the field current. 
