//
// Created by Aaron Russo on 16/08/16.
//

#ifndef DP8_DISPLAY_CONTROLLER_D_CLUTCH_H
#define DP8_DISPLAY_CONTROLLER_D_CLUTCH_H

#include "input-output/d_paddle.h"
#include "d_can.h"
#include "display/dd_dashboard.h"

unsigned char dClutch_actualValue = 0, dClutch_value = 0;

void dClutch_set(unsigned char value);

void dClutch_injectActualValue(unsigned char value);

unsigned char dClutch_get(void);

void dClutch_send(void);


#endif //DP8_DISPLAY_CONTROLLER_D_CLUTCH_H
