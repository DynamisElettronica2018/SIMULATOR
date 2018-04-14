//
//  DP8 LCD Menu
//  Aaron Russo 04/03/2016
//

#include "dd_menu.h"
#include <string.h>

void dd_Menu_setY_OFFSET(unsigned char y) {
    dd_Menu_Y_OFFSET = y;
}

void dd_Menu_setX_OFFSET(unsigned char x) {
    dd_Menu_X_OFFSET = x;
}

void dd_Menu_setHeight(unsigned char height) {
    if (height > MAX_MENU_HEIGHT) {
        height = MAX_MENU_HEIGHT;
    }
    dd_Menu_Height_param = height;
}

void dd_Menu_setWidth(unsigned char width) {
    if (width > MAX_MENU_WIDTH) {
        width = MAX_MENU_WIDTH;
    }
    dd_Menu_Width = width;
}

void dd_Menu_reset(void) {
    dd_Menu_SelectedLine = 0;
    dd_Menu_LinesCount = 0;
    dd_Menu_FirstLineIndex = 0;
}

void dd_Menu_addLine(unsigned char id, char *description) {
    dd_menuLines[dd_Menu_LinesCount].id = id;
    strcpy(dd_menuLines[dd_Menu_LinesCount].description, description);
    dd_menuLines[dd_Menu_LinesCount].descriptionLength = (unsigned char) strlen(description);
    dd_menuLines[dd_Menu_LinesCount].valueType = NULL;
    dd_menuLines[dd_Menu_LinesCount].pendingPrintUpdate = TRUE;
    dd_menuLines[dd_Menu_LinesCount].descriptionScrollingOffset = 0;
    dd_menuLines[dd_Menu_LinesCount].valueWidth = 0;
    dd_menuLines[dd_Menu_LinesCount].isFirstValue = TRUE;
    dd_Menu_LinesCount += 1;
}

void dd_Menu_selectDown(void) {
    if (dd_Menu_SelectedLine < dd_Menu_LinesCount - 1) {
        dd_Menu_requestLinePrintUpdate(dd_Menu_SelectedLine);
        dd_Menu_SelectedLine += 1;
        dd_Menu_requestLinePrintUpdate(dd_Menu_SelectedLine);
        dd_Menu_resetDescriptionScrolling();
    }
    if (dd_Menu_SelectedLine == dd_Menu_FirstLineIndex + dd_Menu_Height - dd_Menu_Y_OFFSET) {
        dd_Menu_scrollDown();
    }
}

void dd_Menu_selectUp(void) {
    if (dd_Menu_SelectedLine > 0) {
        dd_Menu_requestLinePrintUpdate(dd_Menu_SelectedLine);
        dd_Menu_SelectedLine -= 1;
        dd_Menu_requestLinePrintUpdate(dd_Menu_SelectedLine);
        dd_Menu_resetDescriptionScrolling();
    }
    if (dd_Menu_SelectedLine < dd_Menu_FirstLineIndex) {
        dd_Menu_scrollUp();
    }
}

void dd_Menu_scrollDown(void) {
    unsigned char i;
    if (dd_Menu_FirstLineIndex + dd_Menu_Height - dd_Menu_Y_OFFSET < dd_Menu_LinesCount) {
        dd_Menu_FirstLineIndex += 1;
        for (i = dd_Menu_FirstLineIndex; i < dd_Menu_FirstLineIndex + dd_Menu_Height; i += 1) {
            dd_Menu_requestLinePrintUpdate(i);
        }
    }
}

void dd_Menu_scrollUp(void) {
    unsigned char i;
    if (dd_Menu_FirstLineIndex > 0) {
        dd_Menu_FirstLineIndex -= 1;
        for (i = dd_Menu_FirstLineIndex; i < dd_Menu_FirstLineIndex + dd_Menu_Height; i += 1) {
            dd_Menu_requestLinePrintUpdate(i);
        }
    }
}

void dd_MenuLine_setStringValue(unsigned char id, char *value) {
    unsigned char lineIndex = dd_Menu_getLineIndex(id);
    strcpy(dd_menuLines[lineIndex].stringValue, value);
    dd_Menu_requestLinePrintUpdate(lineIndex);
    dd_menuLines[lineIndex].valueType = STRING;
    dd_menuLines[lineIndex].isFirstValue = FALSE;
}

void dd_MenuLine_setIntValue(unsigned char id, int value) {
    unsigned char lineIndex = dd_Menu_getLineIndex(id);
    if (dd_menuLines[lineIndex].intValue != value
        || dd_menuLines[lineIndex].isFirstValue
        || dd_menuLines[lineIndex].valueType != INT) {
        dd_menuLines[lineIndex].intValue = value;
        dd_menuLines[lineIndex].valueType = INT;
        dd_menuLines[lineIndex].isFirstValue = FALSE;
        dd_Menu_requestLinePrintUpdate(lineIndex);
    }
}

void dd_MenuLine_setFloatValue(unsigned char id, float value) {
    unsigned char lineIndex = dd_Menu_getLineIndex(id);
    if (dd_menuLines[lineIndex].floatValue != value
        || dd_menuLines[lineIndex].isFirstValue
        || dd_menuLines[lineIndex].valueType != FLOAT) {
        dd_menuLines[lineIndex].floatValue = value;
        dd_menuLines[lineIndex].valueType = FLOAT;
        dd_menuLines[lineIndex].isFirstValue = FALSE;
        dd_Menu_requestLinePrintUpdate(lineIndex);
    }
}

void dd_MenuLine_setBoolValue(unsigned char id, char value) {
    unsigned char lineIndex = dd_Menu_getLineIndex(id);
    if (dd_menuLines[lineIndex].boolValue != value
        || dd_menuLines[lineIndex].isFirstValue
        || dd_menuLines[lineIndex].valueType != BOOL) {
        dd_menuLines[lineIndex].boolValue = value;
        dd_menuLines[lineIndex].valueType = BOOL;
        dd_menuLines[lineIndex].isFirstValue = FALSE;
        dd_Menu_requestLinePrintUpdate(lineIndex);
    }
}

void dd_MenuLine_switchBoolValue(unsigned char id) {
    unsigned char lineIndex = dd_Menu_getLineIndex(id);
    dd_menuLines[lineIndex].boolValue = !dd_menuLines[lineIndex].boolValue;
    dd_menuLines[lineIndex].valueType = BOOL;
    dd_menuLines[lineIndex].isFirstValue = FALSE;
    dd_Menu_requestLinePrintUpdate(lineIndex);
}

unsigned char dd_Menu_getLineIndex(unsigned char id) {
    unsigned char i;
    for (i = 0; i < sizeof(dd_menuLines); i += 1) {
        if (dd_menuLines[i].id == id) {
            return i;
        }
    }
    return i; //If id doesn't exist what should we do?
}

void dd_printMenu(void) {
    unsigned char i;
    dd_Menu_DescriptionScrollingTicks += 1;
    for (i = 0; i < dd_Menu_LinesCount; i += 1) {
        if (dd_Menu_isPrintedLineRequestingUpdate(i) || dd_GraphicController_isFrameUpdateForced()) {
            dd_printMenuLine(i);
        }
    }
}

void dd_printMenuLine(unsigned char lineIndex) {
    unsigned char lineNumber, color;
    char lineText[MAX_MENU_WIDTH + 1]; //Adding 1 in so we can clean our border char
    if (dd_Menu_isLineVisible(lineIndex)) {
        lineNumber = lineIndex - dd_Menu_FirstLineIndex + dd_Menu_Y_OFFSET;
        if (dd_Menu_isLineSelected(lineIndex)) {
            color = WHITE;
        } else {
            color = BLACK;
        }
        dd_Menu_makeLineText(lineText, lineIndex);
        eGlcd(Glcd_Set_Font(DD_Terminal_Font);
                      Glcd_Write_Text(lineText, 0, lineNumber, color););
        dd_Menu_clearLinePrintUpdateRequest(lineIndex);
    }
}

void dd_Menu_makeLineText(char *lineText, unsigned char lineIndex) {
    int lineCharIndex, i, scrollingOffset, scrollingOverflow;
    unsigned char descriptionLength, valueWidth;
    dd_MenuLine_makeTextValue(lineIndex);
    valueWidth = dd_MenuLine_getValueWidth(lineIndex);
    scrollingOverflow = dd_MenuLine_getScrollingOverflow(lineIndex);
    scrollingOffset = dd_MenuLine_getScrollOffset(lineIndex);
    descriptionLength = dd_menuLines[lineIndex].descriptionLength;
    for (lineCharIndex = 0; lineCharIndex < dd_MenuLine_getDescriptionWidth(lineIndex); lineCharIndex += 1) {
        i = lineCharIndex + scrollingOffset;
        if (i < descriptionLength) {
            lineText[lineCharIndex] = dd_menuLines[lineIndex].description[i];
        } else if (i < scrollingOverflow || !dd_MenuLine_hasToScroll(lineIndex)) {
            lineText[lineCharIndex] = ' ';
        } else {
            lineText[lineCharIndex] = dd_menuLines[lineIndex].description[i - scrollingOverflow];
        }
    }
    if (valueWidth > 0) {
        for (i = 0; i < MENU_DESCRIPTION_VALUE_SPACING; i += 1) {
            lineText[lineCharIndex] = ' ';
            lineCharIndex += 1;
        }
        for (i = 0; i < valueWidth; i += 1) {
            lineText[lineCharIndex] = dd_menuLines[lineIndex].stringValue[i];
            lineCharIndex += 1;
        }
    }
    lineText[lineCharIndex] = ' ';
    dd_menuLines[lineIndex].descriptionScrollingOffset = scrollingOffset;
}

void dd_MenuLine_makeTextValue(unsigned char lineIndex) {
    unsigned char valueType = dd_menuLines[lineIndex].valueType;
    if (valueType != STRING) {
        emptyString(dd_menuLines[lineIndex].stringValue);
        switch (valueType) {
            case INT:
                sprintf(dd_menuLines[lineIndex].stringValue, "%i", dd_menuLines[lineIndex].intValue);
                break;
            case FLOAT:
                sprintf(dd_menuLines[lineIndex].stringValue, "%.2f", dd_menuLines[lineIndex].floatValue);
                break;
            case BOOL:
                if (dd_menuLines[lineIndex].boolValue) {
                    strcpy(dd_menuLines[lineIndex].stringValue, STRING_TRUE);
                } else {
                    strcpy(dd_menuLines[lineIndex].stringValue, STRING_FALSE);
                }
                break;
            case NULL:
            default:
                break;
        }
    }
    dd_menuLines[lineIndex].valueWidth = (unsigned char) strlen(dd_menuLines[lineIndex].stringValue);
}

int dd_MenuLine_getScrollOffset(unsigned char lineIndex) {
    int offset;
    if (dd_MenuLine_hasToScroll(lineIndex)) {
        offset = (int) (FRAME_PERIOD * dd_Menu_DescriptionScrollingTicks * DESCRIPTION_SCROLLING_SPEED);
        if (offset >= dd_MenuLine_getScrollingOverflow(lineIndex)) {
            offset = 0;
            dd_Menu_resetDescriptionScrolling();
        }
        return offset;
    } else {
        return 0;
    }
}

int dd_MenuLine_getScrollingOverflow(unsigned char lineIndex) {
    return dd_menuLines[lineIndex].descriptionLength + DESCRIPTION_SCROLLING_SPACING;
}

char dd_MenuLine_hasToScroll(unsigned char lineIndex) {
    return dd_Menu_isLineSelected(lineIndex) &&
           dd_menuLines[lineIndex].descriptionLength > dd_MenuLine_getDescriptionWidth(lineIndex);
}

char dd_MenuLine_isScrollingThisFrame(unsigned char lineIndex) {
    return dd_MenuLine_hasToScroll(lineIndex) &&
           (dd_menuLines[lineIndex].descriptionScrollingOffset != dd_MenuLine_getScrollOffset(lineIndex));
}

unsigned char dd_MenuLine_getDescriptionWidth(unsigned char lineIndex) {
    unsigned char valueWidth;
    valueWidth = dd_MenuLine_getValueWidth(lineIndex);
    if (valueWidth > 0) {
        return (unsigned char) (dd_Menu_Width - valueWidth - MENU_DESCRIPTION_VALUE_SPACING);
    } else {
        return dd_Menu_Width;
    }
}

unsigned char dd_MenuLine_getValueWidth(unsigned char lineIndex) {
    return dd_menuLines[lineIndex].valueWidth;
}

void dd_Menu_clearLinePrintUpdateRequest(unsigned char lineIndex) {
    dd_menuLines[lineIndex].pendingPrintUpdate = FALSE;
}

void dd_Menu_requestLinePrintUpdate(unsigned char lineIndex) {
    dd_menuLines[lineIndex].pendingPrintUpdate = TRUE;
}

char dd_Menu_isPrintedLineRequestingUpdate(unsigned char lineIndex) {
    return dd_menuLines[lineIndex].pendingPrintUpdate || dd_MenuLine_isScrollingThisFrame(lineIndex);
}

char dd_Menu_isLineSelected(unsigned char lineIndex) {
    return dd_Menu_SelectedLine == lineIndex;
}

char dd_Menu_isLineVisible(unsigned char lineIndex) {
    return lineIndex >= dd_Menu_FirstLineIndex &&
           lineIndex < dd_Menu_FirstLineIndex + (dd_Menu_Height - dd_Menu_Y_OFFSET);
}

void dd_Menu_resetDescriptionScrolling(void) {
    dd_Menu_DescriptionScrollingTicks = 0;
}
