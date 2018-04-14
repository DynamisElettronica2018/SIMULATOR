//
// Created by Aaron Russo on 19/03/16.
//

#ifndef DP8_DISPLAY_CONTROLLER_INDICATORS_H
#define DP8_DISPLAY_CONTROLLER_INDICATORS_H

#include "dd_dashboard.h"

#define MAX_INDICATOR_PARAMETER_VALUE_LENGTH 5
#define MAX_INDICATOR_PARAMETER_DESCRIPTION_LENGTH 10

#define INDICATOR_MARGIN 1
const unsigned char INDICATOR_HEIGHT = (unsigned char) (SCREEN_HEIGHT / 2) - (INDICATOR_MARGIN * 2) - 1;
const unsigned char INDICATOR_WIDTH =
        (unsigned char) ((SCREEN_WIDTH - DynamisFont_Gears_WIDTH - INDICATOR_MARGIN * 4) / 2) - 1;
#define INDICATOR_FONT_WIDTH DynamisFont_xTerminal_WIDTH
#define INDICATOR_FONT_HEIGHT DynamisFont_xTerminal_HEIGHT
#define DASHBOARD_FONT_HEIGHT DynamisFont_Dashboard_HEIGHT

#define TOP_LEFT 0
#define TOP_RIGHT 1
#define BOTTOM_LEFT 2
#define BOTTOM_RIGHT 3

#define X 0
#define Y 1
#define INDICATOR_RADIUS 3
#define INDICATOR0_X 0
#define INDICATOR0_Y 0
#define INDICATOR1_X SCREEN_WIDTH - INDICATOR_WIDTH - INDICATOR_MARGIN * 2 - 1
#define INDICATOR1_Y INDICATOR0_Y
#define INDICATOR2_X INDICATOR0_X
#define INDICATOR2_Y SCREEN_HEIGHT - INDICATOR_HEIGHT - INDICATOR_MARGIN * 2 - 1
#define INDICATOR3_X INDICATOR1_X
#define INDICATOR3_Y INDICATOR2_Y

const unsigned char INDICATORS_POSITION_COORDINATES[INDICATORS_TOTAL_COUNT][2] = {
        {INDICATOR0_X, INDICATOR0_Y},
        {INDICATOR1_X, INDICATOR1_Y},
        {INDICATOR2_X, INDICATOR2_Y},
        {INDICATOR3_X, INDICATOR3_Y}};

//Indicator value types
#define STRING 0
#define INT 1
#define FLOAT 2
#define BOOL 3
#define NULL 4

const int BLINK_PERIOD_TICKS = (int) (INDICATOR_BLINK_PERIOD / FRAME_PERIOD);

typedef struct Indicator {
    unsigned char id;
    char pendingPrintUpdate, isVisible, printPosition;
    unsigned char valueType, descriptionLength, valueWidth;
    char description[MAX_INDICATOR_PARAMETER_DESCRIPTION_LENGTH];
    char stringValue[MAX_INDICATOR_PARAMETER_VALUE_LENGTH];
    int intValue;
    float floatValue;
    char boolValue;
    char isFirstValue;
};

ydata struct Indicator dd_indicators[INDICATORS_TOTAL_COUNT];
unsigned char dd_Dashboard_indicatorsCount = 0;

void dd_Indicators_loadDefaults(void);

char dd_Indicators_isDefault(unsigned char indicator);

/*
 * Set indicator print at given position,
 * will also overwrite current indicator with same position
 */
void dd_Indicator_setPrintPosition(unsigned char id, unsigned char position);

void dd_Indicator_setAsVisible(unsigned char indicatorIndex);

void dd_Indicator_hide(unsigned char indicatorIndex);

char dd_Indicator_isVisible(unsigned char indicatorIndex);

void dd_Indicator_setStringValue(unsigned char id, char *value);

void dd_Indicator_setIntValue(unsigned char id, int value);

void dd_Indicator_setFloatValue(unsigned char id, float value);

void dd_Indicator_setBoolValue(unsigned char id, char value);

void dd_Indicator_switchBoolValue(unsigned char id);

void dd_printIndicator(unsigned char indicatorIndex);

void dd_Indicator_drawContainers(unsigned char indicatorIndex);

void dd_Indicator_makeTextValue(unsigned char indicatorIndex);

unsigned char dd_Indicator_getDescriptionX(unsigned char indicatorIndex);

unsigned char dd_Indicator_getDescriptionY(unsigned char indicatorIndex);

unsigned char dd_Indicator_getValueX(unsigned char indicatorIndex);

unsigned char dd_Indicator_getValueY(unsigned char indicatorIndex);

#endif //DP8_DISPLAY_CONTROLLER_INDICATORS_H