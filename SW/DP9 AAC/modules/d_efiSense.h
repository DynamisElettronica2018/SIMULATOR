//
// Created by Aaron Russo on 17/07/16.
//

#ifndef DP8_DISPLAY_CONTROLLER_D_EFISENSE_H
#define DP8_DISPLAY_CONTROLLER_D_EFISENSE_H

#include "display/dd_dashboard.h"
#include "input-output/d_signalLed.h"
#include "d_hardReset.h"

#define EFI_SENSE_DEADTIME 1000 //ms

#define EFI_SENSE_TEMP_RANGE 160
#define EFI_SENSE_MIN_TEMP 10
#define EFI_SENSE_MAX_VOLTAGE   18

void dEfiSense_heartbeat(void);

void dEfiSense_tick(void);

void dEfiSense_die(void);

char dEfiSense_isDead(void);

float dEfiSense_calculateTemperature(unsigned int value);

float dEfiSense_calculatePressure(unsigned int value);

float dEfiSense_calculateVoltage(unsigned int value);

#endif //DP8_DISPLAY_CONTROLLER_D_EFISENSE_H
