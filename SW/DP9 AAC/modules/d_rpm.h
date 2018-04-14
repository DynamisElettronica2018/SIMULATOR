//
// Created by Aaron Russo on 08/07/16.
//

#ifndef DP8_DISPLAY_CONTROLLER_D_RPM_H
#define DP8_DISPLAY_CONTROLLER_D_RPM_H

#include "../libs/basic.h"
#include "input-output/d_ledStripe.h"
#include "display/dd_dashboard.h"

#define RPM_STRIPE_MAX 9500
#define RPM_STRIPE_OFFSET 5000

unsigned int dRpm = 0;

const unsigned int dRpm_stripeStep = (RPM_STRIPE_MAX - RPM_STRIPE_OFFSET) / DLS_LED_COUNT;

void dRpm_set(unsigned int rpm);

unsigned int dRpm_get(void);

float dRpm_getDisplayValue(void);

char dRpm_canUpdateLedStripe(void);

void dRpm_disableLedStripeOutput(void);

void dRpm_enableLedStripeOutput(void);

void dRpm_updateLedStripe(void);

#endif //DP8_DISPLAY_CONTROLLER_D_RPM_H