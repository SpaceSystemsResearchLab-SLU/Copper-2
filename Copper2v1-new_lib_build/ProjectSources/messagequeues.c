#include "messagequeues.h"
#include "salvo.h"

// Will assume message is of length MAX_RADIO_PACKET_LENGTH
void write_msgqmessage_to_OStypeMsgP(MSGQMESSAGE* message_struct, char* message) {
    switch(message_struct->msgtype) {
        case Radio_Transmission:
            sprintf(message, "%s", "RT");
            memcpy(message + 2, message_struct->message, message_struct->message_len);
            sprintf(message, "%s", MESSAGE_SENTINEL);
            message_struct->message[2 + message_struct->message_len + strlen(MESSAGE_SENTINEL)] = message_struct->message_len;
            memcpy(message + 2 + message_struct->message_len + strlen(MESSAGE_SENTINEL), &message_struct->message_len, sizeof(message_struct->message_len));
    }
}

/*
void write_OStypeMsgP_to_msgqmessage(MSGQMESSAGE* message_struct, char* message) {
    //switch(message_struct)
}*/
