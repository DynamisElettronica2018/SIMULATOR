//
// Created by Aaron Russo on 19/03/16.
//

#include <string.h>
#include "dd_indicators.h"

void dd_Indicators_loadDefaults(void) {
    unsigned int i;
    for (i = 0; i < INDICATORS_TOTAL_COUNT; i += 1) {
        dd_Dashboard_addIndicator(INDICATORS_LIST[i], PARAMETERS_DESCRIPTIONS[INDICATORS_LIST[i]]);
        dd_Indicator_setStringValue(INDICATORS_LIST[i], "?");
    }
    for (i = 0; i < MAX_VISIBLE_INDICATORS; i += 1) {
        dd_Indicator_setPrintPosition(DEFAULT_INDICATORS[i], i);
    }
}

char dd_Indicators_isDefault(unsigned char indicator) {
    unsigned char i;
    for (i = 0; i < sizeof(DEFAULT_INDICATORS); i += 1) {
        if (indicator == DEFAULT_INDICATORS[i]) {
            return TRUE;
        }
    }
    return FALSE;
}

void dd_Indicator_setPrintPosition(unsigned char id, unsigned char position) {
    unsigned char i;
    for (i = 0; i < dd_Dashboard_indicatorsCount; i += 1) {
        if (dd_indicators[i].id == id) {
            dd_Indicator_setAsVisible(i);
            dd_Dashboard_requestIndicatorFullPrintUpdate(i);
            dd_indicators[i].printPosition = position;
        } else if (dd_indicators[i].printPosition == position) {
            dd_Indicator_hide(i);
            dd_Dashboard_requestIndicatorFullPrintUpdate(i);
        }
    }
}

void dd_Indicator_setStringValue(unsigned char id, char *value) {
    unsigned char indicatorIndex = dd_Dashboard_getIndicatorIndex(id);
    strcpy(dd_indicators[indicatorIndex].stringValue, value);
    dd_Dashboard_requestIndicatorPrintUpdate(indicatorIndex);
    dd_indicators[indicatorIndex].valueType = STRING;
    dd_indicators[indicatorIndex].isFirstValue = FALSE;
}

void dd_Indicator_setIntValue(unsigned char id, int value) {
    unsigned char indicatorIndex = dd_Dashboard_getIndicatorIndex(id);
    if (dd_indicators[indicatorIndex].intValue != value
        || dd_indicators[indicatorIndex].isFirstValue
        || dd_indicators[indicatorIndex].valueType != INT) {
        dd_indicators[indicatorIndex].intValue = value;
        dd_indicators[indicatorIndex].valueType = INT;
        dd_indicators[indicatorIndex].isFirstValue = FALSE;
        dd_Dashboard_requestIndicatorPrintUpdate(indicatorIndex);
    }
}

void dd_Indicator_setFloatValue(unsigned char id, float value) {
    unsigned char indicatorIndex = dd_Dashboard_getIndicatorIndex(id);
    if (dd_indicators[indicatorIndex].floatValue != value
        || dd_indicators[indicatorIndex].isFirstValue
        || dd_indicators[indicatorIndex].valueType != FLOAT) {
        dd_indicators[indicatorIndex].floatValue = value;
        dd_indicators[indicatorIndex].valueType = FLOAT;
        dd_indicators[indicatorIndex].isFirstValue = FALSE;
        dd_Dashboard_requestIndicatorPrintUpdate(indicatorIndex);
    }
}

void dd_Indicator_setBoolValue(unsigned char id, char value) {
    unsigned char indicatorIndex = dd_Dashboard_getIndicatorIndex(id);
    if (dd_indicators[indicatorIndex].boolValue != value
        || dd_indicators[indicatorIndex].isFirstValue
        || dd_indicators[indicatorIndex].valueType != BOOL) {
        dd_indicators[indicatorIndex].boolValue = value;
        dd_indicators[indicatorIndex].valueType = BOOL;
        dd_indicators[indicatorIndex].isFirstValue = FALSE;
        dd_Dashboard_requestIndicatorPrintUpdate(indicatorIndex);
    }
}

void dd_Indicator_switchBoolValue(unsigned char id) {
    unsigned char indicatorIndex = dd_Dashboard_getIndicatorIndex(id);
    dd_indicators[indicatorIndex].boolValue = !dd_indicators[indicatorIndex].boolValue;
    dd_indicators[indicatorIndex].valueType = BOOL;
    dd_indicators[indicatorIndex].isFirstValue = FALSE;
    dd_Dashboard_requestIndicatorPrintUpdate(indicatorIndex);
}

void dd_Indicator_setAsVisible(unsigned char indicatorIndex) {
    dd_indicators[indicatorIndex].isVisible = TRUE;
}

void dd_Indicator_hide(unsigned char indicatorIndex) {
    dd_indicators[indicatorIndex].isVisible = FALSE;
}

char dd_Indicator_isVisible(unsigned char indicatorIndex) {
    return dd_indicators[indicatorIndex].isVisible;
}

void dd_printIndicator(unsigned char indicatorIndex) {
    unsigned char x, y, oldValueWidth;
    oldValueWidth = dd_indicators[indicatorIndex].valueWidth;

    eGlcd_setFont(DD_Dashboard_Font);
    //Make coordinates
    x = dd_Indicator_getValueX(indicatorIndex);
    y = dd_Indicator_getValueY(indicatorIndex);
    //Clear text
    eGlcd_clearText(dd_indicators[indicatorIndex].stringValue, x, y);
    //Update string value
    dd_Indicator_makeTextValue(indicatorIndex);
    if (oldValueWidth != dd_indicators[indicatorIndex].valueWidth) {
        //Update value x if string width is different
        x = dd_Indicator_getValueX(indicatorIndex);
    }
    eGlcd_writeText(dd_indicators[indicatorIndex].stringValue, x, y);

    if (dd_GraphicController_isFrameUpdateForced() ||
        dd_Dashboard_isPrintedIndicatorRequestingFullUpdate(indicatorIndex)) {
        dd_Indicator_drawContainers(indicatorIndex);
        x = dd_Indicator_getDescriptionX(indicatorIndex);
        y = dd_Indicator_getDescriptionY(indicatorIndex);
        eGlcd_setFont(DD_xTerminal_Font);
        eGlcd_overwriteText(dd_indicators[indicatorIndex].description, dd_indicators[indicatorIndex].description, x, y);
    }

    dd_Dashboard_clearIndicatorPrintUpdateRequest(indicatorIndex);
}

void dd_Indicator_drawContainers(unsigned char indicatorIndex) {
    unsigned char x, y;
    x = INDICATORS_POSITION_COORDINATES[dd_indicators[indicatorIndex].printPosition][X];
    y = INDICATORS_POSITION_COORDINATES[dd_indicators[indicatorIndex].printPosition][Y];
    eGlcd(Glcd_Rectangle_Round_Edges(
            x + INDICATOR_MARGIN,
            y + INDICATOR_MARGIN,
            x + INDICATOR_MARGIN + INDICATOR_WIDTH,
            y + INDICATOR_MARGIN + INDICATOR_HEIGHT,
            INDICATOR_RADIUS,
            BLACK
    ););
}

unsigned char dd_Indicator_getDescriptionX(unsigned char indicatorIndex) {
    return (unsigned char) (INDICATORS_POSITION_COORDINATES[dd_indicators[indicatorIndex].printPosition][X] +
                            INDICATOR_WIDTH / 2 -
                            (dd_indicators[indicatorIndex].descriptionLength * INDICATOR_FONT_WIDTH) / 2);
}

unsigned char dd_Indicator_getDescriptionY(unsigned char indicatorIndex) {
    return (unsigned char) (INDICATORS_POSITION_COORDINATES[dd_indicators[indicatorIndex].printPosition][Y] +
                            INDICATOR_RADIUS);
}

unsigned char dd_Indicator_getValueX(unsigned char indicatorIndex) {
    return (unsigned char) (
            (INDICATORS_POSITION_COORDINATES[dd_indicators[indicatorIndex].printPosition][X] + INDICATOR_WIDTH / 2) -
            (dd_indicators[indicatorIndex].valueWidth * INDICATOR_FONT_WIDTH) / 2);
}

unsigned char dd_Indicator_getValueY(unsigned char indicatorIndex) {
    return (unsigned char) (INDICATORS_POSITION_COORDINATES[dd_indicators[indicatorIndex].printPosition][Y] +
                            ((INDICATOR_HEIGHT - (INDICATOR_RADIUS + INDICATOR_FONT_HEIGHT)) / 2) +
                            (INDICATOR_RADIUS + INDICATOR_FONT_HEIGHT) - (DASHBOARD_FONT_HEIGHT / 2) +
                            INDICATOR_MARGIN);
}

void dd_Indicator_makeTextValue(unsigned char indicatorIndex) {
    unsigned char valueType = dd_indicators[indicatorIndex].valueType;
    if (valueType != STRING) {
        emptyString(dd_indicators[indicatorIndex].stringValue);
        switch (valueType) {
            case INT:
                sprintf(dd_indicators[indicatorIndex].stringValue, "%i", dd_indicators[indicatorIndex].intValue);
                break;
            case FLOAT:
                sprintf(dd_indicators[indicatorIndex].stringValue, "%.1f", dd_indicators[indicatorIndex].floatValue);
                break;
            case BOOL:
                if (dd_indicators[indicatorIndex].boolValue) {
                    strcpy(dd_indicators[indicatorIndex].stringValue, STRING_TRUE);
                } else {
                    strcpy(dd_indicators[indicatorIndex].stringValue, STRING_FALSE);
                }
                break;
            case NULL:
            default:
                break;
        }
    }
    dd_indicators[indicatorIndex].valueWidth = (unsigned char) strlen(dd_indicators[indicatorIndex].stringValue);
}

