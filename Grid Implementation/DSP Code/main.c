
#include "DSP2833x_Device.h"

extern void InitSysCtrl(void);
interrupt void cpu_timer0_isr(void);
interrupt void adc_isr(void);
extern void InitPieCtrl(void);
extern void InitPieVectTable(void);
extern void InitCpuTimers(void);
extern void ConfigCpuTimer(struct CPUTIMER_VARS *, float, float);
extern void InitAdc(void);

// Prototype statements for functions found within this file.
void Gpio_select(void);
void Setup_ePWM1(void);

unsigned int armcurrent;


//###########################################################################
//						main code
//###########################################################################
void main(void)
{
	int counter=0;		// binary counter for digital output

	InitSysCtrl();	 	// Basic Core Initialization

	EALLOW;
	SysCtrlRegs.WDCR = 0x00AF;
	EDIS;

	DINT;				// Disable all interrupts

	Gpio_select();		// GPIO9,GPIO11,GPIO34 and GPIO49 as output (LEDs @ peripheral explorer)
	Setup_ePWM1();		//This is the PWM function
	InitPieCtrl();
	InitPieVectTable();

	EALLOW;
	PieVectTable.TINT0 = &cpu_timer0_isr;
	PieVectTable.ADCINT = &adc_isr;
	EDIS;

	InitCpuTimers();

	InitAdc();

	AdcRegs.ADCTRL1.all = 0;
	AdcRegs.ADCTRL1.bit.SEQ_CASC = 0; // Dual Sequencer Mode
	AdcRegs.ADCTRL1.bit.CONT_RUN = 0; // Single Run Mode
	AdcRegs.ADCTRL1.bit.ACQ_PS = 7; // 8 x ADC-Clock
	AdcRegs.ADCTRL1.bit.CPS = 0; // divide by 1

	AdcRegs.ADCTRL2.all = 0;
	AdcRegs.ADCTRL2.bit.EPWM_SOCA_SEQ1 =1; // ePWM_SOCA trigger
	AdcRegs.ADCTRL2.bit.INT_ENA_SEQ1 = 1; // enable ADC int for seq1
	AdcRegs.ADCTRL2.bit.INT_MOD_SEQ1 = 0; // interrupt after every EOS

	AdcRegs.ADCTRL3.bit.ADCCLKPS = 3; // set FCLK to 12.5 MHz



	AdcRegs.ADCMAXCONV.all =0;  //For 1 conversions

	AdcRegs.ADCCHSELSEQ1.bit.CONV00 = 0; // 1st channel ADCINA0

	EPwm3Regs.TBCTL.bit.FREE_SOFT=3;
	EPwm3Regs.TBCTL.bit.CLKDIV=0;
	EPwm3Regs.TBCTL.bit.HSPCLKDIV=0;
	EPwm3Regs.TBCTL.bit.SWFSYNC=0;
	EPwm3Regs.TBCTL.bit.SYNCOSEL=3;
	EPwm3Regs.TBCTL.bit.PHSEN=0;
	EPwm3Regs.TBCTL.bit.PRDLD=0;
	EPwm3Regs.TBCTL.bit.CTRMODE=0;

	EPwm3Regs.TBPRD = 2999;	// TPPRD +1  =  TPWM / (HSPCLKDIV * CLKDIV * TSYSCLK)
	//			 =  20 µs / 6.667 ns

	EPwm3Regs.ETPS.all=0x0100;

	EPwm3Regs.ETSEL.bit.SOCAEN=1;
	EPwm3Regs.ETSEL.bit.SOCASEL=2;

	ConfigCpuTimer(&CpuTimer0, 150, 100);  // 100 us
	PieCtrlRegs.PIEIER1.bit.INTx7 = 1;
	PieCtrlRegs.PIEIER1.bit.INTx6 = 1;

	IER |= 1;
	EINT;
	ERTM;

	CpuTimer0Regs.TCR.bit.TSS = 0; //start timer0

	while(1)
	{
		while(CpuTimer0.InterruptCount == 0);
		CpuTimer0.InterruptCount = 0;

		EALLOW;
		SysCtrlRegs.WDKEY = 0x55;	// service WD #1
		EDIS;

		counter++;
		// place your code to analyze counter here
		if(counter&1) GpioDataRegs.GPASET.bit.GPIO9=1;// if bit 0 of counter = 1, set GPIO9 to 1
		else GpioDataRegs.GPACLEAR.bit.GPIO9=1;
		if(counter&2) GpioDataRegs.GPASET.bit.GPIO11=1;// if bit 1 of counter = 1, set GPIO11 to 1
		else GpioDataRegs.GPACLEAR.bit.GPIO11=1;
		if(counter&4) GpioDataRegs.GPBSET.bit.GPIO34=1; // if bit 2 of counter = 1, set GPIO34 to 1
		else  GpioDataRegs.GPBCLEAR.bit.GPIO34=1;
		if(counter&8) GpioDataRegs.GPBSET.bit.GPIO49=1;  // if bit 3 of counter = 1, set GPIO49 to 1
		else  GpioDataRegs.GPBCLEAR.bit.GPIO49=1;

	}
}



interrupt void cpu_timer0_isr(void)
{

	CpuTimer0.InterruptCount++;
	EALLOW;
	SysCtrlRegs.WDKEY = 0xAA;	// service WD #1
	EDIS;



	PieCtrlRegs.PIEACK.all = PIEACK_GROUP1;
}
void Gpio_select(void)
{
	EALLOW;
	GpioCtrlRegs.GPAMUX1.all = 0;	// GPIO15 ... GPIO0 = General Puropse I/O

	GpioCtrlRegs.GPAMUX1.bit.GPIO0 = 1;  //This enables the GPIO0 pin for PWM1
	GpioCtrlRegs.GPAMUX1.bit.GPIO1 = 1;  //This enables the GPIO1 pin for PWM1

	GpioCtrlRegs.GPAMUX1.bit.GPIO2 = 1;  //This enables the GPIO2 pin for PWM2
	GpioCtrlRegs.GPAMUX1.bit.GPIO3 = 1;  //This enables the GPIO3 pin for PWM2


	GpioCtrlRegs.GPAMUX2.all = 0;	// GPIO31 ... GPIO16 = General Purpose I/O
	GpioCtrlRegs.GPBMUX1.all = 0;	// GPIO47 ... GPIO32 = General Purpose I/O
	GpioCtrlRegs.GPBMUX2.all = 0;	// GPIO63 ... GPIO48 = General Purpose I/O
	GpioCtrlRegs.GPCMUX1.all = 0;	// GPIO79 ... GPIO64 = General Purpose I/O
	GpioCtrlRegs.GPCMUX2.all = 0;	// GPIO87 ... GPIO80 = General Purpose I/O

	GpioCtrlRegs.GPADIR.all = 0;
	GpioCtrlRegs.GPADIR.bit.GPIO9 = 1;
	GpioCtrlRegs.GPADIR.bit.GPIO11 = 1;

	// peripheral explorer: LED LD1 at GPIO9
	// peripheral explorer: LED LD2 at GPIO11
	GpioCtrlRegs.GPBDIR.all = 0;
	GpioCtrlRegs.GPBDIR.bit.GPIO34 = 1;
	GpioCtrlRegs.GPBDIR.bit.GPIO49 = 1;
	// peripheral explorer: LED LD3 at GPIO34
	// peripheral explorer: LED LD4 at GPIO49

	EDIS;
}

void Setup_ePWM1(void)
{
	//Setting up 1st PWM settings

	EPwm1Regs.TBCTL.bit.CLKDIV=0;
	EPwm1Regs.TBCTL.bit.HSPCLKDIV=1;
	EPwm1Regs.TBCTL.bit.CTRMODE=2; //up and down
	EPwm1Regs.TBPRD=18750;  //Voltage PWM frequency is set to 2kHz

	EPwm1Regs.AQCTLA.all = 0x0060;		// set ePWM1A on CMPA up
										// clear ePWM1A on CMPA down

	EPwm1Regs.DBRED=750;
	EPwm1Regs.DBFED=750;
	EPwm1Regs.DBCTL.bit.OUT_MODE = 3;	// ePWM1A = RED
	EPwm1Regs.DBCTL.bit.POLSEL = 2;		// S3=1 inverted signal at ePWM1B
	EPwm1Regs.DBCTL.bit.IN_MODE = 0;	// ePWM1A = source for RED & FED

	//Setting up 2nd PWM settings
	EPwm2Regs.TBCTL.bit.CLKDIV=0;
	EPwm2Regs.TBCTL.bit.HSPCLKDIV=1;
	EPwm2Regs.TBCTL.bit.CTRMODE=2; //up and down
	EPwm2Regs.TBPRD=18750;	//Speed PWM frequency is set to 2kHz

	EPwm2Regs.AQCTLA.all = 0x0060;		// set ePWM2A on CMPA up
										// clear ePWM2A on CMPA down

	EPwm2Regs.DBRED=750;
	EPwm2Regs.DBFED=750;
	EPwm2Regs.DBCTL.bit.OUT_MODE = 3;	// ePWM1A = RED
	EPwm2Regs.DBCTL.bit.POLSEL = 2;		// S3=1 inverted signal at ePWM1B
	EPwm2Regs.DBCTL.bit.IN_MODE = 0;	// ePWM1A = source for RED & FED

	EPwm1Regs.CMPA.half.CMPA = EPwm1Regs.TBPRD/2; // Start with 100% duty cycle
	EPwm2Regs.CMPA.half.CMPA = EPwm2Regs.TBPRD/2; // Start with 100% duty cycle
}

interrupt void adc_isr(void)

{
	armcurrent = AdcMirror.ADCRESULT0;

	AdcRegs.ADCTRL2.bit.RST_SEQ1 = 1;		//Reset ADC Sequencer1 (Register ADCCTRL2):
	AdcRegs.ADCST.bit.INT_SEQ1_CLR = 1;		//Clear Interrupt Flag ADC Sequencer 1 (Register ADCST)
	PieCtrlRegs.PIEACK.all = PIEACK_GROUP1; //Acknowledge PIE Interrupt
}

//===========================================================================
// End of SourceCode.
//===========================================================================
