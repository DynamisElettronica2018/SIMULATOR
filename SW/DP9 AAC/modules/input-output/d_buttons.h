//
// Created by Aaron Russo on 16/03/16.
//

#ifndef DP8_DISPLAY_CONTROLLER_CONTROLLER_H
#define DP8_DISPLAY_CONTROLLER_CONTROLLER_H

#include "../../libs/buttons.c"
#include "../dd_graphic_controller.h"
#include "../../modules/d_can.h"
#include "../d_start.h"
#include "../d_rio.h"
#include "../d_hardReset.h"
#include "../d_acceleration.h"
#include "../d_ebb.h"

#define button_onNeutral    button_onL2Down

#define button_onMenuUp  button_onR1Down

#define button_onMenuDown button_onR2Down

#define button_onMenuOk   button_onL1Down

#define button_onMenuRight  button_onR3Down

#define button_onMenuLeft   button_onL3Down

#define button_onGearDown   button_onBLDown

#define button_onGearUp button_onBRDown

#define button_onStart  button_onCDown

#define BUTTON_NEUTRAL   BUTTON_L2
#define BUTTON_MENU_UP    BUTTON_R1
#define BUTTON_MENU_DOWN    BUTTON_R2
#define BUTTON_MENU_OK  BUTTON_L1
#define BUTTON_MENU_RIGHT   BUTTON_R3
#define BUTTON_MENU_LEFT    BUTTON_L3
#define BUTTON_GEAR_DOWN    BUTTON_BL
#define BUTTON_GEAR_UP  BUTTON_BR
#define BUTTON_START    BUTTON_C

#endif //DP8_DISPLAY_CONTROLLER_CONTROLLER_H