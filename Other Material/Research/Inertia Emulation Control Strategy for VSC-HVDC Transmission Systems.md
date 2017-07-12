#Summary 

VSC-HVDC transformers are deliberately used for isolating interconnected systems from propagation of the transients. This paper presents a novel inertia emulation control INEC which enables system with HVDC transformer to provide support which imitates the inertia of the synchronous generator (SG). The control scheme INEC with VSC-HVDC transfomer with fixed capacitance emulates a wide range of inertia constant H by specifying the an amount of DC voltage variation. The main logic here is decreasing the DC voltage stored in the fixed capacitance so that transformer secondary side increase its active power without changing the active power flow from primary side to the secondary side. The increased active power is achieved by the change of stored energy in the capacitor. 

**Some previous works are reviewed:** 

1 - Dynamic contribution of DFIGs to provide an inertial response

2 - Control scheme for fully rated converter interfaced PMSG wind generators that can provide frequency support

3- Control strategy for wind farms connected via LCC (Line Commutating Converter) HVDC links 

Common disadvantage is the stalling risk 

This paper does not rely on df/dt which in turn may cause control system instability. 


From the derivations emulated inertia constant H is expressed in terms of frequency change, capacitance and the DC voltage variation. From this expression, DC voltage set point can be achieved based on the grid frequency. 

**Peformance Evaluation**  

Two main cases are defined as sudden load changes and AC side fault for 0, 1 and 3 seconds emulated inertia constants. 

For sudden load change case, for the three inertia constants, the DC voltage is maintained within 5% of the nominal voltage 300 kV

In this paper, large capacitance values are used in order to decrease the DC voltage variation. Moreover, the design is made for 'instantaneous inertial response'. Therefore, longer term responses should be considered by operators such as load shedding or generator start-up.