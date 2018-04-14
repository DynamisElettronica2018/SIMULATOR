//
//  dd_gears.c
//  

#include "d_gears.h"

void dGear_propagate(unsigned int gearCommand) {
    dGear_unsetError();
    if (gearCommand == EFI_GEAR_COMMAND_NEUTRAL) {
        dGear_setNeutral();
    } else if (gearCommand == EFI_GEAR_COMMAND_ERROR) {
        dGear_setError();
    } else {
        dGear_unsetNeutral();
        dGear_set((unsigned char) gearCommand);
    }
}

unsigned char dGear_getCurrentGearLetter(void) {
    if (d_isNeutralSet) {
        return LETTER_NEUTRAL;
    } else if (dGear_error) {
        return LETTER_ERROR;
    } else {
        return d_currentGear + LETTER_GEAR_OFFSET;
    }
}

void dGear_setNeutral(void) {
    d_isNeutralSet = TRUE;
}

void dGear_unsetNeutral(void) {
    d_isNeutralSet = FALSE;
}

void dGear_setError(void) {
    dGear_error = TRUE;
}

void dGear_unsetError(void) {
    dGear_error = FALSE;
}

void dGear_set(unsigned char gear) {
    if (gear > MAX_GEAR) {
        gear = MAX_GEAR;
    } else if (gear < MIN_GEAR) {
        gear = MIN_GEAR;
    }
    d_currentGear = gear;
}

unsigned char dGear_get(void) {
    return d_currentGear;
}

void dGear_up(void) {
    if (dGear_canGearUp()) {
        d_currentGear += 1;
    }
}

void dGear_down(void) {
    if (dGear_canGearDown()) {
        d_currentGear -= 1;
    }
}

char dGear_canGearUp(void){
    return d_currentGear < MAX_GEAR || dGear_isShiftingCheckBypassed();
}

char dGear_canGearDown(void){
    return d_currentGear > MIN_GEAR || dGear_isShiftingCheckBypassed();
}

char dGear_isShiftingCheckBypassed(void){
    return dGear_bypassShiftCheck;
}

void dGear_enableShiftCheck(void){
    dGear_bypassShiftCheck = FALSE;
}

void dGear_disableShiftCheck(void){
    dGear_bypassShiftCheck = TRUE;
}

void d_setGearMotorState(int motorState) {
    d_gearMotorState = motorState;
}

unsigned char d_getGearMotorState(void) {
    return d_gearMotorState;
}

char d_canSetGear(void) {
    return d_gearMotorState == GEAR_MOTOR_READY;
}