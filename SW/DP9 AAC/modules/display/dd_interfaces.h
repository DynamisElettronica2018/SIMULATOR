//
// Created by Aaron Russo on 20/03/16.
//

#ifndef DP8_DISPLAY_CONTROLLER_DD_INTERFACES_H
#define DP8_DISPLAY_CONTROLLER_DD_INTERFACES_H

#include "../dd_graphic_controller.h"
#include "dd_dashboard.h"
#include "dd_menu.h"
#include "dd_indicators.h"

//Graphics defines
#define PARAMETER_DESCRIPTION_FONT_WIDTH (DynamisFont_Dashboard_WIDTH - DynamisFont_Dashboard_WIDTH/4)
#define PARAMETER_DESCRIPTION_FONT_HEIGHT DynamisFont_Dashboard_HEIGHT
#define PARAMETER_VALUE_FONT_WIDTH (DynamisFont_Big_WIDTH - DynamisFont_Big_WIDTH/4)
#define PARAMETER_VALUE_FONT_HEIGHT DynamisFont_Big_HEIGHT
#define PARAMETER_TOP_MARGIN 3

void dd_Interface_printMessage(char *title);

void dd_Interface_printDashboard(void);

void dd_Interface_printSettings(void);

void dd_Interface_onSettingsChange(char direction);

void dd_Interface_applySettings(void);

void dd_Interface_printDebug(void);

void dd_Interface_printParameterPage(unsigned char parameter);

void dd_Interface_drawTitle(char *title);

void dd_Interface_drawTitleContainers(void);

unsigned char dd_Interface_getTitleX(char *title);

unsigned char dd_Interface_getTitleY(void);

unsigned char dd_Interface_getParameterValueX(unsigned char indicatorIndex);

unsigned char dd_Interface_getParameterValueY(void);

//Settings
#define S_DASHBOARD_TOP_LEFT 0
#define S_DASHBOARD_TOP_RIGHT 1
#define S_DASHBOARD_BOTTOM_LEFT 2
#define S_DASHBOARD_BOTTOM_RIGHT 3
#define S_INVERT_COLORS 4
#define S_BYPASS_GEARS 5

#endif //DP8_DISPLAY_CONTROLLER_DD_INTERFACES_H