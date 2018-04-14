//
// Created by Aaron Russo on 08/07/16.
//

#include "d_rpm.h"

char dRpm_ledStripeOutputEnable = FALSE;

void dRpm_set(unsigned int rpm) {
    dRpm = rpm;
    dd_Indicator_setFloatValue(RPM, dRpm_getDisplayValue());
}

unsigned int dRpm_get(void) {
    return dRpm;
}

float dRpm_getDisplayValue(void) {
    return (dRpm_get() / 10) / 100.0;
}

char dRpm_canUpdateLedStripe(void) {
    return dRpm_ledStripeOutputEnable;
}

void dRpm_disableLedStripeOutput(void) {
    dRpm_ledStripeOutputEnable = FALSE;
}

void dRpm_enableLedStripeOutput(void) {
    dRpm_ledStripeOutputEnable = TRUE;
}
/*
void dRpm_updateLedStripe(void) {
    unsigned char dLedStripeState;
    if (dRpm > RPM_STRIPE_OFFSET) {
        dLedStripeState = (dRpm - RPM_STRIPE_OFFSET) / dRpm_stripeStep;
    } else {
        dLedStripeState = 0;
    }
    switch (dLedStripeState) {
        case 0:
            dLedStripe_clear();
            break;
        case 1:
            dLedStripe_clear();
            dLedStripe_setLedColorAtPosition(DLS_BLUE, DLS_LED_0);
            break;
        case 2:
            dLedStripe_clear();
            dLedStripe_setLedColorAtPosition(DLS_BLUE, DLS_LED_0);
            dLedStripe_setLedColorAtPosition(DLS_BLUE, DLS_LED_1);
            break;
        case 3:
            dLedStripe_clear();
            dLedStripe_setLedColorAtPosition(DLS_BLUE, DLS_LED_0);
            dLedStripe_setLedColorAtPosition(DLS_BLUE, DLS_LED_1);
            dLedStripe_setLedColorAtPosition(DLS_GREEN, DLS_LED_2);
            break;
        case 4:
            dLedStripe_clear();
            dLedStripe_setLedColorAtPosition(DLS_BLUE, DLS_LED_0);
            dLedStripe_setLedColorAtPosition(DLS_BLUE, DLS_LED_1);
            dLedStripe_setLedColorAtPosition(DLS_GREEN, DLS_LED_2);
            dLedStripe_setLedColorAtPosition(DLS_GREEN, DLS_LED_3);
            break;
        case 5:
            dLedStripe_clear();
            dLedStripe_setLedColorAtPosition(DLS_BLUE, DLS_LED_0);
            dLedStripe_setLedColorAtPosition(DLS_BLUE, DLS_LED_1);
            dLedStripe_setLedColorAtPosition(DLS_GREEN, DLS_LED_2);
            dLedStripe_setLedColorAtPosition(DLS_GREEN, DLS_LED_3);
            dLedStripe_setLedColorAtPosition(DLS_RED, DLS_LED_4);
            break;
        case 6:
            dLedStripe_clear();
            dLedStripe_setLedColorAtPosition(DLS_BLUE, DLS_LED_0);
            dLedStripe_setLedColorAtPosition(DLS_BLUE, DLS_LED_1);
            dLedStripe_setLedColorAtPosition(DLS_GREEN, DLS_LED_2);
            dLedStripe_setLedColorAtPosition(DLS_GREEN, DLS_LED_3);
            dLedStripe_setLedColorAtPosition(DLS_RED, DLS_LED_4);
            dLedStripe_setLedColorAtPosition(DLS_RED, DLS_LED_5);
            break;
    }
}
*/
void dRpm_updateLedStripe(void) {
    unsigned char dLedStripeState;
    if (dRpm > RPM_STRIPE_OFFSET) {
        dLedStripeState = (dRpm - RPM_STRIPE_OFFSET) / dRpm_stripeStep;
    } else {
        dLedStripeState = 0;
    }
    switch (dLedStripeState) {
        case 0:
            dLedStripe_clear();
            break;
        case 1:
            dLedStripe_setLedColorAtPosition(DLS_GREEN, DLS_LED_0);
            dLedStripe_setLedColorAtPosition(DLS_BLACK, DLS_LED_1);
            dLedStripe_setLedColorAtPosition(DLS_BLACK, DLS_LED_2);
            dLedStripe_setLedColorAtPosition(DLS_BLACK, DLS_LED_3);
            dLedStripe_setLedColorAtPosition(DLS_BLACK, DLS_LED_4);
            dLedStripe_setLedColorAtPosition(DLS_BLACK, DLS_LED_5);
            break;
        case 2:
            dLedStripe_setLedColorAtPosition(DLS_GREEN, DLS_LED_0);
            dLedStripe_setLedColorAtPosition(DLS_GREEN, DLS_LED_1);
            dLedStripe_setLedColorAtPosition(DLS_BLACK, DLS_LED_2);
            dLedStripe_setLedColorAtPosition(DLS_BLACK, DLS_LED_3);
            dLedStripe_setLedColorAtPosition(DLS_BLACK, DLS_LED_4);
            dLedStripe_setLedColorAtPosition(DLS_BLACK, DLS_LED_5);
            break;
        case 3:
            dLedStripe_setLedColorAtPosition(DLS_GREEN, DLS_LED_0);
            dLedStripe_setLedColorAtPosition(DLS_GREEN, DLS_LED_1);
            dLedStripe_setLedColorAtPosition(DLS_RED, DLS_LED_2);
            dLedStripe_setLedColorAtPosition(DLS_BLACK, DLS_LED_3);
            dLedStripe_setLedColorAtPosition(DLS_BLACK, DLS_LED_4);
            dLedStripe_setLedColorAtPosition(DLS_BLACK, DLS_LED_5);
            break;
        case 4:
            dLedStripe_setLedColorAtPosition(DLS_GREEN, DLS_LED_0);
            dLedStripe_setLedColorAtPosition(DLS_GREEN, DLS_LED_1);
            dLedStripe_setLedColorAtPosition(DLS_RED, DLS_LED_2);
            dLedStripe_setLedColorAtPosition(DLS_RED, DLS_LED_3);
            dLedStripe_setLedColorAtPosition(DLS_BLACK, DLS_LED_4);
            dLedStripe_setLedColorAtPosition(DLS_BLACK, DLS_LED_5);
            break;
        case 5:
            dLedStripe_setLedColorAtPosition(DLS_GREEN, DLS_LED_0);
            dLedStripe_setLedColorAtPosition(DLS_GREEN, DLS_LED_1);
            dLedStripe_setLedColorAtPosition(DLS_RED, DLS_LED_2);
            dLedStripe_setLedColorAtPosition(DLS_RED, DLS_LED_3);
            dLedStripe_setLedColorAtPosition(DLS_BLUE, DLS_LED_4);
            dLedStripe_setLedColorAtPosition(DLS_BLACK, DLS_LED_5);
            break;
        case 6:
            dLedStripe_setLedColorAtPosition(DLS_GREEN, DLS_LED_0);
            dLedStripe_setLedColorAtPosition(DLS_GREEN, DLS_LED_1);
            dLedStripe_setLedColorAtPosition(DLS_RED, DLS_LED_2);
            dLedStripe_setLedColorAtPosition(DLS_RED, DLS_LED_3);
            dLedStripe_setLedColorAtPosition(DLS_BLUE, DLS_LED_4);
            dLedStripe_setLedColorAtPosition(DLS_BLUE, DLS_LED_5);
            break;
    }
}