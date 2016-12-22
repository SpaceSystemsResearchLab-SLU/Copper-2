#define SIZEOF_RADIO_MSGQ                 16

#define MESSAGE_SENTINEL                "SENTINEL"
#define MAX_OSMESSAGEARRAY_LEN          (MAX_RADIO_PACKET_LENGTH + 10)

typedef enum {
    Radio_Transmission,
} MSGTYPE;

typedef struct _MSGQMESSAGE {
    MSGTYPE msgtype;
    char* message;
    int message_len;
} MSGQMESSAGE;

//extern void write_msgqmessage_to_OStypeMsgP(MSGQMESSAGE* message_struct, OStypeMsgP message);
