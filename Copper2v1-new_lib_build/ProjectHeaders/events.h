/*
 *  This file contains all of the defines for all Salvo "events"
 *  
 *  All of the following constitute one Salvo "event":
 *  - counting semaphore  (OSCreateSem())
 *  - binary semaphore    (OSCreateBinSem())
 *  - message             (OSCreateMsg())
 *  - message queue       (OSCreateMsgQ())
 * 
 *  For each instance of these OS services you wish to create, you must allocate an 
 *  "event control block" using the macro OSECBP(n) where n is any integer that
 *  has not already been supplied to an OSECBP macro.  For simplicity's sake
 *  we are including all our event macros here.
 */

#define BINSEM_RADIO_CLEAR          OSECBP(1)
//#define RADIO_MSGQ_P                OSECBP(2)

//#define RADIO_MSGQ_CBP_P            OSMQCBP(1)
