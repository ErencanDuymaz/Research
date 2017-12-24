This document explain the procedure experienced during the Automatic Voltage Regulator (AVR) implementation. The output voltage of the synchronous generator depends on the generator loading as expected. However, as the grid demands, the output of the grid should be in defined band. This is why a grid generator has a AVR in order to keep the output voltage constant. 

#Output Voltage vs Loading  

In the very first part of the experiment, generator output voltage is observed resulting in a load connection. Each time, the output voltage is regulated to 380V by changing the excitation current. 

**Resistive Load Connection**  

|     Loading   | Line to Line V | Armature Current |AC Field Current| DC-Armature Current|DC-Field Current|
|---------------|----------------|------------------|----------------|--------------------|----------------|
|No-Load        | 380            |-                 |0.55            |2.4                 |0.55            |
|750W           | 333            |1                 |0.6             |5                   |0.55            |
|750W Corrected | 380            |1.1               |0.7             |6                   |0.55            |
|1500W          | 340            |2                 |0.7             |8.2                 |0.55            |
|1500W Corrected| 380            |2.3               |0.8             |10                  |0.55            |
|2250W          | 334            |3                 |0.8             |11                  |0.55            |
|2250W Corrected| 380            |3.4               |0.9             |14                  |0.55            |
|3000W          | 334.5          |4                 |0.9             |14                  |0.55            |
|3000W Corrected| 380            |4.5               |1.1             |18                  |0.55            |  

**RL Load Connection(Each 750W includes also 750VAr)**  

|     Loading   | Line to Line V | Armature Current |AC Field Current| DC-Armature Current|DC-Field Current|
|---------------|----------------|------------------|----------------|--------------------|----------------|
|No-Load        | 380            |-                 |0.62            |2.2                 |0.54            |
|750W           | 291            |1.27              |0.62            |4.5                 |0.54            |
|750W Corrected | 380            |1.67              |0.86            |6                   |0.54            |
|1500W          | 303            |2.67              |0.86            |7.2                 |0.54            |
|1500W Corrected| 380            |3.37              |1.15            |10.2                |0.54            |
|2250W          | 317            |4.2               |1.15            |11                  |0.54            |
|2250W Corrected| **370**        |4.96              |1.45            |14                  |0.54            |  

**RC Load Connection(Each 750W includes also 750VAr)**  

|     Loading   | Line to Line V | Armature Current |AC Field Current| DC-Armature Current|DC-Field Current|
|---------------|----------------|------------------|----------------|--------------------|----------------|
|No-Load        | 380            |-                 |0.62            |2.2                 |0.54            |
|750W           | 444            |1.9               |0.62            |7.2                 |0.54            |
|750W Corrected | 380            |1.67              |0.49            |6                   |0.54            |  

By making this experiment, the required current range for AC field excitation is obtained. This current range will be necessary for the buck converter design.

**AVR Design**  
![](/Images/AVR_Design.jpg)

**Voltage Measurement**  
In the voltage measurement circuit, the output voltage is found to be AC with 3.76 V peak with zero DC offset. This signal is not appropriate for the ADC pin of the DSP. This is why an OPAMP circuitry is necessary between the voltage measurement board (this opamp circuit can also be in the voltage measurement board) and DSP.  

The necessary circuit is summing amplifier which is shown below: 

![](https://i.stack.imgur.com/hT3cp.gif)  

In order to test the circuitry, 9V voltage regulator is used. In the real case, 1.65 V offset is necessary. Voltage measurement circuit output is summed with 9V voltage. The circuit work very well for this objective except for inversion in the output :) This is why a inverting amplifier is used for output. Its diagram is also below. 

![](https://www.eecs.tufts.edu/~dsculley/tutorial/opamps/invertingAmp.JPG)  

All of the resistors used in the trial is 10k Ohm. The output signal is found to be 3.72V peak to peak with 9V DC offset. The output signal is given below. 

![](/Images/opampoutput.JPG)

