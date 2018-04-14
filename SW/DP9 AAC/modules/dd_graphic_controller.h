//
//  DP8 Graphic LCD Controller
//  Aaron Russo 01/03/2016
//
//  In order to work properly library requires to #define on your main file
//  OSC_FREQ_MHZ (Clock Frequency in Mhz, default: 32)
//  Optionally you can also define
//  FRAME_RATE (LCD Refresh rate, default: 25)
//
//  Required external libraries
//  glcd
//  xglcd
//

#ifndef DD_GRAPHIC_CONTROLLER_H
#define DD_GRAPHIC_CONTROLLER_H

#ifndef FRAME_RATE
#define FRAME_RATE 25
#endif
#ifndef OSC_FREQ_MHZ
#define OSC_FREQ_MHZ 32
#endif

#define LED_DEBUG_PIN RG1_bit
#define LED_DEBUG_PIN_DIRECTION TRISG1_bit

#define DD_BACKLIGHT_PIN RB15_bit
#define DD_BACKLIGHT_PIN_DIRECTION TRISB15_bit

#define SCREEN_WIDTH 128
#define SCREEN_HEIGHT 64

//Interfaces
#define NOT_SWITCHABLE_INTERFACES 3

#define DASHBOARD_INTERFACE 0
#define DEBUG_INTERFACE 1
#define EBB_INTERFACE 20
#define ACC_TIME_INTERFACE 10
#define TRIM1_INTERFACE 11
#define TRIM2_INTERFACE 12
#define SETTINGS_INTERFACE 2
#define ERROR_INTERFACE 3
#define MESSAGE_INTERFACE 4
#define WARNING_INTERFACE 5

const unsigned char INTERFACE_LIST[] = {
        DEBUG_INTERFACE,
        DASHBOARD_INTERFACE,
        EBB_INTERFACE,
        ACC_TIME_INTERFACE,
        TRIM1_INTERFACE,
        TRIM2_INTERFACE,
        SETTINGS_INTERFACE,
        ERROR_INTERFACE,
        MESSAGE_INTERFACE,
        WARNING_INTERFACE
};

const unsigned char SCREEN_X_MIDDLE = SCREEN_WIDTH / 2;
const unsigned char SCREEN_Y_MIDDLE = SCREEN_HEIGHT / 2;

const double FRAME_PERIOD = 1.0 / FRAME_RATE;

void dd_GraphicController_init(void);

void dd_GraphicController_turnOnBacklight(void);

void dd_GraphicController_turnOffBacklight(void);

void dd_GraphicController_switchBacklight(void);

void dd_GraphicController_setInterface(unsigned char interface);

unsigned char dd_GraphicController_getInterface(void);

char dd_GraphicController_isInterfaceChangedFromLastFrame(void);

void dd_GraphicController_switchNextInterface(void);

void dd_GraphicController_switchPreviousInterface(void);

void dd_GraphicController_switchLastInterface(void);

void dd_GraphicController_saveInterfaceIndex(void);

void dd_GraphicController_printFrame(void);

void dd_GraphicController_forceFullFrameUpdate(void);

void dd_GraphicController_forceNextFrameUpdate(void);

char dd_GraphicController_isFrameUpdateForced(void);

void dd_GraphicController_releaseFullFrameUpdate(void);

void dd_GraphicController_invertColors(void);

char dd_GraphicController_isNextFrameUpdateForced(void);

char dd_GraphicController_areColorsInverted(void);

void dd_GraphicController_queueColorInversion(void);

char dd_GraphicController_isColorInversionQueued(void);

void dd_GraphicController_handleAlert(void);

void dd_GraphicController_timerSetup(void);

void dd_GraphicController_onTimerInterrupt(void);

#include "../libs/basic.h"
#include "../libs/eGlcd.h"
#include "../libs/dsPIC.h"
#include "display/fonts/font_dynamis_gears.h"
#include "display/fonts/font_dynamis_big.h"
#include "display/fonts/font_dynamis_terminal.h"
#include "display/fonts/font_dynamis_xTerminal.h"
#include "display/fonts/font_dynamis_dashboard.h"
#include "display/fonts/dynamis_logo.h"
#include "display/dd_menu.h"
#include "display/dd_dashboard.h"
#include "display/dd_interfaces.h"

#endif /* DD_GRAPHIC_CONTROLLER_H */