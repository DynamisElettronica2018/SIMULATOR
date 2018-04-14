//
//  DP8 LCD Dashboard
//  Aaron Russo 01/03/2016
//

#include <string.h>
#include "dd_dashboard.h"

char dd_lastPrintedGearLetter = GEAR_INIT_VALUE;

void dd_Dashboard_init(void) {
    dGear_set((unsigned char)0);
    dGear_setNeutral();
    dd_Indicators_loadDefaults();
    if (!dHardReset_hasBeenReset()) {
        dd_Dashboard_startupLogo();
    }
}

void dd_Dashboard_fireTimedMessage(float time_seconds, char *text, unsigned char type) {
    dd_Dashboard_setAlertTimeout(time_seconds);
    dd_Dashboard_fireMessage(text, type);
}

void dd_Dashboard_fireMessage(char *text, unsigned char type) {
    strcpy(dd_alertMessage, text);
    switch (type) {
        case MESSAGE_TYPE_MESSAGE:
            dd_GraphicController_setInterface(MESSAGE_INTERFACE);
            break;
        case MESSAGE_TYPE_WARNING:
            dd_GraphicController_setInterface(WARNING_INTERFACE);
            break;
        case MESSAGE_TYPE_ERROR:
            dd_GraphicController_setInterface(ERROR_INTERFACE);
            break;
        default:
            dd_GraphicController_setInterface(MESSAGE_INTERFACE);
            break;
    }
}

void dd_Dashboard_clearAlerts(void) {
    if (dd_GraphicController_getInterface() == ERROR_INTERFACE
        || dd_GraphicController_getInterface() == MESSAGE_INTERFACE
        || dd_GraphicController_getInterface() == WARNING_INTERFACE) {
        dd_GraphicController_switchLastInterface();
    }
}


char dd_Dashboard_isGearLetterChanged(void) {
    return dd_lastPrintedGearLetter != dGear_getCurrentGearLetter();
}

void dd_Dashboard_printGearLetter(void) {
    unsigned char newLetter = dGear_getCurrentGearLetter();
    if (dd_Dashboard_isGearLetterChanged() || dd_GraphicController_isFrameUpdateForced()) {
        eGlcd_setFont(DD_Gears_Font);
        eGlcd_overwriteChar(dd_lastPrintedGearLetter, newLetter, GEAR_LETTER_X, GEAR_LETTER_Y);
        dd_lastPrintedGearLetter = newLetter;
    }
}

void dd_Dashboard_addIndicator(unsigned char id, char *description) {
    dd_indicators[dd_Dashboard_indicatorsCount].id = id;
    strcpy(dd_indicators[dd_Dashboard_indicatorsCount].description, description);
    dd_indicators[dd_Dashboard_indicatorsCount].descriptionLength = (unsigned char) strlen(description);
    dd_indicators[dd_Dashboard_indicatorsCount].valueType = NULL;
    dd_indicators[dd_Dashboard_indicatorsCount].pendingPrintUpdate = TRUE;
    dd_indicators[dd_Dashboard_indicatorsCount].isFirstValue = TRUE;
    dd_indicators[dd_Dashboard_indicatorsCount].isVisible = FALSE;
    dd_indicators[dd_Dashboard_indicatorsCount].printPosition = 0;
    dd_Dashboard_indicatorsCount += 1;
}

void dd_Dashboard_requestIndicatorPrintUpdate(unsigned char indicatorIndex) {
    //Requesting indicator update is allowed only if a full update is not pending
    if (dd_indicators[indicatorIndex].pendingPrintUpdate != SUPERPOSITION) {
        dd_indicators[indicatorIndex].pendingPrintUpdate = TRUE;
    }
}

void dd_Dashboard_requestIndicatorFullPrintUpdate(unsigned char indicatorIndex) {
    dd_indicators[indicatorIndex].pendingPrintUpdate = SUPERPOSITION;
}

void dd_Dashboard_clearIndicatorPrintUpdateRequest(unsigned char indicatorIndex) {
    dd_indicators[indicatorIndex].pendingPrintUpdate = FALSE;
}

char dd_Dashboard_isPrintedIndicatorRequestingUpdate(unsigned char indicatorIndex) {
    return dd_indicators[indicatorIndex].pendingPrintUpdate == TRUE ||
           dd_indicators[indicatorIndex].pendingPrintUpdate == SUPERPOSITION;
}

char dd_Dashboard_isPrintedIndicatorRequestingFullUpdate(unsigned char indicatorIndex) {
    return dd_indicators[indicatorIndex].pendingPrintUpdate == SUPERPOSITION;
}

void dd_Dashboard_printIndicators(void) {
    unsigned char index, printOrder;
    for (printOrder = 0; printOrder < MAX_VISIBLE_INDICATORS; printOrder += 1) {
        index = dd_Dashboard_getIndicatorIndexAtPosition(printOrder);
        if (dd_Dashboard_isPrintedIndicatorRequestingUpdate(index) ||
            dd_GraphicController_isFrameUpdateForced()) {
            dd_printIndicator(index);
        }
    }
}

unsigned char dd_Dashboard_getIndicatorIndex(unsigned char id) {
    unsigned char i;
    for (i = 0; i < sizeof(dd_indicators); i += 1) {
        if (dd_indicators[i].id == id) {
            return i;
        }
    }
    return i; //If id doesn't exist what should we do?
}

unsigned char dd_Dashboard_getIndicatorIndexAtPosition(unsigned char position) {
    unsigned char index;
    for (index = 0; index < dd_Dashboard_indicatorsCount; index += 1) {
        if (dd_Indicator_isVisible(index) && dd_indicators[index].printPosition == position) {
            return index;
        }
    }
    return 0;
}

void dd_Dashboard_setAlertTimeout(float time) {
    dd_alertTicks = (unsigned int) ((time / FRAME_PERIOD) + 0.5);
}

void dd_Dashboard_startupLogo(void) {
    const unsigned char step1[DLS_LED_COUNT] = {DLS_GREEN, DLS_BLACK, DLS_BLACK, DLS_BLACK, DLS_BLACK, DLS_RED};
    const unsigned char step2[DLS_LED_COUNT] = {DLS_GREEN, DLS_GREEN, DLS_BLACK, DLS_BLACK, DLS_RED, DLS_RED};
    const unsigned char step3[DLS_LED_COUNT] = {DLS_GREEN, DLS_GREEN, DLS_WHITE, DLS_WHITE, DLS_RED, DLS_RED};
    eGlcd(Glcd_Image(DYNAMIS_LOGO));
    dLedStripe_clear();
    Delay_ms(LOGO_ON_TIME / LOGO_FLAG_STEPS / 2);
    dLedStripe_setLedStripe(step1);
    Delay_ms(LOGO_ON_TIME / LOGO_FLAG_STEPS / 2);
    dLedStripe_setLedStripe(step2);
    Delay_ms(LOGO_ON_TIME / LOGO_FLAG_STEPS / 2);
    dLedStripe_setLedStripe(step3);
    Delay_ms(LOGO_ON_TIME / LOGO_FLAG_STEPS / 2);
    Delay_ms(LOGO_ON_TIME / LOGO_FLAG_STEPS / 2);
    dLedStripe_setLedStripe(step2);
    Delay_ms(LOGO_ON_TIME / LOGO_FLAG_STEPS / 2);
    dLedStripe_setLedStripe(step1);
    Delay_ms(LOGO_ON_TIME / LOGO_FLAG_STEPS / 2);
    dLedStripe_clear();
    Delay_ms(LOGO_ON_TIME / 2);
}