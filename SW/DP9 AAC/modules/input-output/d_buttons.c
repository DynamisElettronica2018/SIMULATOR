//
// Created by Aaron Russo on 28/03/16.
//

#include "d_buttons.h"

void button_onGearUp() {
    //dSignalLed_unset(DSIGNAL_LED_0);
    if (dGear_canGearUp() || d_isNeutralSet) {
        Can_writeInt(SW_RIO_GEAR_BRK_STEER_ID, GEAR_COMMAND_UP);
    } else {
        //dSignalLed_set(DSIGNAL_LED_0);
    }
}

void button_onGearDown() {
    //dSignalLed_unset(DSIGNAL_LED_0);
    if (dGear_canGearDown() || d_isNeutralSet) {
        Can_writeInt(SW_RIO_GEAR_BRK_STEER_ID, GEAR_COMMAND_DOWN);
    } else {
        //dSignalLed_set(DSIGNAL_LED_0);
    }
}

void button_onStart() {
    if (getExternalInterruptEdge(CenterInterrupt) == NEGATIVE_EDGE) {
        dSignalLed_set(DSIGNAL_LED_2);
        dStart_switchOn();
        switchExternalInterruptEdge(CenterInterrupt);
    } else {
        dSignalLed_unset(DSIGNAL_LED_2);
        dStart_switchOff();
        switchExternalInterruptEdge(CenterInterrupt);
    }
}

void button_onMenuLeft() {
    if (dd_GraphicController_getInterface() == SETTINGS_INTERFACE) {
        dd_Interface_applySettings();
    }
    if (dd_GraphicController_getInterface() == EBB_INTERFACE) {
        if (dEbb_isCalibrateing() == TRUE){
            dEbb_calibrateSwitch();
        }
    }
    if (dd_GraphicController_getInterface() != MESSAGE_INTERFACE &&
        dd_GraphicController_getInterface() != ERROR_INTERFACE) {
        if (dd_GraphicController_getInterface() == DASHBOARD_INTERFACE && !d_isNeutralSet) {
            if (!Buttons_isPressureProtracted()) {
                Buttons_protractPress(BUTTON_MENU_LEFT, 1000);
            } else {
                Buttons_clearPressureProtraction();
                dd_GraphicController_switchPreviousInterface();
            }
        } else {
            dd_GraphicController_switchPreviousInterface();
        }
    }
    if (dd_GraphicController_getInterface() == DEBUG_INTERFACE)
    {
        if (!Buttons_isPressureProtracted())
        {
            Buttons_protractPress(BUTTON_MENU_LEFT, 1000);
        }
        else
        {
            Buttons_clearPressureProtraction();
            dRio_zeroAcquisition();
        }
    }
}

void button_onMenuRight() {
    if (dd_GraphicController_getInterface() == SETTINGS_INTERFACE) {
        dd_Interface_applySettings();
    }
    if (dd_GraphicController_getInterface() == EBB_INTERFACE) {
        if (dEbb_isCalibrateing() == TRUE){
            dEbb_calibrateSwitch();
        }
    }
    if (dd_GraphicController_getInterface() != MESSAGE_INTERFACE &&
        dd_GraphicController_getInterface() != ERROR_INTERFACE) {
        if (dd_GraphicController_getInterface() == DASHBOARD_INTERFACE && !d_isNeutralSet) {
            if (!Buttons_isPressureProtracted()) {
                Buttons_protractPress(BUTTON_MENU_RIGHT, 1000);
            } else {
                Buttons_clearPressureProtraction();
                dd_GraphicController_switchNextInterface();
            }
        } else {
            dd_GraphicController_switchNextInterface();
        }
    }
}

void button_onNeutral() {
    if (!d_isNeutralSet) {
        if (dGear_get() == 1) {
            Can_writeInt(SW_RIO_GEAR_BRK_STEER_ID, GEAR_COMMAND_NEUTRAL_UP);
        } else if (dGear_get() == 2) {
            Can_writeInt(SW_RIO_GEAR_BRK_STEER_ID, GEAR_COMMAND_NEUTRAL_DOWN);
        }
    }
}

void button_onMenuUp() {
    if (dd_GraphicController_getInterface() == DASHBOARD_INTERFACE) {
        dHardReset_reset();
    } else if (dd_GraphicController_getInterface() == EBB_INTERFACE) {
        if (dEbb_isCalibrateing() == FALSE) {
            dEbb_increase();
        }
    } 
    /*
    else if (dd_GraphicController_getInterface() == ACC_TIME_INTERFACE) {
        dAcc_increaseRampTime();
    } else if (dd_GraphicController_getInterface() == TRIM1_INTERFACE) {
        dAcc_increaseTrim1();
    } else if (dd_GraphicController_getInterface() == TRIM2_INTERFACE) {
        dAcc_increaseTrim2();
    }//*/
    else {
        dd_Menu_selectUp();
    }
}

void button_onMenuDown() {
    if (dd_GraphicController_getInterface() == EBB_INTERFACE) {
        if (dEbb_isCalibrateing() == FALSE) {
            dEbb_decrease();
        }
    } 
    /*
    else if (dd_GraphicController_getInterface() == ACC_TIME_INTERFACE) {
        dAcc_decreaseRampTime();
    } else if (dd_GraphicController_getInterface() == TRIM1_INTERFACE) {
        dAcc_decreaseTrim1();
    } else if (dd_GraphicController_getInterface() == TRIM2_INTERFACE) {
        dAcc_decreaseTrim2();
    }//*/
    else {
        dd_Menu_selectDown();
    }
}

void button_onMenuOk() {
    if (dd_GraphicController_getInterface() == SETTINGS_INTERFACE) {
        dd_Interface_onSettingsChange(RIGHT);
    } else if (dd_GraphicController_getInterface() == EBB_INTERFACE) {
        dEbb_calibrateSwitch();
    } else if (dd_GraphicController_getInterface() == DEBUG_INTERFACE) {
        dRio_switchAcquisition();
    } else if (dd_GraphicController_getInterface() == DASHBOARD_INTERFACE) {
        if (!dAcc_isAutoAccelerationActive()) {
            if (!Buttons_isPressureProtracted()) {
                Buttons_protractPress(BUTTON_MENU_OK, 1000);
            } else {
                Buttons_clearPressureProtraction();
                //dAcc_startAutoAcceleration();
                Can_writeInt(SW_AUX_ID, 0);
            }
        } else {
            if (dAcc_isReleasingClutch()) {
                //dAcc_stopAutoAcceleration();
                Can_writeInt(SW_AUX_ID, 0);
            } else {
                //dAcc_startClutchRelease();
                Can_writeInt(SW_AUX_ID, 0);
            }
        }//*/
    }
}