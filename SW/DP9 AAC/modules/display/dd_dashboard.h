//
//  DP8 LCD Dashboard
//  Aaron Russo 01/03/2016
//
//  Dashboard is the main frame
//  Indicator is the small rectangle containing data
//

#ifndef DP8_DISPLAY_CONTROLLER_DD_DASHBOARD_H
#define DP8_DISPLAY_CONTROLLER_DD_DASHBOARD_H

#include "../dd_graphic_controller.h"
#include "../d_gears.h"
#include "../d_ebb.h"
#include "../d_hardReset.h"
#include "../input-output/d_ledStripe.h"

#define LOGO_ON_TIME 1000
#define LOGO_FLAG_STEPS 6

#define GEAR_INIT_VALUE 54
#define DEFAULT_EBB_VALUE 0

#define MAX_EBB_VALUE 3
#define MIN_EBB_VALUE -3

#define INDICATOR_BLINK_PERIOD 0.5

#define MESSAGE_TYPE_MESSAGE    0
#define MESSAGE_TYPE_WARNING    1
#define MESSAGE_TYPE_ERROR      2

#define INDICATORS_TOTAL_COUNT 22
//INDICATORS IDS
#define EBB 0
#define TH2O    1
#define VBAT    2
#define RPM   3
#define CLUTCH_POSITION    4
#define OIL_PRESS 5
#define RIO_ACQUISITION_INDICATOR 6
#define EFI_STATUS 7
#define TRIM1 8
#define TRIM2 9
#define EFI_CRASH_COUNTER 10
#define MAP 11
#define FAN_STATE 12
#define AIR_TEMPERATURE 13
#define ACC_TIME 14
#define FAN_CURRENT 15
#define H2O_PUMP_CURRENT 16
#define FUEL_PUMP_CURRENT 17
#define GCU_TEMP 18
#define CAN_13 19
#define BRK_P_FRONT 18            //GCU_TEMP
#define BRK_P_REAR 19             //CAN_13
#define LST_RESET 20
#define EBB_STATE 21


#define MAX_VISIBLE_INDICATORS 4
const unsigned char DEFAULT_INDICATORS[MAX_VISIBLE_INDICATORS] = {TH2O, EBB, VBAT, OIL_PRESS};
const unsigned char *PARAMETERS_DESCRIPTIONS[] = {
        "EBB", "TH2O", "V.BAT", "RPM",
        "CL", "P.OIL", "A.RIO", "EFION",
        "TRIM1", "TRIM2", "C.EFI", "MAP",
        "S.FAN", "T.AIR", "t.ACC", "C.FAN",
        "C.PH20", "C.FP", "BRK.F", "BRK.R",
        "RST", "EBB.S"
};

const unsigned char INDICATORS_LIST[] = {
        EBB, TH2O, VBAT, RPM,
        CLUTCH_POSITION, OIL_PRESS, RIO_ACQUISITION_INDICATOR, EFI_STATUS,
        TRIM1, TRIM2, EFI_CRASH_COUNTER, MAP,
        FAN_STATE, AIR_TEMPERATURE, ACC_TIME, FAN_CURRENT,
        H2O_PUMP_CURRENT, FUEL_PUMP_CURRENT, BRK_P_FRONT, BRK_P_REAR,
        LST_RESET, EBB_STATE
};

const unsigned char GEAR_LETTER_X = (int) ((SCREEN_WIDTH / 2) - (DynamisFont_Gears_WIDTH / 2));
const unsigned char GEAR_LETTER_Y = SCREEN_Y_MIDDLE - (int) (DynamisFont_Gears_HEIGHT / 2);

char dd_alertMessage[20];
unsigned int dd_alertTicks;

void dd_Dashboard_init(void);

void dd_Dashboard_fireTimedMessage(float time_seconds, char *text, unsigned char type);

void dd_Dashboard_fireMessage(char *text, unsigned char type);

void dd_Dashboard_clearAlerts(void);

char dd_Dashboard_isGearLetterChanged(void);

void dd_Dashboard_printGearLetter(void);

void dd_Dashboard_addIndicator(unsigned char id, char *description);

void dd_Dashboard_printIndicators(void);

unsigned char dd_Dashboard_getIndicatorIndex(unsigned char id);

unsigned char dd_Dashboard_getIndicatorIndexAtPosition(unsigned char position);

void dd_Dashboard_requestIndicatorPrintUpdate(unsigned char indicatorIndex);

void dd_Dashboard_requestIndicatorFullPrintUpdate(unsigned char indicatorIndex);

void dd_Dashboard_clearIndicatorPrintUpdateRequest(unsigned char indicatorIndex);

char dd_Dashboard_isPrintedIndicatorRequestingUpdate(unsigned char indicatorIndex);

char dd_Dashboard_isPrintedIndicatorRequestingFullUpdate(unsigned char indicatorIndex);

void dd_Dashboard_setAlertTimeout(float time);

void dd_Dashboard_startupLogo(void);

#include "dd_indicators.h"

#endif //DP8_DISPLAY_CONTROLLER_DD_DASHBOARD_H