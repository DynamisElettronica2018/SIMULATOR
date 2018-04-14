//
//  DP8 Graphic LCD Controller
//  Aaron Russo 01/03/2016
//
//  See .h for documentation
//

#include "dd_graphic_controller.h"

unsigned char dd_graphicInterfaceIndex = 0, dd_lastGraphicInterfaceIndex = 0;
char dd_isInterfaceChangedFromLastFrame = FALSE, dd_isFrameUpdateForced = FALSE, dd_isNextFrameUpdateForced = FALSE, dd_isColorInversionQueued = FALSE;

void dd_GraphicController_init(void) {
    DD_BACKLIGHT_PIN_DIRECTION = OUTPUT;
    dd_GraphicController_turnOnBacklight();
    eGlcd_init();
    //We have to initialize our Dashboard inside the Graphic Controller initialization
    dd_Dashboard_init();
    eGlcd_clear();
    dd_GraphicController_setInterface(DASHBOARD_INTERFACE);
    dd_GraphicController_printFrame(); //Frame 0 needed
    dd_GraphicController_timerSetup();
}

void dd_GraphicController_turnOnBacklight(void) {
    DD_BACKLIGHT_PIN = TRUE;
}

void dd_GraphicController_turnOffBacklight(void) {
    DD_BACKLIGHT_PIN = FALSE;
}

void dd_GraphicController_switchBacklight(void) {
    DD_BACKLIGHT_PIN = !DD_BACKLIGHT_PIN;
}

void dd_GraphicController_invertColors(void) {
    dd_GraphicController_queueColorInversion();
    dd_GraphicController_forceNextFrameUpdate();
}

char dd_GraphicController_areColorsInverted(void) {
    return BLACK == PIXEL_OFF;
}

void dd_GraphicController_setInterface(unsigned char interface) {
    unsigned char i;
    dd_isInterfaceChangedFromLastFrame = TRUE;
    dd_GraphicController_saveInterfaceIndex();
    dd_graphicInterfaceIndex = 0;
    for (i = 0; i < sizeof(INTERFACE_LIST); i += 1) {
        if (INTERFACE_LIST[i] == interface) {
            dd_graphicInterfaceIndex = i;
            break;
        }
    }
}

unsigned char dd_GraphicController_getInterface(void) {
    return INTERFACE_LIST[dd_graphicInterfaceIndex];
}

char dd_GraphicController_isInterfaceChangedFromLastFrame(void) {
    return dd_isInterfaceChangedFromLastFrame;
}

void dd_GraphicController_switchNextInterface(void) {
    dd_GraphicController_saveInterfaceIndex();
    if (dd_graphicInterfaceIndex < (sizeof(INTERFACE_LIST) - 1 - NOT_SWITCHABLE_INTERFACES)) {
        dd_graphicInterfaceIndex += 1;
    }
    dd_isInterfaceChangedFromLastFrame = TRUE;
}

void dd_GraphicController_switchPreviousInterface(void) {
    dd_GraphicController_saveInterfaceIndex();
    if (dd_graphicInterfaceIndex > 0) {
        dd_graphicInterfaceIndex -= 1;
    }
    dd_isInterfaceChangedFromLastFrame = TRUE;
}

void dd_GraphicController_switchLastInterface(void) {
    dd_GraphicController_setInterface(INTERFACE_LIST[dd_lastGraphicInterfaceIndex]);
}

void dd_GraphicController_saveInterfaceIndex(void) {
    if (dd_lastGraphicInterfaceIndex != dd_graphicInterfaceIndex) {
        dd_lastGraphicInterfaceIndex = dd_graphicInterfaceIndex;
    }
}

void dd_GraphicController_printFrame(void) {
    if (dd_GraphicController_isColorInversionQueued()) {
        eGlcd_invertColors();
        dd_isColorInversionQueued = FALSE;
    }
    if (dd_GraphicController_isInterfaceChangedFromLastFrame() || dd_GraphicController_isNextFrameUpdateForced()) {
        eGlcd_clear();
        dd_GraphicController_forceFullFrameUpdate();
        dd_isInterfaceChangedFromLastFrame = FALSE;
    }
    switch (INTERFACE_LIST[dd_graphicInterfaceIndex]) {
        case DASHBOARD_INTERFACE:
            dd_Interface_printDashboard();
            break;
        case ACC_TIME_INTERFACE:
            dd_Interface_printParameterPage(ACC_TIME);
            break;
        case EBB_INTERFACE:
            dd_Interface_printParameterPage(EBB);
            break;
        case TRIM1_INTERFACE:
            dd_Interface_printParameterPage(TRIM1);
            break;
        case TRIM2_INTERFACE:
            dd_Interface_printParameterPage(TRIM2);
            break;
        case SETTINGS_INTERFACE:
            dd_Interface_printSettings();
            break;
        case DEBUG_INTERFACE:
            dd_Interface_printDebug();
            break;
        case ERROR_INTERFACE:
            dd_Interface_printMessage("ERROR");
            break;
        case WARNING_INTERFACE:
            dd_Interface_printMessage("Warning");
            break;
        case MESSAGE_INTERFACE:
            dd_Interface_printMessage("Message");
            break;
        default:
            break;
    }
    if (dd_GraphicController_isFrameUpdateForced()) {
        dd_isFrameUpdateForced = FALSE;
    }
    if (dd_GraphicController_isNextFrameUpdateForced()) {
        dd_isNextFrameUpdateForced = FALSE;
    }
    dd_GraphicController_handleAlert();
}

void dd_GraphicController_forceFullFrameUpdate(void) {
    dd_isFrameUpdateForced = TRUE;
}

void dd_GraphicController_releaseFullFrameUpdate(void) {
    dd_isFrameUpdateForced = FALSE;
}

void dd_GraphicController_forceNextFrameUpdate(void) {
    dd_isNextFrameUpdateForced = TRUE;
}

char dd_GraphicController_isFrameUpdateForced(void) {
    return dd_isFrameUpdateForced;
}

char dd_GraphicController_isNextFrameUpdateForced(void) {
    return dd_isNextFrameUpdateForced;
}

void dd_GraphicController_queueColorInversion(void) {
    dd_isColorInversionQueued = TRUE;
}

char dd_GraphicController_isColorInversionQueued(void) {
    return dd_isColorInversionQueued;
}

void dd_GraphicController_handleAlert(void) {
    if (dd_alertTicks > 0) {
        dd_alertTicks -= 1;
        if (dd_alertTicks == 0) {
            dd_Dashboard_clearAlerts();
        }
    }
}

void dd_GraphicController_timerSetup(void) {
    setTimer(TIMER1_DEVICE, FRAME_PERIOD);
    setInterruptPriority(TIMER1_DEVICE, VERY_HIGH_PRIORITY);
    clearTimer1();
}

void dd_GraphicController_onTimerInterrupt(void) {
    clearTimer1();
#ifdef LED_FRAME_DEBUG
    LED_DEBUG_PIN_DIRECTION = OUTPUT;
    LED_DEBUG_PIN = TRUE;
#endif
    dd_GraphicController_printFrame();
#ifdef LED_FRAME_DEBUG
    LED_DEBUG_PIN = FALSE;
#endif
}