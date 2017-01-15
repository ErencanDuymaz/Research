
**Abstract:** This paper discuss the the contribution of DFIGs to system frequency response. A novel control algorithm is presented for extracting maximum power from a turbine.   
  
-  

**Summary**  
DFIGs are widely used for their ability to work on variable speeds. Their torque values and therefore active power and the reactive power can be controlled in a fast way. 

Some previous works are reviewed. Their missing points are emphasized. Especially, it is emphasized that the aerodynamics of the turbine is not considered in the inertial response. Moreover, converter current and voltage ratings are not considered in the previous works. 

This paper discusses the key parameters in the inertial response. Also, it presents a kinetic energy extraction algorithm to apply to a variable speed wind turbine.  
  
-- 

**Simulation:**  
The simulation is constructed with a 1.5 DFIG WT and 8 MVA diesel generator connected to the same MV bus. The response of the system to a 750 kW load connection is simulated for different governor speeds, inertia and the droop percentages. 

- Governor is slowly acting
- Inertia is greatly influence to ROCOF and minimum frequency point
- Droop does not effect the initial ROCOF but it effects the minimum frequency point. 


-- 
Even though the DFIGs are decouple by the grid control action, it is physically connected through the stator. Therefore, the changes in the grid will definitely have an impact on the machine output. Stator output power of the DFIGs can be controlled since it is proportional with rotor q axis current iqr.  


- In a normal operation ( without any additional control scheme is applied) DIGSs total power does not change with respect to a frequency change. The total power is the summation of the rotor power and the stator power. Stator power is proportional to torque and synchronous speed. Since the torque is constant, the stator power will decrease. However, the rotor power changes in negative direction to stator power, hence keeps the total power constant. With **keeping the stator power constant** with the help of rotor q axis current iqr, electrical torque can be increased since torques = P stator/ w syn . While we have the same rotational speed, we will have **increased total power**. Therefore, in this casee DFIG is contributing to the grid via its increased output power. Following a decreasing speed, output power also decrease to the level below to the uncontrolled case, hence it should increase its rotational speed. But there is no increase observed in the figure ! But at the end, it the frequency does not return to the pre-disturbance value, rotor speed will not recover itself. Therefore, rotor will stall ! 

**Case Study**  
There are three case studies in this part. Case 1 studies the penetration of the DFIGs without replacing with SG. In this case, system frequency deviation does not depend on the the number of additional DFIG penetration. In the second case, DFIGs are replaced with the SGs hence decreasing the system inertia. In this case, increasing DFIGs penetration results with higher frequency deviation. Finally, Case 3 investigates the case 2 situation with keeping the total J of SG constant by varying the inertia constant H. This case is similar to the case 2 in result. However, it also looks like the droop setting-frequency deviation results. (minimum frequency value changes)

**Providing Inertial Response**  

It is stated that any frequency deviation in the grid does not reflected to the generator speed in the DFIGs. This means that DFIGs are considered to be inertia-less from the grid point of view. However, the inertia constant H can be still calculated. 

Inertia constant **H** is defined as the time duration in with the machine supplies rated power by utilizing only the kinetic energy. Some equations are written for the acceleration time of the rotor from 0 to nominal speed. The result is the acceleration time of the rotor is turn out to be equal to 2*H.

Fast control of the torque and speed makes the DFIGs inertia-less but with the help of the additional signals applied to the control mechanism DFIGs can provide or mimic the inertial response. 

Additional ROCOF term is added to the torque/power set point. It is filtered for noisy parts of the frequency deviation. Therefore, as the frequency decreases, torque set point is increased by the rise of Iq reference. Increased torque set point increases the total output power. During the disturbance DFIG speed follows the system speed. During this time, slip is almost constant since rotational speed also decreases with the synchronous speed. As the frequency stabilizes torque is brought back to its pre-disturbance value so that speed recovers itself. 

**Kuncuklanabilecek noktalar**

- DFIGs have a 20-30 % power converter from their rotor sides. Therefore, they are considered to be contributing to grid inertia with a lower inertia. But, what is their equivalent inertia? Figure 3 shows that they are not contributing the system inertia without control scheme modification ! 