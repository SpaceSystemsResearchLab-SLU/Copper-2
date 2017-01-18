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
#define RADIO_MSGQ_P                OSECBP(2)
#define BINSEM_PION                 OSECBP(3)
#define BINSEM_PIOFF                OSECBP(4)
#define BINSEM_BURNCIRCUIT          OSECBP(5)
#define BINSEM_TAKEPICPI            OSECBP(6)
#define BINSEM_TAKEPICQ             OSECBP(7)
#define BINSEM_QUARKON              OSECBP(8)
#define BINSEM_QUARKOFF             OSECBP(9)
#define BINSEM_GETBCN               OSECBP(10)
#define BINSEM_PI_ISON              OSECBP(11)

#define RADIO_MSGQ_CBP_P            OSMQCBP(1)
