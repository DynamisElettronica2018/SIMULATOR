//
// Created by Alessandro Dago on 27/06/17.
//
#include <string.h>
#include "d_warnings.h"


void dWarnings_init(void){
     unsigned int ii, indicatorsIndex;
     for(ii = 0; ii < WARNINGS_TOTAL_COUNT; ii += 1){
          WARNINGS_FLAG[ii] = 0;
     }
}

void dWarinings_check(void){
     unsigned int ii, indicatorsIndex;
     for(ii = 0; ii < WARNINGS_TOTAL_COUNT; ii += 1){
          indicatorsIndex = dd_Dashboard_getIndicatorIndex(WARNINGS_LIST[ii]);
          if(dd_indicators[indicatorsIndex].valueType == INT){
               if(dd_indicators[indicatorsIndex].intValue > WARNINGS_LIMIT[ii]){
                    if(WARNINGS_FLAG[ii] == 0){
                         dWarnings_setParameter(ii);
                    }
                    else{
                         WARNINGS_FLAG[ii] += 1;
                    }
                    if(WARNINGS_FLAG[ii] >= REPEAT_TIME){
                         WARNINGS_FLAG[ii] = 0;
                    }
               }
               else if(dd_indicators[indicatorsIndex].intValue <= WARNINGS_LIMIT[ii]){
                    if(WARNINGS_FLAG[ii] >= 1){
                         dWarnings_unsetParameter(ii);
                    }
               }
          }
          else if(dd_indicators[indicatorsIndex].valueType == FLOAT){
               if(WARNINGS_LIST[ii] == VBAT){
                    if(dd_indicators[indicatorsIndex].floatValue < WARNINGS_LIMIT[ii]){
                         if(WARNINGS_FLAG[ii] == 0){
                              dWarnings_setParameter(ii);
                         }
                         else{
                              WARNINGS_FLAG[ii] += 1;
                         }
                         if(WARNINGS_FLAG[ii] >= REPEAT_TIME){
                              WARNINGS_FLAG[ii] = 0;
                         }
                    }
                    else if(dd_indicators[indicatorsIndex].floatValue >= WARNINGS_LIMIT[ii]){
                         if(WARNINGS_FLAG[ii] >= 1){
                              dWarnings_unsetParameter(ii);
                         }
                    }
               }
               else if(dd_indicators[indicatorsIndex].floatValue > WARNINGS_LIMIT[ii]){
                    if(WARNINGS_FLAG[ii] == 0){
                         dWarnings_setParameter(ii);
                    }
                    else{
                         WARNINGS_FLAG[ii] += 1;
                    }
                    if(WARNINGS_FLAG[ii] >= REPEAT_TIME){
                         WARNINGS_FLAG[ii] = 0;
                    }
               }
               else if(dd_indicators[indicatorsIndex].floatValue <= WARNINGS_LIMIT[ii]){
                    if(WARNINGS_FLAG[ii] >= 1){
                         dWarnings_unsetParameter(ii);
                    }
               }
          }
     }
}

void dWarnings_flash(unsigned int ii){
     Buzzer_bip();
     dd_Dashboard_fireTimedMessage(0.7, LIMITS_DESCRIPTIONS[ii], MESSAGE_TYPE_WARNING);
}

void dWarnings_setParameter(unsigned int ii){
     WARNINGS_FLAG[ii] = 1;
     dSignalLed_set(DSIGNAL_LED_RED);
     dWarnings_flash(ii);
}

void dWarnings_unsetParameter(unsigned int ii){
     int nn, or = 0;
     WARNINGS_FLAG[ii] = 0;
     for(nn = 0; nn < WARNINGS_TOTAL_COUNT; nn += 1){
          or += WARNINGS_FLAG[nn];
     }
     if(or == 0){
          dSignalLed_unset(DSIGNAL_LED_RED);
     }
}