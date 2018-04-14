//
// Created by Alessandro Dago on 27/06/17.
//

#define MAX_H2O_TEMP             200
#define MAX_OIL_PRESSURE         120
#define MIN_VBAT                 12

#define WARNINGS_TOTAL_COUNT 3

#define REPEAT_TIME              10     //in seconds

const unsigned char WARNINGS_LIMIT[] = {
        MAX_OIL_PRESSURE, MIN_VBAT, MAX_H2O_TEMP
};

unsigned int WARNINGS_FLAG[WARNINGS_TOTAL_COUNT];

const unsigned char WARNINGS_LIST[] = {
        OIL_PRESS, VBAT, TH2O
};

const unsigned char *LIMITS_DESCRIPTIONS[] = {
        "P.OIL", "V.BAT", "TH2O"
};

void dWarnings_init(void);

void dWarnings_check(void);

void dWarnings_flash(unsigned int ii);

void dWarnings_setParameter(unsigned int ii);

void dWarnings_unsetParameter(unsigned int ii);