//
// Created by Aaron Russo on 20/03/16.
//

#include "dd_interfaces.h"

#define dd_SettingsMenuLine_IndicatorIndex(x) dd_menuLines[x].intValue
#define dd_SettingsMenuLine_IndicatorPosition(x) dd_menuLines[x].boolValue

void dd_Interface_printMessage(char *title) {
    unsigned char x, y;
    if (dd_GraphicController_isFrameUpdateForced()) {
        eGlcd_invertColors();
        eGlcd_clear();
        dd_Interface_drawTitle(title);
        eGlcd_setFont(DD_Dashboard_Font);
        x = dd_Interface_getTitleX(dd_alertMessage);
        y = SCREEN_Y_MIDDLE;
        eGlcd_writeText(dd_alertMessage, x, y);
        eGlcd_invertColors();
    }
}

void dd_Interface_printDashboard(void) {
    dd_Dashboard_printGearLetter();
    dd_Dashboard_printIndicators();
}

void dd_Interface_printSettings(void) {
    if (dd_GraphicController_isFrameUpdateForced()) {
        dd_Menu_reset();
        dd_Menu_setY_OFFSET(3);
        dd_Menu_setHeight(5);
        dd_Menu_addLine(S_DASHBOARD_TOP_LEFT, "D. Top L");
        dd_Menu_addLine(S_DASHBOARD_TOP_RIGHT, "D. Top R");
        dd_Menu_addLine(S_DASHBOARD_BOTTOM_LEFT, "D. Bottom L");
        dd_Menu_addLine(S_DASHBOARD_BOTTOM_RIGHT, "D. Bottom R");
        dd_Menu_addLine(S_INVERT_COLORS, "Invert colors");
        dd_Menu_addLine(S_BYPASS_GEARS, "Bypass gear shift");

        dd_SettingsMenuLine_IndicatorIndex(S_DASHBOARD_TOP_LEFT) = dd_Dashboard_getIndicatorIndexAtPosition(TOP_LEFT);
        dd_SettingsMenuLine_IndicatorPosition(S_DASHBOARD_TOP_LEFT) = TOP_LEFT;
        dd_MenuLine_setStringValue(S_DASHBOARD_TOP_LEFT,
                                   dd_indicators[dd_Dashboard_getIndicatorIndexAtPosition(TOP_LEFT)].description);

        dd_SettingsMenuLine_IndicatorIndex(S_DASHBOARD_TOP_RIGHT) = dd_Dashboard_getIndicatorIndexAtPosition(TOP_RIGHT);
        dd_SettingsMenuLine_IndicatorPosition(S_DASHBOARD_TOP_RIGHT) = TOP_RIGHT;
        dd_MenuLine_setStringValue(S_DASHBOARD_TOP_RIGHT,
                                   dd_indicators[dd_Dashboard_getIndicatorIndexAtPosition(TOP_RIGHT)].description);

        dd_SettingsMenuLine_IndicatorIndex(S_DASHBOARD_BOTTOM_LEFT) = dd_Dashboard_getIndicatorIndexAtPosition(
                BOTTOM_LEFT);
        dd_SettingsMenuLine_IndicatorPosition(S_DASHBOARD_TOP_RIGHT) = BOTTOM_LEFT;
        dd_MenuLine_setStringValue(S_DASHBOARD_BOTTOM_LEFT,
                                   dd_indicators[dd_Dashboard_getIndicatorIndexAtPosition(BOTTOM_LEFT)].description);

        dd_SettingsMenuLine_IndicatorIndex(S_DASHBOARD_BOTTOM_RIGHT) = dd_Dashboard_getIndicatorIndexAtPosition(
                BOTTOM_RIGHT);
        dd_SettingsMenuLine_IndicatorPosition(S_DASHBOARD_TOP_RIGHT) = BOTTOM_RIGHT;

        dd_MenuLine_setStringValue(S_DASHBOARD_BOTTOM_RIGHT,
                                   dd_indicators[dd_Dashboard_getIndicatorIndexAtPosition(BOTTOM_RIGHT)].description);
        dd_MenuLine_setBoolValue(S_INVERT_COLORS, dd_GraphicController_areColorsInverted());

        dd_MenuLine_setBoolValue(S_BYPASS_GEARS, dGear_isShiftingCheckBypassed());

        dd_Interface_drawTitle("Settings");
    }
    dd_printMenu();
}

#define DID_NOT_CHANGE 50
#define NO_INDICATOR_TO_CHANGE 255
unsigned char indexIndicatorToChange = NO_INDICATOR_TO_CHANGE;
unsigned char positionToChange;

void dd_Interface_onSettingsChange(char direction) {
    unsigned char indexIndicator, position;
    position = DID_NOT_CHANGE;
    switch (dd_Menu_SelectedLine) {
        case S_DASHBOARD_TOP_LEFT:
            position = TOP_LEFT;
            break;
        case S_DASHBOARD_TOP_RIGHT:
            position = TOP_RIGHT;
            break;
        case S_DASHBOARD_BOTTOM_LEFT:
            position = BOTTOM_LEFT;
            break;
        case S_DASHBOARD_BOTTOM_RIGHT:
            position = BOTTOM_RIGHT;
            break;
        case S_INVERT_COLORS:
            dd_GraphicController_invertColors();
            dd_MenuLine_switchBoolValue(S_INVERT_COLORS);
            break;
        case S_BYPASS_GEARS:
            if (dGear_isShiftingCheckBypassed()) {
                dGear_enableShiftCheck();
                dd_MenuLine_setBoolValue(S_BYPASS_GEARS, FALSE);
            } else {
                dGear_disableShiftCheck();
                dd_MenuLine_setBoolValue(S_BYPASS_GEARS, TRUE);
            }
            break;
        default:
            break;
    }
    if (position != DID_NOT_CHANGE) {
        //char msg[15];
        //Line int value is used to store the index indicator
        indexIndicator = dd_menuLines[dd_Menu_SelectedLine].intValue;
        //sprintf(msg,"%d",indexIndicator);
        if (direction == RIGHT) {
            indexIndicator += 1;
            if (indexIndicator == dd_Dashboard_indicatorsCount) {
                indexIndicator = 0;
            }
        } else {
            if (indexIndicator > 0) {
                indexIndicator -= 1;
            } else {
                indexIndicator = dd_Dashboard_indicatorsCount - 1;
            }
        }
        //dd_Dashboard_fireTimedMessage(2, msg, MESSAGE_TYPE_MESSAGE);
        indexIndicatorToChange = indexIndicator;
        positionToChange = position;
        dd_menuLines[dd_Menu_SelectedLine].intValue = indexIndicator;
        dd_MenuLine_setStringValue(dd_Menu_SelectedLine, dd_indicators[indexIndicator].description);
    }
}

void dd_Interface_applySettings(void) {
    if (indexIndicatorToChange != NO_INDICATOR_TO_CHANGE) {
        dd_Indicator_setPrintPosition(dd_indicators[indexIndicatorToChange].id, positionToChange);
    }
}

void dd_Interface_printDebug(void) {
    unsigned char i;
    if (dd_GraphicController_isFrameUpdateForced()) {
        dd_Interface_drawTitle("Debug");
        dd_Menu_reset();
        dd_Menu_setY_OFFSET(3);
        dd_Menu_setHeight(5);
        for (i = 0; i < sizeof(INDICATORS_LIST); i += 1) {
            dd_Menu_addLine(i, dd_indicators[i].description);
        }
    }
    for (i = 0; i < sizeof(INDICATORS_LIST); i += 1) {
        //dd_MenuLine_setIntValue(i, dd_)
        switch (dd_indicators[i].valueType) {
            case STRING:
                dd_MenuLine_setStringValue(i, dd_indicators[i].stringValue);
                break;
            case INT:
                dd_MenuLine_setIntValue(i, dd_indicators[i].intValue);
                break;
            case FLOAT:
                dd_MenuLine_setFloatValue(i, dd_indicators[i].floatValue);
                break;
            case BOOL:
                dd_MenuLine_setBoolValue(i, dd_indicators[i].boolValue);
                break;
            default:
                break;
        }
    }
    dd_printMenu();
}

void dd_Interface_printParameterPage(unsigned char parameter) {
    unsigned char x, y, oldValueWidth, indicatorIndex;
    indicatorIndex = dd_Dashboard_getIndicatorIndex(parameter);
    oldValueWidth = dd_indicators[indicatorIndex].valueWidth;

    if (dd_GraphicController_isFrameUpdateForced()) {
        dd_Interface_drawTitle(dd_indicators[indicatorIndex].description);
    }

    if (!dd_GraphicController_isFrameUpdateForced() &&
        !dd_Dashboard_isPrintedIndicatorRequestingUpdate(indicatorIndex)) {
        return;
    }

    eGlcd_setFont(DD_Big_Font);
    //Make coordinates
    x = dd_Interface_getTitleX(dd_indicators[indicatorIndex].stringValue);
    y = dd_Interface_getParameterValueY();
    //Clear text
    eGlcd_clearText(dd_indicators[indicatorIndex].stringValue, x, y);
    //Update string value
    dd_Indicator_makeTextValue(indicatorIndex);
    if (oldValueWidth != dd_indicators[indicatorIndex].valueWidth) {
        //Update value x if string width is different
        x = dd_Interface_getTitleX(dd_indicators[indicatorIndex].stringValue);
    }
    eGlcd_writeText(dd_indicators[indicatorIndex].stringValue, x, y);

    dd_Dashboard_clearIndicatorPrintUpdateRequest(indicatorIndex);
}

void dd_Interface_drawTitle(char *title) {
    eGlcd_setFont(DD_Dashboard_Font);
    eGlcd_writeText(title, dd_Interface_getTitleX(title), dd_Interface_getTitleY());
    dd_Interface_drawTitleContainers();
}

void dd_Interface_drawTitleContainers(void) {
    unsigned char x, y;
    eGlcd(Glcd_Rectangle_Round_Edges(
            INDICATOR_MARGIN,
            INDICATOR_MARGIN,
            SCREEN_WIDTH - INDICATOR_MARGIN * 2,
            DASHBOARD_FONT_HEIGHT + PARAMETER_TOP_MARGIN * 2,
            INDICATOR_RADIUS,
            BLACK
    ););
}

unsigned char dd_Interface_getTitleX(char *title) {
    return (unsigned char) (SCREEN_X_MIDDLE - eGlcd_getTextPixelLength(title) / 2);
}

unsigned char dd_Interface_getTitleY(void) {
    return PARAMETER_TOP_MARGIN + INDICATOR_MARGIN;
}

unsigned char dd_Interface_getParameterValueX(unsigned char indicatorIndex) {
    return (unsigned char) (SCREEN_X_MIDDLE -
                            (dd_indicators[indicatorIndex].valueWidth * PARAMETER_VALUE_FONT_WIDTH) / 2);
}

unsigned char dd_Interface_getParameterValueY(void) {
    return (unsigned char) (PARAMETER_TOP_MARGIN * 2 + PARAMETER_DESCRIPTION_FONT_HEIGHT +
                            ((SCREEN_HEIGHT - (PARAMETER_TOP_MARGIN * 2 + PARAMETER_DESCRIPTION_FONT_HEIGHT)) / 2) -
                            (PARAMETER_VALUE_FONT_HEIGHT / 2));
}