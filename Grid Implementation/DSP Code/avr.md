// PWM development // In his code the duty cycle of PWM1A is adjusted by ADC_A0 //###########################################################################
#include "DSP2833x_Device.h"

// external function prototypes
extern void InitAdc(void);
extern void InitSysCtrl(void);
extern void InitPieCtrl(void);
extern void InitPieVectTable(void);
extern void InitCpuTimers(void);
extern void ConfigCpuTimer(struct CPUTIMER_VARS *, float, float);
extern void display_ADC(unsigned int);

// Prototype statements for functions found within this file.
void Gpio_select(void);
void ADC(void);
void PWM_setup(void);
interrupt void cpu_timer0_isr(void);
interrupt void adc_isr(void);           // ADC End of Sequence ISR
interrupt void ePWM1A_compare_isr(void); // EPWM COMPARE ISR

//Global Variables
float Vmax,Vtempmax;
float Vmin,Vtempmin;
float Vpp;
int it_comp;


float error;
float sum;
float Vref;
float KI;
float KP;
float result;


//########################################################################### // main code //###########################################################################
void main(void)
{
InitSysCtrl();               // Basic Core Init from DSP2833x_SysCtrl.c

EALLOW;
SysCtrlRegs.WDCR= 0x00AF;   // Re-enable the watchdog
EDIS;                       // 0x00AF  to NOT disable the Watchdog, Prescaler = 64

DINT;               // Disable all interrupts

Gpio_select();      // GPIO9, GPIO11, GPIO34 and GPIO49 as output
                    // to 4 LEDs at Peripheral Explorer)

InitPieCtrl();      // basic setup of PIE table; from DSP2833x_PieCtrl.c

InitPieVectTable(); // default ISR's in PIE

InitAdc();          // Basic ADC setup, incl. calibration
ADC();              //ADC Setup
PWM_setup();        //PWM setup


EALLOW;
PieVectTable.TINT0 = &cpu_timer0_isr;
PieVectTable.ADCINT = &adc_isr;
PieVectTable.EPWM1_INT = &ePWM1A_compare_isr;
EDIS;

InitCpuTimers();    // basic setup CPU Timer0, 1 and 2

ConfigCpuTimer(&CpuTimer0,150,1000); //150 MHz clockta su kadar mikrosaniye


PieCtrlRegs.PIEIER1.bit.INTx7 = 1;        // CPU Timer 0 interrupt
PieCtrlRegs.PIEIER1.bit.INTx6 = 1;        // ADC interrupt
PieCtrlRegs.PIEIER3.bit.INTx1 = 1;	      // EPWM1 interrupt activated

IER |=5;

EINT;
ERTM;
CpuTimer0Regs.TCR.bit.TSS = 0;  // start timer0

Vmax=0;
Vtempmax=0;
Vmin=4095;
Vtempmin=4095;
Vpp=0;
it_comp=0;


error=0;
sum=0;
Vref=2550;  //equivalent to 220 v ph in ADC
KI=0.0001;
KP=0.0008;
result=1;

while(1) {

        EALLOW;
        SysCtrlRegs.WDKEY = 0x55;       // Service watchdog #1
        EDIS;


}

}
void Gpio_select(void)
{
EALLOW;
GpioCtrlRegs.GPAMUX1.all = 0; // GPIO15 ... GPIO0 = General Puropse I/O
GpioCtrlRegs.GPAMUX1.bit.GPIO0 = 1; // ePWM1A active
GpioCtrlRegs.GPAMUX1.bit.GPIO1 = 1; // ePWM1B active
GpioCtrlRegs.GPAMUX2.all = 0; // GPIO31 ... GPIO16 = General Purpose I/O
GpioCtrlRegs.GPBMUX1.all = 0; // GPIO47 ... GPIO32 = General Purpose I/O
GpioCtrlRegs.GPBMUX2.all = 0; // GPIO63 ... GPIO48 = General Purpose I/O
GpioCtrlRegs.GPCMUX1.all = 0; // GPIO79 ... GPIO64 = General Purpose I/O
GpioCtrlRegs.GPCMUX2.all = 0; // GPIO87 ... GPIO80 = General Purpose I/O

GpioCtrlRegs.GPADIR.all = 0;

GpioCtrlRegs.GPBDIR.all = 0;

GpioCtrlRegs.GPCDIR.all = 0;
EDIS;

}
void ADC(void)
{
	AdcRegs.ADCTRL1.all = 0;
	AdcRegs.ADCTRL1.bit.ACQ_PS = 7; // 7 = 8 x ADCCLK
	AdcRegs.ADCTRL1.bit.SEQ_CASC =1; // 1=cascaded sequencer
	AdcRegs.ADCTRL1.bit.CPS = 0; // divide by 1
	AdcRegs.ADCTRL1.bit.CONT_RUN = 0; // single run mode

    AdcRegs.ADCTRL2.all = 0;
    AdcRegs.ADCTRL2.bit.INT_ENA_SEQ1 = 1;   // 1=enable SEQ1 interrupt
    AdcRegs.ADCTRL2.bit.EPWM_SOCA_SEQ1 =1;  // 1=SEQ1 start from ePWM_SOCA trigger
    AdcRegs.ADCTRL2.bit.INT_MOD_SEQ1 = 0;   // 0= interrupt after every end of sequence

    AdcRegs.ADCTRL3.bit.ADCCLKPS = 3;   // ADC clock: FCLK = HSPCLK / 2 * ADCCLKPS
                                        // HSPCLK = 75MHz (see DSP2833x_SysCtrl.c)
                                        // FCLK = 12.5 MHz

    AdcRegs.ADCMAXCONV.all = 0x0000;    // 2 conversions from Sequencer 1

    AdcRegs.ADCCHSELSEQ1.bit.CONV00 = 0; // Setup ADCINA0 as 1st SEQ1 conv.

}
void PWM_setup(void)
{
	EPwm1Regs.TBCTL.bit.CLKDIV = 0; // CLKDIV = 1
	EPwm1Regs.TBCTL.bit.CLKDIV =  0;	// CLKDIV = 1
	EPwm1Regs.TBCTL.bit.HSPCLKDIV = 1;	// HSPCLKDIV = 2
	EPwm1Regs.TBCTL.bit.CTRMODE = 2;	// up - down mode

	EPwm1Regs.AQCTLA.all = 0x0060;		// set ePWM1A on CMPA up
										// clear ePWM1A on CMPA down
	EPwm1Regs.TBPRD = 18750;			// 2KHz - PWM signal

	EPwm1Regs.DBRED = 75;				// 1 microseconds delay
	EPwm1Regs.DBFED = 75;				// for rising and falling edge
	EPwm1Regs.DBCTL.bit.OUT_MODE = 3;	// ePWM1A = RED
	EPwm1Regs.DBCTL.bit.POLSEL = 2;		// S3=1 inverted signal at ePWM1B
	EPwm1Regs.DBCTL.bit.IN_MODE = 0;	// ePWM1A = source for RED & FED

    EPwm1Regs.ETSEL.all = 0x0A09; //  both SOC and INT enabled 0A0D
	EPwm1Regs.ETPS.all = 0x0101;

	EPwm2Regs.TBCTL.all = 0xC030;   // Configure timer control register
	/*
	 bit 15-14     11:     FREE/SOFT, 11 = ignore emulation suspend
	 bit 13        0:      PHSDIR, 0 = count down after sync event
	 bit 12-10     000:    CLKDIV, 000 => TBCLK = HSPCLK/1
	 bit 9-7       000:    HSPCLKDIV, 000 => HSPCLK = SYSCLKOUT/1
	 bit 6         0:      SWFSYNC, 0 = no software sync produced
	 bit 5-4       11:     SYNCOSEL, 11 = sync-out disabled
	 bit 3         0:      PRDLD, 0 = reload PRD on counter=0
	 bit 2         0:      PHSEN, 0 = phase control disabled
	 bit 1-0       00:     CTRMODE, 00 = count up mode
	*/

	EPwm2Regs.TBPRD = 2999/10; // TPPRD +1  =  TPWM / (HSPCLKDIV * CLKDIV * TSYSCLK)
		                        //           =  20 µs / 6.667 ns

		EPwm2Regs.ETPS.all = 0x0100;            // Configure ADC start by ePWM2
		/*
		 bit 15-14     00:     EPWMxSOCB, read-only
		 bit 13-12     00:     SOCBPRD, don't care
		 bit 11-10     00:     EPWMxSOCA, read-only
		 bit 9-8       01:     SOCAPRD, 01 = generate SOCA on first event
		 bit 7-4       0000:   reserved
		 bit 3-2       00:     INTCNT, don't care
		 bit 1-0       00:     INTPRD, don't care
		*/

		EPwm2Regs.ETSEL.all = 0x0A00;           // Enable SOCA to ADC
		/*
		 bit 15        0:      SOCBEN, 0 = disable SOCB
		 bit 14-12     000:    SOCBSEL, don't care
		 bit 11        1:      SOCAEN, 1 = enable SOCA
		 bit 10-8      010:    SOCASEL, 010 = SOCA on PRD event
		 bit 7-4       0000:   reserved
		 bit 3         0:      INTEN, 0 = disable interrupt
		 bit 2-0       000:    INTSEL, don't care
		 */

}
interrupt void cpu_timer0_isr(void)
{
	CpuTimer0.InterruptCount++;
	it_comp++;
	if (AdcMirror.ADCRESULT0 > Vtempmax)
		{Vtempmax = AdcMirror.ADCRESULT0;}
	else if  (AdcMirror.ADCRESULT0 < Vtempmin)
		{Vtempmin = AdcMirror.ADCRESULT0;}

	 if(it_comp==100)
	 {	 Vmax=Vtempmax;
	 	 Vmin=Vtempmin;
	 	 Vpp=Vmax-Vmin;
		 it_comp=0;
		 Vtempmax=0;
		 Vtempmin=4095;
	 }

	EALLOW;
	SysCtrlRegs.WDKEY = 0xAA; // service WD #2
	EDIS;

	PieCtrlRegs.PIEACK.all = PIEACK_GROUP1;
}


interrupt void adc_isr(void)
{
   	// Service watchdog every interrupt
   	EALLOW;
	SysCtrlRegs.WDKEY = 0xAA;		// Service watchdog #2
	EDIS;

	//PI Control
		error=Vref-Vpp;
		sum=sum + KI*error;
		result = sum + error * KP;
		if (result > EPwm1Regs.TBPRD)
		{
		sum=EPwm1Regs.TBPRD;
		EPwm1Regs.CMPA.half.CMPA = 0.95 * EPwm1Regs.TBPRD;
		}
		else if (result < 1)
	    {
		EPwm1Regs.CMPA.half.CMPA = 0.05 * EPwm1Regs.TBPRD;
		sum=0;
		}
		else
	    {
		EPwm1Regs.CMPA.half.CMPA = result;
		}


	AdcRegs.ADCTRL2.bit.RST_SEQ1 = 1; // Reset SEQ1
	AdcRegs.ADCST.bit.INT_SEQ1_CLR = 1; // Clear INT SEQ1 bit
	PieCtrlRegs.PIEACK.all = PIEACK_GROUP1; // Acknowledge interrupt to PIE
}
interrupt void ePWM1A_compare_isr(void)
{

	//EPwm1Regs.CMPA.half.CMPA  =  AdcMirror.ADCRESULT0*4.5787;	//  duty cycle first

   	// Service watchdog every interrupt
   	EALLOW;
	SysCtrlRegs.WDKEY = 0xAA;		// Service watchdog #2
	EDIS;



	EPwm1Regs.ETCLR.bit.INT = 1;		// Clear ePWM1 Interrupt flag


   	PieCtrlRegs.PIEACK.all = 4;
}
