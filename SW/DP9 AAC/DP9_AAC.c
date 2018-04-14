//  DP10 Display and Steering Wheel Controller
//
//  General usage and naming
//  DISPLAY
//  Controller differentiate in various "interfaces", each interface will correspond to a different screen layout.
//  Interfaces are listed in dd_graphic_controller.h.
//
//
//  Timer allocations
//  Timer 1 - Reserved - LCD refresh
//  Timer 2 - General purpose - Free running 1ms
//  Timer 4 - Usually available to use - Reserved if OSC Frequency is greater than 80Mhz - LCD data communication
//
//  It's mandatory to define OSC_FREQ_MHZ and FRAME_RATE otherwise
//  32Mhz and 25Hz will be assumed respectively.
//  You can also define LED_FRAME_DEBUG, if so, LED_DEBUG_PIN will stay high for the
//  entire duration of a frame update

#define OSC_FREQ_MHZ 80
#define FRAME_RATE 10

int timer2_counter0 = 0, timer2_counter1 = 0, timer2_counter2 = 0, timer2_counter3 = 0, timer2_counter4 = 0, timer2_counter5 = 0;

#include "libs/basic.c"
#include "libs/dsPIC.c"
#include "libs/eeprom.c"
#include "libs/eGlcd.c"

#include "libs/music.c"
//#include "libs/songs/innoMameli.h"
//#include "libs/songs/andiamoAComandare.h"
#include "libs/songs/amourToujour.h"

#include "modules/display/dd_menu.c"
#include "modules/display/dd_indicators.c"
#include "modules/display/dd_dashboard.c"
#include "modules/display/dd_interfaces.c"
#include "modules/dd_graphic_controller.c"

#include "modules/input-output/d_signalLed.c"
#include "modules/input-output/d_paddle.c"
#include "modules/input-output/d_ledStripe.c"
#include "modules/input-output/d_buttons.c"
#include "modules/input-output/buzzer.c"

#include "modules/d_clutch.c"
#include "modules/d_efiSense.c"
#include "modules/d_ebb.c"
#include "modules/d_gears.c"
#include "modules/d_rpm.c"
#include "modules/d_start.c"
#include "modules/d_hardReset.c"
#include "modules/d_rio.c"
#include "modules/d_acceleration.c"
#include "modules/d_can.h"

#include "modules/input-output/d_warnings.c"



void init(void) {
    delay_ms(100);
    setAllPinAsDigital();

    //General purpose interrupt (1ms)
    setTimer(TIMER2_DEVICE, 0.001);
    setInterruptPriority(TIMER2_DEVICE, LOW_PRIORITY);
    delay_ms(200);
    dd_GraphicController_init();
    delay_ms(100);

    Buttons_init();
    Buzzer_init();
    dPaddle_init();
    dLedStripe_init();
    dSignalLed_init();
    dRpm_set(0);
    dRpm_disableLedStripeOutput();

    dHardReset_init();
    Can_init();
    dAcc_init();
    dEbb_init();              //Calibrate to zero the ebb
    dWarnings_init();

    dRpm_enableLedStripeOutput();
    dLedStripe_clear();
}

void main() {
    char msg[14];

    if (!dHardReset_hasBeenReset()) {
        Delay_ms(250); //Secure power on startup
    }
    init();
    //sprintf(msg,"%d",H2O_PUMP_CURRENT);
    //dd_Dashboard_fireTimedMessage(2, msg, MESSAGE_TYPE_MESSAGE);
    //debug for the random reset
    /*sprintf(msg,"RESET %x",RCON);
    dd_Dashboard_fireTimedMessage(0.7, msg, MESSAGE_TYPE_MESSAGE);*/

    if (dHardReset_hasBeenReset()) {
        dd_Dashboard_fireTimedMessage(0.7, "RESET OK", MESSAGE_TYPE_MESSAGE);
        dHardReset_unsetFlag();
    } else {
        dd_lastPrintedGearLetter = GEAR_INIT_VALUE; //Avoid N graphical glitch
        /*Music_setSongTime(AMOR_TOUJOUR_TEMPO);
        Music_playSong(AMOR_TOUJOUR);   */
    }

    while (1);
}

//Frame rate period timer
onTimer1Interrupt{
    dd_GraphicController_onTimerInterrupt();
}

//1 ms Timer
onTimer2Interrupt{
    clearTimer2();
    Buttons_tick();
    dRio_tick();
    dEfiSense_tick();
    dLedStripe_updateFrame();
    timer2_counter0 += 1;
    timer2_counter1 += 1;
    timer2_counter2 += 1;
    timer2_counter3 += 1;
    //timer2_counter4 += 1;
    timer2_counter5 += 1;

    if (timer2_counter0 >= 5) {
        dPaddle_readSample();
        timer2_counter0 = 0;
    }
    if (timer2_counter1 >= 25) {
        if (dStart_isSwitchedOn()) {
            dStart_sendStartMessage();
        }
       //*/
        timer2_counter1 = 0;
    }
    if (timer2_counter3 >= 100) {
        if (dRpm_canUpdateLedStripe()) {
            dRpm_updateLedStripe();
        }
       dEbb_tick();
       //*/
        timer2_counter3 = 0;
    }

    if (timer2_counter2 >= 10) {
        dClutch_set(dPaddle_getValue());
        dClutch_send();
        timer2_counter2 = 0;
    }//*/

    //SHOW WARNINGS
    if (timer2_counter5 >= 1000) {
        dSignalLed_switch(DSIGNAL_LED_2);
        //dWarinings_check();
        timer2_counter5 = 0;
    }//*/
}

onCanInterrupt{
    unsigned int firstInt, secondInt, thirdInt, fourthInt;
    unsigned long int id;
    char dataBuffer[8];
    unsigned int dataLen = 0, flags = 0;

   //INTERRUPT_PROTECT(IEC1BITS.C1IE = 0);
    IEC1BITS.C1IE = 0;
    Can_clearInterrupt();
    if (0 == Can_read(&id, dataBuffer, &dataLen, &flags))
       Buzzer_bip();

    //Can_clearB0Flag();
    //Can_clearB1Flag();


    //lastId=id;

    if (dataLen >= 2) {
        firstInt = (unsigned int) ((dataBuffer[0] << 8) | (dataBuffer[1] & 0xFF));
    }
    if (dataLen >= 4) {
        secondInt = (unsigned int) ((dataBuffer[2] << 8) | (dataBuffer[3] & 0xFF));
    }
    if (dataLen >= 6) {
        thirdInt = (unsigned int) ((dataBuffer[4] << 8) | (dataBuffer[5] & 0xFF));
    }
    if (dataLen >= 8) {
        fourthInt = (unsigned int) ((dataBuffer[6] << 8) | (dataBuffer[7] & 0xFF));
    }

    switch (id) {
        case SW_RIO_GEAR_BRK_STEER_ID:
            dd_Indicator_setIntValue(BRK_P_FRONT, firstInt);
            dd_Indicator_setIntValue(BRK_P_REAR, secondInt);
            break;
        case GCU_SENSE_ID:
            dd_Indicator_setFloatValue(FAN_CURRENT, ((int) ((firstInt - 396.0) * 1.221)) / 100.0);
            dd_Indicator_setFloatValue(FUEL_PUMP_CURRENT, ((int) ((firstInt - 396.0) * 1.221)) / 100.0);
            dd_Indicator_setFloatValue(GCU_TEMP, (thirdInt * 0.1221) - 50);
            dd_Indicator_setIntValue(H2O_PUMP_CURRENT, ((int) ((firstInt - 396.0) * 1.221)) / 100.0);
            break;
        case GCU_MOTOR_ID:
            //dd_Indicator_setIntValue(CAN_2, firstInt);
            //d_setGearMotorState(dataBuffer[0]);
            break;
        case GCU_CLUTCH_ID:
           //Buzzer_bip();
           dClutch_injectActualValue((unsigned char)secondInt);
            break;
        case EBB_ID:
            dEbb_setEbbValueFromCAN(firstInt);
            dEbb_setEbbMotorSenseFromCAN(secondInt);
            dEbb_setEbbMotorStateFromCAN(thirdInt);
            dEbb_propagateEbbChange();
            break;
        case EFI_H2O_ID:
            dd_Indicator_setFloatValue(TH2O, dEfiSense_calculateTemperature(secondInt));
            dEfiSense_heartbeat();
            break;
        case EFI_FUEL_RPM_ID:
            dRpm_set(fourthInt);
            dEfiSense_heartbeat();           //aggiunto dopo
            break;
        case EFI_MIXED_ID:
            dd_Indicator_setIntValue(MAP, firstInt);
            dd_Indicator_setIntValue(FAN_STATE, secondInt);
            dd_Indicator_setFloatValue(AIR_TEMPERATURE, dEfiSense_calculateTemperature(thirdInt));
            dEfiSense_heartbeat();           //aggiunto dopo
            break;
        case EFI_GEAR_ID:
            dGear_propagate(firstInt);
            dEfiSense_heartbeat();
            break;
        case EFI_OIL_BATT_ID:
            dd_Indicator_setFloatValue(OIL_PRESS, dEfiSense_calculatePressure(firstInt));
            dd_Indicator_setFloatValue(VBAT, dEfiSense_calculateVoltage(fourthInt));
            dEfiSense_heartbeat();
            break;
        case SW_COMMAND_ID:
            if (firstInt == 1) {
                dRio_heartBeat();
            }
            break;
        case SW_AUX_ID:
            switch(dataBuffer[0]){
                case MEX_READY:
                    dAcc_startAutoAcceleration();
                    dd_Dashboard_fireTimedMessage(1, "ACC READY", MESSAGE_TYPE_MESSAGE);
                    break;
                case MEX_GO:
                    dAcc_startClutchRelease();
                    dd_Dashboard_fireTimedMessage(1, "GO", MESSAGE_TYPE_MESSAGE);
                    Buzzer_bip();
                    break;
                case MEX_OFF:
                    dAcc_stopAutoAcceleration();
                    dd_Dashboard_fireTimedMessage(1, "ACC OFF", MESSAGE_TYPE_MESSAGE);
                    break;
            }
            break;
        default:
            break;
    }

   //INTERRUPT_PROTECT(IEC1BITS.C1IE = 1);
    IEC1BITS.C1IE = 1;
}