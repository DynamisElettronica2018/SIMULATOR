//
// Created by Aaron Russo on 04/08/16.
//

#include "d_hardReset.h"

unsigned int dHardReset_counter = 0;
int lastId=0;

void dHardReset_init(void) {
char msg[14];
int id;
int temp;
    dHardReset_counter = dHardReset_getCounter();
    dd_Indicator_setIntValue(EFI_CRASH_COUNTER, dHardReset_counter);
}

void dHardReset_reset(void) {
    char msg[14];
    dHardReset_setFlag();
    dSignalLed_set(DSIGNAL_LED_RED);
    dSignalLed_set(DSIGNAL_LED_GREEN);
    dSignalLed_set(DSIGNAL_LED_BLUE);
    asm {
    reset
    }
}

char dHardReset_hasBeenReset(void) {
    return HARDRESET_FLAG;
}

void dHardReset_setFlag(void) {
    EEPROM_writeInt(HARDRESET_COUNTER_ADDRESS, dHardReset_getCounter() + 1);
}

void dHardReset_unsetFlag(void) {
    HARDRESET_FLAG = FALSE;
}

unsigned int dHardReset_getCounter(void) {
    return EEPROM_readInt(HARDRESET_COUNTER_ADDRESS);
}