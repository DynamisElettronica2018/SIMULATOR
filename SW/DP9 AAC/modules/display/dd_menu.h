//
//  DP8 LCD Menu
//  Aaron Russo 04/03/2016
//

#ifndef DP8_DISPLAY_CONTROLLER_DD_MENU_H
#define DP8_DISPLAY_CONTROLLER_DD_MENU_H

#include "../dd_graphic_controller.h"

#define MAX_LINE_DESCRIPTION_LENGTH 16
#define MAX_LINE_VALUE_LENGTH 6
#define MENU_DESCRIPTION_VALUE_SPACING 1
#define MENU_FONT_WIDTH DynamisFont_Terminal_WIDTH
#define MENU_FONT_HEIGHT DynamisFont_Terminal_HEIGHT
#define MENU_FONT_SPACING 1

#define DESCRIPTION_SCROLLING_SPEED 3.5 //Char / Second
#define DESCRIPTION_SCROLLING_SPACING 4 //Chars

//Menu value types
#define STRING 0
#define INT 1
#define FLOAT 2
#define BOOL 3
#define NULL 4
char *STRING_TRUE = "Yes";
char *STRING_FALSE = "No";


const unsigned char MAX_MENU_HEIGHT = (unsigned char) (SCREEN_HEIGHT / MENU_FONT_HEIGHT);
const unsigned char MAX_MENU_WIDTH = (int) (SCREEN_WIDTH / (MENU_FONT_WIDTH + MENU_FONT_SPACING));

typedef struct MenuLine {
    unsigned char id, valueType, descriptionLength, valueWidth;
    char description[MAX_LINE_DESCRIPTION_LENGTH];
    char stringValue[MAX_LINE_VALUE_LENGTH];
    int intValue;
    float floatValue;
    char boolValue;
    char pendingPrintUpdate, isFirstValue;
    int descriptionScrollingOffset;
};

ydata struct MenuLine dd_menuLines[25];
unsigned char dd_Menu_LinesCount = 0;
//Line index
unsigned char dd_Menu_SelectedLine = 0, dd_Menu_FirstLineIndex = 0;
unsigned char dd_Menu_Height_param = MAX_MENU_HEIGHT;
unsigned char dd_Menu_Width = MAX_MENU_WIDTH;
unsigned char dd_Menu_X_OFFSET = 0;
unsigned char dd_Menu_Y_OFFSET = 0;
#define dd_Menu_Height (dd_Menu_Height_param + dd_Menu_Y_OFFSET)
int dd_Menu_DescriptionScrollingTicks = 0;

void dd_Menu_setY_OFFSET(unsigned char y);

void dd_Menu_setX_OFFSET(unsigned char x);

void dd_Menu_setHeight(unsigned char height);

void dd_Menu_setWidth(unsigned char width);

void dd_Menu_selectDown(void);

void dd_Menu_selectUp(void);

void dd_Menu_scrollDown(void);

void dd_Menu_scrollUp(void);

void dd_Menu_reset(void);

void dd_Menu_addLine(unsigned char id, char *description);

void dd_MenuLine_setStringValue(unsigned char id, char *value);

void dd_MenuLine_setIntValue(unsigned char id, int value);

void dd_MenuLine_setFloatValue(unsigned char id, float value);

void dd_MenuLine_setBoolValue(unsigned char id, char value);

void dd_MenuLine_switchBoolValue(unsigned char id);

unsigned char dd_Menu_getLineIndex(unsigned char id);

void dd_printMenu(void);

void dd_printMenuLine(unsigned char lineIndex);

void dd_Menu_makeLineText(char *lineText, unsigned char lineIndex);

void dd_MenuLine_makeTextValue(unsigned char lineIndex);

int dd_MenuLine_getScrollOffset(unsigned char lineIndex);

int dd_MenuLine_getScrollingOverflow(unsigned char lineIndex);

char dd_MenuLine_hasToScroll(unsigned char lineIndex);

char dd_MenuLine_isScrollingThisFrame(unsigned char lineIndex);

unsigned char dd_MenuLine_getDescriptionWidth(unsigned char lineIndex);

unsigned char dd_MenuLine_getValueWidth(unsigned char lineIndex);

void dd_Menu_clearLinePrintUpdateRequest(unsigned char lineIndex);

void dd_Menu_requestLinePrintUpdate(unsigned char lineIndex);

char dd_Menu_isPrintedLineRequestingUpdate(unsigned char lineIndex);

char dd_Menu_isLineSelected(unsigned char lineIndex);

char dd_Menu_isLineVisible(unsigned char lineIndex);

void dd_Menu_resetDescriptionScrolling(void);

#endif //DP8_DISPLAY_CONTROLLER_DD_MENU_H
