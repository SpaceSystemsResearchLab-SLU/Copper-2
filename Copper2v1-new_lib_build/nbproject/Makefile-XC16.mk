#
# Generated Makefile - do not edit!
#
# Edit the Makefile in the project folder instead (../Makefile). Each target
# has a -pre and a -post target defined where you can add customized code.
#
# This makefile implements configuration specific macros and targets.


# Include project Makefile
ifeq "${IGNORE_LOCAL}" "TRUE"
# do not include local makefile. User is passing all local related variables already
else
include Makefile
# Include makefile containing local settings
ifeq "$(wildcard nbproject/Makefile-local-XC16.mk)" "nbproject/Makefile-local-XC16.mk"
include nbproject/Makefile-local-XC16.mk
endif
endif

# Environment
MKDIR=gnumkdir -p
RM=rm -f 
MV=mv 
CP=cp 

# Macros
CND_CONF=XC16
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
IMAGE_TYPE=debug
OUTPUT_SUFFIX=cof
DEBUGGABLE_SUFFIX=cof
FINAL_IMAGE=dist/${CND_CONF}/${IMAGE_TYPE}/Copper2v1-new_lib_build.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
else
IMAGE_TYPE=production
OUTPUT_SUFFIX=hex
DEBUGGABLE_SUFFIX=cof
FINAL_IMAGE=dist/${CND_CONF}/${IMAGE_TYPE}/Copper2v1-new_lib_build.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
endif

# Object Directory
OBJECTDIR=build/${CND_CONF}/${IMAGE_TYPE}

# Distribution Directory
DISTDIR=dist/${CND_CONF}/${IMAGE_TYPE}

# Source Files Quoted if spaced
SOURCEFILES_QUOTED_IF_SPACED=../../../../Pumpkin/CubeSatKit/PIC24/src/csk_led.c ../../../../Pumpkin/CubeSatKit/PIC24/src/csk_mhx.c ../../../../Pumpkin/CubeSatKit/PIC24/src/csk_power.c ../../../../Pumpkin/CubeSatKit/PIC24/src/csk_rand.c ../../../../Pumpkin/CubeSatKit/PIC24/src/csk_sd.c ../../../../Pumpkin/CubeSatKit/PIC24/src/csk_usb.c ../../../../Pumpkin/CubeSatKit/PIC24/src/csk_wdt.c ../../../../Pumpkin/CubeSatKit/PIC24/src/effs_thin_mmc_drv_spi1.c ../../../../Pumpkin/CubeSatKit/PIC24/src/csk_io.c ../../../../Pumpkin/Library/PIC24/Src/pic24_uart1.c ../../../../Pumpkin/Library/PIC24/Src/pic24_uart1_msg.c ../../../../Pumpkin/Library/PIC24/Src/pic24_uart1_msg_ts.c ../../../../Pumpkin/Library/PIC24/Src/pic24_uart2.c ../../../../Pumpkin/Library/PIC24/Src/pic24_uart2_msg.c ../../../../Pumpkin/Library/PIC24/Src/pic24_uart2_msg_ts.c ../../../../Pumpkin/Library/PIC24/Src/pic24_uart3.c ../../../../Pumpkin/Library/PIC24/Src/pic24_uart3_msg.c ../../../../Pumpkin/Library/PIC24/Src/pic24_uart3_msg_ts.c ../../../../Pumpkin/Library/PIC24/Src/pic24_uart4.c ../../../../Pumpkin/Library/PIC24/Src/pic24_uart4_msg.c ../../../../Pumpkin/Library/PIC24/Src/pic24_uart4_msg_ts.c ProjectSources/main.c ProjectSources/debug_functions.c ProjectSources/messagequeues.c ProjectSources/task_beacon.c ProjectSources/task_radio_listen.c ProjectSources/task_scheduler.c ProjectSources/task_test.c ProjectSources/init.c ProjectSources/task_radio_talk.c ../../../../Pumpkin/Salvo/Src/MCC30/salvoportmcc30-lm.s ../../../../Pumpkin/Salvo/Src/salvomem.c

# Object Files Quoted if spaced
OBJECTFILES_QUOTED_IF_SPACED=${OBJECTDIR}/_ext/1443471778/csk_led.o ${OBJECTDIR}/_ext/1443471778/csk_mhx.o ${OBJECTDIR}/_ext/1443471778/csk_power.o ${OBJECTDIR}/_ext/1443471778/csk_rand.o ${OBJECTDIR}/_ext/1443471778/csk_sd.o ${OBJECTDIR}/_ext/1443471778/csk_usb.o ${OBJECTDIR}/_ext/1443471778/csk_wdt.o ${OBJECTDIR}/_ext/1443471778/effs_thin_mmc_drv_spi1.o ${OBJECTDIR}/_ext/1443471778/csk_io.o ${OBJECTDIR}/_ext/1939458138/pic24_uart1.o ${OBJECTDIR}/_ext/1939458138/pic24_uart1_msg.o ${OBJECTDIR}/_ext/1939458138/pic24_uart1_msg_ts.o ${OBJECTDIR}/_ext/1939458138/pic24_uart2.o ${OBJECTDIR}/_ext/1939458138/pic24_uart2_msg.o ${OBJECTDIR}/_ext/1939458138/pic24_uart2_msg_ts.o ${OBJECTDIR}/_ext/1939458138/pic24_uart3.o ${OBJECTDIR}/_ext/1939458138/pic24_uart3_msg.o ${OBJECTDIR}/_ext/1939458138/pic24_uart3_msg_ts.o ${OBJECTDIR}/_ext/1939458138/pic24_uart4.o ${OBJECTDIR}/_ext/1939458138/pic24_uart4_msg.o ${OBJECTDIR}/_ext/1939458138/pic24_uart4_msg_ts.o ${OBJECTDIR}/ProjectSources/main.o ${OBJECTDIR}/ProjectSources/debug_functions.o ${OBJECTDIR}/ProjectSources/messagequeues.o ${OBJECTDIR}/ProjectSources/task_beacon.o ${OBJECTDIR}/ProjectSources/task_radio_listen.o ${OBJECTDIR}/ProjectSources/task_scheduler.o ${OBJECTDIR}/ProjectSources/task_test.o ${OBJECTDIR}/ProjectSources/init.o ${OBJECTDIR}/ProjectSources/task_radio_talk.o ${OBJECTDIR}/_ext/307288224/salvoportmcc30-lm.o ${OBJECTDIR}/_ext/1458030235/salvomem.o
POSSIBLE_DEPFILES=${OBJECTDIR}/_ext/1443471778/csk_led.o.d ${OBJECTDIR}/_ext/1443471778/csk_mhx.o.d ${OBJECTDIR}/_ext/1443471778/csk_power.o.d ${OBJECTDIR}/_ext/1443471778/csk_rand.o.d ${OBJECTDIR}/_ext/1443471778/csk_sd.o.d ${OBJECTDIR}/_ext/1443471778/csk_usb.o.d ${OBJECTDIR}/_ext/1443471778/csk_wdt.o.d ${OBJECTDIR}/_ext/1443471778/effs_thin_mmc_drv_spi1.o.d ${OBJECTDIR}/_ext/1443471778/csk_io.o.d ${OBJECTDIR}/_ext/1939458138/pic24_uart1.o.d ${OBJECTDIR}/_ext/1939458138/pic24_uart1_msg.o.d ${OBJECTDIR}/_ext/1939458138/pic24_uart1_msg_ts.o.d ${OBJECTDIR}/_ext/1939458138/pic24_uart2.o.d ${OBJECTDIR}/_ext/1939458138/pic24_uart2_msg.o.d ${OBJECTDIR}/_ext/1939458138/pic24_uart2_msg_ts.o.d ${OBJECTDIR}/_ext/1939458138/pic24_uart3.o.d ${OBJECTDIR}/_ext/1939458138/pic24_uart3_msg.o.d ${OBJECTDIR}/_ext/1939458138/pic24_uart3_msg_ts.o.d ${OBJECTDIR}/_ext/1939458138/pic24_uart4.o.d ${OBJECTDIR}/_ext/1939458138/pic24_uart4_msg.o.d ${OBJECTDIR}/_ext/1939458138/pic24_uart4_msg_ts.o.d ${OBJECTDIR}/ProjectSources/main.o.d ${OBJECTDIR}/ProjectSources/debug_functions.o.d ${OBJECTDIR}/ProjectSources/messagequeues.o.d ${OBJECTDIR}/ProjectSources/task_beacon.o.d ${OBJECTDIR}/ProjectSources/task_radio_listen.o.d ${OBJECTDIR}/ProjectSources/task_scheduler.o.d ${OBJECTDIR}/ProjectSources/task_test.o.d ${OBJECTDIR}/ProjectSources/init.o.d ${OBJECTDIR}/ProjectSources/task_radio_talk.o.d ${OBJECTDIR}/_ext/307288224/salvoportmcc30-lm.o.d ${OBJECTDIR}/_ext/1458030235/salvomem.o.d

# Object Files
OBJECTFILES=${OBJECTDIR}/_ext/1443471778/csk_led.o ${OBJECTDIR}/_ext/1443471778/csk_mhx.o ${OBJECTDIR}/_ext/1443471778/csk_power.o ${OBJECTDIR}/_ext/1443471778/csk_rand.o ${OBJECTDIR}/_ext/1443471778/csk_sd.o ${OBJECTDIR}/_ext/1443471778/csk_usb.o ${OBJECTDIR}/_ext/1443471778/csk_wdt.o ${OBJECTDIR}/_ext/1443471778/effs_thin_mmc_drv_spi1.o ${OBJECTDIR}/_ext/1443471778/csk_io.o ${OBJECTDIR}/_ext/1939458138/pic24_uart1.o ${OBJECTDIR}/_ext/1939458138/pic24_uart1_msg.o ${OBJECTDIR}/_ext/1939458138/pic24_uart1_msg_ts.o ${OBJECTDIR}/_ext/1939458138/pic24_uart2.o ${OBJECTDIR}/_ext/1939458138/pic24_uart2_msg.o ${OBJECTDIR}/_ext/1939458138/pic24_uart2_msg_ts.o ${OBJECTDIR}/_ext/1939458138/pic24_uart3.o ${OBJECTDIR}/_ext/1939458138/pic24_uart3_msg.o ${OBJECTDIR}/_ext/1939458138/pic24_uart3_msg_ts.o ${OBJECTDIR}/_ext/1939458138/pic24_uart4.o ${OBJECTDIR}/_ext/1939458138/pic24_uart4_msg.o ${OBJECTDIR}/_ext/1939458138/pic24_uart4_msg_ts.o ${OBJECTDIR}/ProjectSources/main.o ${OBJECTDIR}/ProjectSources/debug_functions.o ${OBJECTDIR}/ProjectSources/messagequeues.o ${OBJECTDIR}/ProjectSources/task_beacon.o ${OBJECTDIR}/ProjectSources/task_radio_listen.o ${OBJECTDIR}/ProjectSources/task_scheduler.o ${OBJECTDIR}/ProjectSources/task_test.o ${OBJECTDIR}/ProjectSources/init.o ${OBJECTDIR}/ProjectSources/task_radio_talk.o ${OBJECTDIR}/_ext/307288224/salvoportmcc30-lm.o ${OBJECTDIR}/_ext/1458030235/salvomem.o

# Source Files
SOURCEFILES=../../../../Pumpkin/CubeSatKit/PIC24/src/csk_led.c ../../../../Pumpkin/CubeSatKit/PIC24/src/csk_mhx.c ../../../../Pumpkin/CubeSatKit/PIC24/src/csk_power.c ../../../../Pumpkin/CubeSatKit/PIC24/src/csk_rand.c ../../../../Pumpkin/CubeSatKit/PIC24/src/csk_sd.c ../../../../Pumpkin/CubeSatKit/PIC24/src/csk_usb.c ../../../../Pumpkin/CubeSatKit/PIC24/src/csk_wdt.c ../../../../Pumpkin/CubeSatKit/PIC24/src/effs_thin_mmc_drv_spi1.c ../../../../Pumpkin/CubeSatKit/PIC24/src/csk_io.c ../../../../Pumpkin/Library/PIC24/Src/pic24_uart1.c ../../../../Pumpkin/Library/PIC24/Src/pic24_uart1_msg.c ../../../../Pumpkin/Library/PIC24/Src/pic24_uart1_msg_ts.c ../../../../Pumpkin/Library/PIC24/Src/pic24_uart2.c ../../../../Pumpkin/Library/PIC24/Src/pic24_uart2_msg.c ../../../../Pumpkin/Library/PIC24/Src/pic24_uart2_msg_ts.c ../../../../Pumpkin/Library/PIC24/Src/pic24_uart3.c ../../../../Pumpkin/Library/PIC24/Src/pic24_uart3_msg.c ../../../../Pumpkin/Library/PIC24/Src/pic24_uart3_msg_ts.c ../../../../Pumpkin/Library/PIC24/Src/pic24_uart4.c ../../../../Pumpkin/Library/PIC24/Src/pic24_uart4_msg.c ../../../../Pumpkin/Library/PIC24/Src/pic24_uart4_msg_ts.c ProjectSources/main.c ProjectSources/debug_functions.c ProjectSources/messagequeues.c ProjectSources/task_beacon.c ProjectSources/task_radio_listen.c ProjectSources/task_scheduler.c ProjectSources/task_test.c ProjectSources/init.c ProjectSources/task_radio_talk.c ../../../../Pumpkin/Salvo/Src/MCC30/salvoportmcc30-lm.s ../../../../Pumpkin/Salvo/Src/salvomem.c


CFLAGS=
ASFLAGS=
LDLIBSOPTIONS=

############# Tool locations ##########################################
# If you copy a project from one host to another, the path where the  #
# compiler is installed may be different.                             #
# If you open this project with MPLAB X in the new host, this         #
# makefile will be regenerated and the paths will be corrected.       #
#######################################################################
# fixDeps replaces a bunch of sed/cat/printf statements that slow down the build
FIXDEPS=fixDeps

.build-conf:  ${BUILD_SUBPROJECTS}
ifneq ($(INFORMATION_MESSAGE), )
	@echo $(INFORMATION_MESSAGE)
endif
	${MAKE}  -f nbproject/Makefile-XC16.mk dist/${CND_CONF}/${IMAGE_TYPE}/Copper2v1-new_lib_build.${IMAGE_TYPE}.${OUTPUT_SUFFIX}

MP_PROCESSOR_OPTION=24FJ256GA110
MP_LINKER_FILE_OPTION=,--script="..\..\..\..\Program Files (x86)\Microchip\xc16\v1.26\support\PIC24F\gld\p24FJ256GA110.gld"
# ------------------------------------------------------------------------------------
# Rules for buildStep: compile
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
${OBJECTDIR}/_ext/1443471778/csk_led.o: ../../../../Pumpkin/CubeSatKit/PIC24/src/csk_led.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1443471778" 
	@${RM} ${OBJECTDIR}/_ext/1443471778/csk_led.o.d 
	@${RM} ${OBJECTDIR}/_ext/1443471778/csk_led.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../../../Pumpkin/CubeSatKit/PIC24/src/csk_led.c  -o ${OBJECTDIR}/_ext/1443471778/csk_led.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/1443471778/csk_led.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1    -omf=coff -I"ProjectHeaders" -I"../../../../Pumpkin/CubeSatKit/PIC24/inc" -I"../../../../Pumpkin/Library/PIC24/Inc" -I"../../../../Pumpkin/Salvo/Inc" -I"../../../../Pumpkin/Salvo/Inc/MCC30" -mlarge-code -mlarge-data -mlarge-scalar -O0 -I"ProjectHeaders" -I"../../../../Pumpkin/CubeSatKit/PIC24/inc" -I"../../../../Pumpkin/Library/PIC24/Inc" -I"../../../../Pumpkin/Salvo/Inc/MCC30" -I"../../../../Pumpkin/Salvo/Inc" -DOSMCC30_LARGE_CM=1 -msmart-io=1 -Wall -msfr-warn=off -finline -Winline
	@${FIXDEPS} "${OBJECTDIR}/_ext/1443471778/csk_led.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/1443471778/csk_mhx.o: ../../../../Pumpkin/CubeSatKit/PIC24/src/csk_mhx.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1443471778" 
	@${RM} ${OBJECTDIR}/_ext/1443471778/csk_mhx.o.d 
	@${RM} ${OBJECTDIR}/_ext/1443471778/csk_mhx.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../../../Pumpkin/CubeSatKit/PIC24/src/csk_mhx.c  -o ${OBJECTDIR}/_ext/1443471778/csk_mhx.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/1443471778/csk_mhx.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1    -omf=coff -I"ProjectHeaders" -I"../../../../Pumpkin/CubeSatKit/PIC24/inc" -I"../../../../Pumpkin/Library/PIC24/Inc" -I"../../../../Pumpkin/Salvo/Inc" -I"../../../../Pumpkin/Salvo/Inc/MCC30" -mlarge-code -mlarge-data -mlarge-scalar -O0 -I"ProjectHeaders" -I"../../../../Pumpkin/CubeSatKit/PIC24/inc" -I"../../../../Pumpkin/Library/PIC24/Inc" -I"../../../../Pumpkin/Salvo/Inc/MCC30" -I"../../../../Pumpkin/Salvo/Inc" -DOSMCC30_LARGE_CM=1 -msmart-io=1 -Wall -msfr-warn=off -finline -Winline
	@${FIXDEPS} "${OBJECTDIR}/_ext/1443471778/csk_mhx.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/1443471778/csk_power.o: ../../../../Pumpkin/CubeSatKit/PIC24/src/csk_power.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1443471778" 
	@${RM} ${OBJECTDIR}/_ext/1443471778/csk_power.o.d 
	@${RM} ${OBJECTDIR}/_ext/1443471778/csk_power.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../../../Pumpkin/CubeSatKit/PIC24/src/csk_power.c  -o ${OBJECTDIR}/_ext/1443471778/csk_power.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/1443471778/csk_power.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1    -omf=coff -I"ProjectHeaders" -I"../../../../Pumpkin/CubeSatKit/PIC24/inc" -I"../../../../Pumpkin/Library/PIC24/Inc" -I"../../../../Pumpkin/Salvo/Inc" -I"../../../../Pumpkin/Salvo/Inc/MCC30" -mlarge-code -mlarge-data -mlarge-scalar -O0 -I"ProjectHeaders" -I"../../../../Pumpkin/CubeSatKit/PIC24/inc" -I"../../../../Pumpkin/Library/PIC24/Inc" -I"../../../../Pumpkin/Salvo/Inc/MCC30" -I"../../../../Pumpkin/Salvo/Inc" -DOSMCC30_LARGE_CM=1 -msmart-io=1 -Wall -msfr-warn=off -finline -Winline
	@${FIXDEPS} "${OBJECTDIR}/_ext/1443471778/csk_power.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/1443471778/csk_rand.o: ../../../../Pumpkin/CubeSatKit/PIC24/src/csk_rand.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1443471778" 
	@${RM} ${OBJECTDIR}/_ext/1443471778/csk_rand.o.d 
	@${RM} ${OBJECTDIR}/_ext/1443471778/csk_rand.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../../../Pumpkin/CubeSatKit/PIC24/src/csk_rand.c  -o ${OBJECTDIR}/_ext/1443471778/csk_rand.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/1443471778/csk_rand.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1    -omf=coff -I"ProjectHeaders" -I"../../../../Pumpkin/CubeSatKit/PIC24/inc" -I"../../../../Pumpkin/Library/PIC24/Inc" -I"../../../../Pumpkin/Salvo/Inc" -I"../../../../Pumpkin/Salvo/Inc/MCC30" -mlarge-code -mlarge-data -mlarge-scalar -O0 -I"ProjectHeaders" -I"../../../../Pumpkin/CubeSatKit/PIC24/inc" -I"../../../../Pumpkin/Library/PIC24/Inc" -I"../../../../Pumpkin/Salvo/Inc/MCC30" -I"../../../../Pumpkin/Salvo/Inc" -DOSMCC30_LARGE_CM=1 -msmart-io=1 -Wall -msfr-warn=off -finline -Winline
	@${FIXDEPS} "${OBJECTDIR}/_ext/1443471778/csk_rand.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/1443471778/csk_sd.o: ../../../../Pumpkin/CubeSatKit/PIC24/src/csk_sd.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1443471778" 
	@${RM} ${OBJECTDIR}/_ext/1443471778/csk_sd.o.d 
	@${RM} ${OBJECTDIR}/_ext/1443471778/csk_sd.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../../../Pumpkin/CubeSatKit/PIC24/src/csk_sd.c  -o ${OBJECTDIR}/_ext/1443471778/csk_sd.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/1443471778/csk_sd.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1    -omf=coff -I"ProjectHeaders" -I"../../../../Pumpkin/CubeSatKit/PIC24/inc" -I"../../../../Pumpkin/Library/PIC24/Inc" -I"../../../../Pumpkin/Salvo/Inc" -I"../../../../Pumpkin/Salvo/Inc/MCC30" -mlarge-code -mlarge-data -mlarge-scalar -O0 -I"ProjectHeaders" -I"../../../../Pumpkin/CubeSatKit/PIC24/inc" -I"../../../../Pumpkin/Library/PIC24/Inc" -I"../../../../Pumpkin/Salvo/Inc/MCC30" -I"../../../../Pumpkin/Salvo/Inc" -DOSMCC30_LARGE_CM=1 -msmart-io=1 -Wall -msfr-warn=off -finline -Winline
	@${FIXDEPS} "${OBJECTDIR}/_ext/1443471778/csk_sd.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/1443471778/csk_usb.o: ../../../../Pumpkin/CubeSatKit/PIC24/src/csk_usb.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1443471778" 
	@${RM} ${OBJECTDIR}/_ext/1443471778/csk_usb.o.d 
	@${RM} ${OBJECTDIR}/_ext/1443471778/csk_usb.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../../../Pumpkin/CubeSatKit/PIC24/src/csk_usb.c  -o ${OBJECTDIR}/_ext/1443471778/csk_usb.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/1443471778/csk_usb.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1    -omf=coff -I"ProjectHeaders" -I"../../../../Pumpkin/CubeSatKit/PIC24/inc" -I"../../../../Pumpkin/Library/PIC24/Inc" -I"../../../../Pumpkin/Salvo/Inc" -I"../../../../Pumpkin/Salvo/Inc/MCC30" -mlarge-code -mlarge-data -mlarge-scalar -O0 -I"ProjectHeaders" -I"../../../../Pumpkin/CubeSatKit/PIC24/inc" -I"../../../../Pumpkin/Library/PIC24/Inc" -I"../../../../Pumpkin/Salvo/Inc/MCC30" -I"../../../../Pumpkin/Salvo/Inc" -DOSMCC30_LARGE_CM=1 -msmart-io=1 -Wall -msfr-warn=off -finline -Winline
	@${FIXDEPS} "${OBJECTDIR}/_ext/1443471778/csk_usb.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/1443471778/csk_wdt.o: ../../../../Pumpkin/CubeSatKit/PIC24/src/csk_wdt.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1443471778" 
	@${RM} ${OBJECTDIR}/_ext/1443471778/csk_wdt.o.d 
	@${RM} ${OBJECTDIR}/_ext/1443471778/csk_wdt.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../../../Pumpkin/CubeSatKit/PIC24/src/csk_wdt.c  -o ${OBJECTDIR}/_ext/1443471778/csk_wdt.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/1443471778/csk_wdt.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1    -omf=coff -I"ProjectHeaders" -I"../../../../Pumpkin/CubeSatKit/PIC24/inc" -I"../../../../Pumpkin/Library/PIC24/Inc" -I"../../../../Pumpkin/Salvo/Inc" -I"../../../../Pumpkin/Salvo/Inc/MCC30" -mlarge-code -mlarge-data -mlarge-scalar -O0 -I"ProjectHeaders" -I"../../../../Pumpkin/CubeSatKit/PIC24/inc" -I"../../../../Pumpkin/Library/PIC24/Inc" -I"../../../../Pumpkin/Salvo/Inc/MCC30" -I"../../../../Pumpkin/Salvo/Inc" -DOSMCC30_LARGE_CM=1 -msmart-io=1 -Wall -msfr-warn=off -finline -Winline
	@${FIXDEPS} "${OBJECTDIR}/_ext/1443471778/csk_wdt.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/1443471778/effs_thin_mmc_drv_spi1.o: ../../../../Pumpkin/CubeSatKit/PIC24/src/effs_thin_mmc_drv_spi1.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1443471778" 
	@${RM} ${OBJECTDIR}/_ext/1443471778/effs_thin_mmc_drv_spi1.o.d 
	@${RM} ${OBJECTDIR}/_ext/1443471778/effs_thin_mmc_drv_spi1.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../../../Pumpkin/CubeSatKit/PIC24/src/effs_thin_mmc_drv_spi1.c  -o ${OBJECTDIR}/_ext/1443471778/effs_thin_mmc_drv_spi1.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/1443471778/effs_thin_mmc_drv_spi1.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1    -omf=coff -I"ProjectHeaders" -I"../../../../Pumpkin/CubeSatKit/PIC24/inc" -I"../../../../Pumpkin/Library/PIC24/Inc" -I"../../../../Pumpkin/Salvo/Inc" -I"../../../../Pumpkin/Salvo/Inc/MCC30" -mlarge-code -mlarge-data -mlarge-scalar -O0 -I"ProjectHeaders" -I"../../../../Pumpkin/CubeSatKit/PIC24/inc" -I"../../../../Pumpkin/Library/PIC24/Inc" -I"../../../../Pumpkin/Salvo/Inc/MCC30" -I"../../../../Pumpkin/Salvo/Inc" -DOSMCC30_LARGE_CM=1 -msmart-io=1 -Wall -msfr-warn=off -finline -Winline
	@${FIXDEPS} "${OBJECTDIR}/_ext/1443471778/effs_thin_mmc_drv_spi1.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/1443471778/csk_io.o: ../../../../Pumpkin/CubeSatKit/PIC24/src/csk_io.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1443471778" 
	@${RM} ${OBJECTDIR}/_ext/1443471778/csk_io.o.d 
	@${RM} ${OBJECTDIR}/_ext/1443471778/csk_io.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../../../Pumpkin/CubeSatKit/PIC24/src/csk_io.c  -o ${OBJECTDIR}/_ext/1443471778/csk_io.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/1443471778/csk_io.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1    -omf=coff -I"ProjectHeaders" -I"../../../../Pumpkin/CubeSatKit/PIC24/inc" -I"../../../../Pumpkin/Library/PIC24/Inc" -I"../../../../Pumpkin/Salvo/Inc" -I"../../../../Pumpkin/Salvo/Inc/MCC30" -mlarge-code -mlarge-data -mlarge-scalar -O0 -I"ProjectHeaders" -I"../../../../Pumpkin/CubeSatKit/PIC24/inc" -I"../../../../Pumpkin/Library/PIC24/Inc" -I"../../../../Pumpkin/Salvo/Inc/MCC30" -I"../../../../Pumpkin/Salvo/Inc" -DOSMCC30_LARGE_CM=1 -msmart-io=1 -Wall -msfr-warn=off -finline -Winline
	@${FIXDEPS} "${OBJECTDIR}/_ext/1443471778/csk_io.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/1939458138/pic24_uart1.o: ../../../../Pumpkin/Library/PIC24/Src/pic24_uart1.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1939458138" 
	@${RM} ${OBJECTDIR}/_ext/1939458138/pic24_uart1.o.d 
	@${RM} ${OBJECTDIR}/_ext/1939458138/pic24_uart1.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../../../Pumpkin/Library/PIC24/Src/pic24_uart1.c  -o ${OBJECTDIR}/_ext/1939458138/pic24_uart1.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/1939458138/pic24_uart1.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1    -omf=coff -I"ProjectHeaders" -I"../../../../Pumpkin/CubeSatKit/PIC24/inc" -I"../../../../Pumpkin/Library/PIC24/Inc" -I"../../../../Pumpkin/Salvo/Inc" -I"../../../../Pumpkin/Salvo/Inc/MCC30" -mlarge-code -mlarge-data -mlarge-scalar -O0 -I"ProjectHeaders" -I"../../../../Pumpkin/CubeSatKit/PIC24/inc" -I"../../../../Pumpkin/Library/PIC24/Inc" -I"../../../../Pumpkin/Salvo/Inc/MCC30" -I"../../../../Pumpkin/Salvo/Inc" -DOSMCC30_LARGE_CM=1 -msmart-io=1 -Wall -msfr-warn=off -finline -Winline
	@${FIXDEPS} "${OBJECTDIR}/_ext/1939458138/pic24_uart1.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/1939458138/pic24_uart1_msg.o: ../../../../Pumpkin/Library/PIC24/Src/pic24_uart1_msg.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1939458138" 
	@${RM} ${OBJECTDIR}/_ext/1939458138/pic24_uart1_msg.o.d 
	@${RM} ${OBJECTDIR}/_ext/1939458138/pic24_uart1_msg.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../../../Pumpkin/Library/PIC24/Src/pic24_uart1_msg.c  -o ${OBJECTDIR}/_ext/1939458138/pic24_uart1_msg.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/1939458138/pic24_uart1_msg.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1    -omf=coff -I"ProjectHeaders" -I"../../../../Pumpkin/CubeSatKit/PIC24/inc" -I"../../../../Pumpkin/Library/PIC24/Inc" -I"../../../../Pumpkin/Salvo/Inc" -I"../../../../Pumpkin/Salvo/Inc/MCC30" -mlarge-code -mlarge-data -mlarge-scalar -O0 -I"ProjectHeaders" -I"../../../../Pumpkin/CubeSatKit/PIC24/inc" -I"../../../../Pumpkin/Library/PIC24/Inc" -I"../../../../Pumpkin/Salvo/Inc/MCC30" -I"../../../../Pumpkin/Salvo/Inc" -DOSMCC30_LARGE_CM=1 -msmart-io=1 -Wall -msfr-warn=off -finline -Winline
	@${FIXDEPS} "${OBJECTDIR}/_ext/1939458138/pic24_uart1_msg.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/1939458138/pic24_uart1_msg_ts.o: ../../../../Pumpkin/Library/PIC24/Src/pic24_uart1_msg_ts.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1939458138" 
	@${RM} ${OBJECTDIR}/_ext/1939458138/pic24_uart1_msg_ts.o.d 
	@${RM} ${OBJECTDIR}/_ext/1939458138/pic24_uart1_msg_ts.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../../../Pumpkin/Library/PIC24/Src/pic24_uart1_msg_ts.c  -o ${OBJECTDIR}/_ext/1939458138/pic24_uart1_msg_ts.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/1939458138/pic24_uart1_msg_ts.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1    -omf=coff -I"ProjectHeaders" -I"../../../../Pumpkin/CubeSatKit/PIC24/inc" -I"../../../../Pumpkin/Library/PIC24/Inc" -I"../../../../Pumpkin/Salvo/Inc" -I"../../../../Pumpkin/Salvo/Inc/MCC30" -mlarge-code -mlarge-data -mlarge-scalar -O0 -I"ProjectHeaders" -I"../../../../Pumpkin/CubeSatKit/PIC24/inc" -I"../../../../Pumpkin/Library/PIC24/Inc" -I"../../../../Pumpkin/Salvo/Inc/MCC30" -I"../../../../Pumpkin/Salvo/Inc" -DOSMCC30_LARGE_CM=1 -msmart-io=1 -Wall -msfr-warn=off -finline -Winline
	@${FIXDEPS} "${OBJECTDIR}/_ext/1939458138/pic24_uart1_msg_ts.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/1939458138/pic24_uart2.o: ../../../../Pumpkin/Library/PIC24/Src/pic24_uart2.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1939458138" 
	@${RM} ${OBJECTDIR}/_ext/1939458138/pic24_uart2.o.d 
	@${RM} ${OBJECTDIR}/_ext/1939458138/pic24_uart2.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../../../Pumpkin/Library/PIC24/Src/pic24_uart2.c  -o ${OBJECTDIR}/_ext/1939458138/pic24_uart2.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/1939458138/pic24_uart2.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1    -omf=coff -I"ProjectHeaders" -I"../../../../Pumpkin/CubeSatKit/PIC24/inc" -I"../../../../Pumpkin/Library/PIC24/Inc" -I"../../../../Pumpkin/Salvo/Inc" -I"../../../../Pumpkin/Salvo/Inc/MCC30" -mlarge-code -mlarge-data -mlarge-scalar -O0 -I"ProjectHeaders" -I"../../../../Pumpkin/CubeSatKit/PIC24/inc" -I"../../../../Pumpkin/Library/PIC24/Inc" -I"../../../../Pumpkin/Salvo/Inc/MCC30" -I"../../../../Pumpkin/Salvo/Inc" -DOSMCC30_LARGE_CM=1 -msmart-io=1 -Wall -msfr-warn=off -finline -Winline
	@${FIXDEPS} "${OBJECTDIR}/_ext/1939458138/pic24_uart2.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/1939458138/pic24_uart2_msg.o: ../../../../Pumpkin/Library/PIC24/Src/pic24_uart2_msg.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1939458138" 
	@${RM} ${OBJECTDIR}/_ext/1939458138/pic24_uart2_msg.o.d 
	@${RM} ${OBJECTDIR}/_ext/1939458138/pic24_uart2_msg.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../../../Pumpkin/Library/PIC24/Src/pic24_uart2_msg.c  -o ${OBJECTDIR}/_ext/1939458138/pic24_uart2_msg.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/1939458138/pic24_uart2_msg.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1    -omf=coff -I"ProjectHeaders" -I"../../../../Pumpkin/CubeSatKit/PIC24/inc" -I"../../../../Pumpkin/Library/PIC24/Inc" -I"../../../../Pumpkin/Salvo/Inc" -I"../../../../Pumpkin/Salvo/Inc/MCC30" -mlarge-code -mlarge-data -mlarge-scalar -O0 -I"ProjectHeaders" -I"../../../../Pumpkin/CubeSatKit/PIC24/inc" -I"../../../../Pumpkin/Library/PIC24/Inc" -I"../../../../Pumpkin/Salvo/Inc/MCC30" -I"../../../../Pumpkin/Salvo/Inc" -DOSMCC30_LARGE_CM=1 -msmart-io=1 -Wall -msfr-warn=off -finline -Winline
	@${FIXDEPS} "${OBJECTDIR}/_ext/1939458138/pic24_uart2_msg.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/1939458138/pic24_uart2_msg_ts.o: ../../../../Pumpkin/Library/PIC24/Src/pic24_uart2_msg_ts.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1939458138" 
	@${RM} ${OBJECTDIR}/_ext/1939458138/pic24_uart2_msg_ts.o.d 
	@${RM} ${OBJECTDIR}/_ext/1939458138/pic24_uart2_msg_ts.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../../../Pumpkin/Library/PIC24/Src/pic24_uart2_msg_ts.c  -o ${OBJECTDIR}/_ext/1939458138/pic24_uart2_msg_ts.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/1939458138/pic24_uart2_msg_ts.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1    -omf=coff -I"ProjectHeaders" -I"../../../../Pumpkin/CubeSatKit/PIC24/inc" -I"../../../../Pumpkin/Library/PIC24/Inc" -I"../../../../Pumpkin/Salvo/Inc" -I"../../../../Pumpkin/Salvo/Inc/MCC30" -mlarge-code -mlarge-data -mlarge-scalar -O0 -I"ProjectHeaders" -I"../../../../Pumpkin/CubeSatKit/PIC24/inc" -I"../../../../Pumpkin/Library/PIC24/Inc" -I"../../../../Pumpkin/Salvo/Inc/MCC30" -I"../../../../Pumpkin/Salvo/Inc" -DOSMCC30_LARGE_CM=1 -msmart-io=1 -Wall -msfr-warn=off -finline -Winline
	@${FIXDEPS} "${OBJECTDIR}/_ext/1939458138/pic24_uart2_msg_ts.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/1939458138/pic24_uart3.o: ../../../../Pumpkin/Library/PIC24/Src/pic24_uart3.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1939458138" 
	@${RM} ${OBJECTDIR}/_ext/1939458138/pic24_uart3.o.d 
	@${RM} ${OBJECTDIR}/_ext/1939458138/pic24_uart3.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../../../Pumpkin/Library/PIC24/Src/pic24_uart3.c  -o ${OBJECTDIR}/_ext/1939458138/pic24_uart3.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/1939458138/pic24_uart3.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1    -omf=coff -I"ProjectHeaders" -I"../../../../Pumpkin/CubeSatKit/PIC24/inc" -I"../../../../Pumpkin/Library/PIC24/Inc" -I"../../../../Pumpkin/Salvo/Inc" -I"../../../../Pumpkin/Salvo/Inc/MCC30" -mlarge-code -mlarge-data -mlarge-scalar -O0 -I"ProjectHeaders" -I"../../../../Pumpkin/CubeSatKit/PIC24/inc" -I"../../../../Pumpkin/Library/PIC24/Inc" -I"../../../../Pumpkin/Salvo/Inc/MCC30" -I"../../../../Pumpkin/Salvo/Inc" -DOSMCC30_LARGE_CM=1 -msmart-io=1 -Wall -msfr-warn=off -finline -Winline
	@${FIXDEPS} "${OBJECTDIR}/_ext/1939458138/pic24_uart3.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/1939458138/pic24_uart3_msg.o: ../../../../Pumpkin/Library/PIC24/Src/pic24_uart3_msg.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1939458138" 
	@${RM} ${OBJECTDIR}/_ext/1939458138/pic24_uart3_msg.o.d 
	@${RM} ${OBJECTDIR}/_ext/1939458138/pic24_uart3_msg.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../../../Pumpkin/Library/PIC24/Src/pic24_uart3_msg.c  -o ${OBJECTDIR}/_ext/1939458138/pic24_uart3_msg.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/1939458138/pic24_uart3_msg.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1    -omf=coff -I"ProjectHeaders" -I"../../../../Pumpkin/CubeSatKit/PIC24/inc" -I"../../../../Pumpkin/Library/PIC24/Inc" -I"../../../../Pumpkin/Salvo/Inc" -I"../../../../Pumpkin/Salvo/Inc/MCC30" -mlarge-code -mlarge-data -mlarge-scalar -O0 -I"ProjectHeaders" -I"../../../../Pumpkin/CubeSatKit/PIC24/inc" -I"../../../../Pumpkin/Library/PIC24/Inc" -I"../../../../Pumpkin/Salvo/Inc/MCC30" -I"../../../../Pumpkin/Salvo/Inc" -DOSMCC30_LARGE_CM=1 -msmart-io=1 -Wall -msfr-warn=off -finline -Winline
	@${FIXDEPS} "${OBJECTDIR}/_ext/1939458138/pic24_uart3_msg.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/1939458138/pic24_uart3_msg_ts.o: ../../../../Pumpkin/Library/PIC24/Src/pic24_uart3_msg_ts.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1939458138" 
	@${RM} ${OBJECTDIR}/_ext/1939458138/pic24_uart3_msg_ts.o.d 
	@${RM} ${OBJECTDIR}/_ext/1939458138/pic24_uart3_msg_ts.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../../../Pumpkin/Library/PIC24/Src/pic24_uart3_msg_ts.c  -o ${OBJECTDIR}/_ext/1939458138/pic24_uart3_msg_ts.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/1939458138/pic24_uart3_msg_ts.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1    -omf=coff -I"ProjectHeaders" -I"../../../../Pumpkin/CubeSatKit/PIC24/inc" -I"../../../../Pumpkin/Library/PIC24/Inc" -I"../../../../Pumpkin/Salvo/Inc" -I"../../../../Pumpkin/Salvo/Inc/MCC30" -mlarge-code -mlarge-data -mlarge-scalar -O0 -I"ProjectHeaders" -I"../../../../Pumpkin/CubeSatKit/PIC24/inc" -I"../../../../Pumpkin/Library/PIC24/Inc" -I"../../../../Pumpkin/Salvo/Inc/MCC30" -I"../../../../Pumpkin/Salvo/Inc" -DOSMCC30_LARGE_CM=1 -msmart-io=1 -Wall -msfr-warn=off -finline -Winline
	@${FIXDEPS} "${OBJECTDIR}/_ext/1939458138/pic24_uart3_msg_ts.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/1939458138/pic24_uart4.o: ../../../../Pumpkin/Library/PIC24/Src/pic24_uart4.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1939458138" 
	@${RM} ${OBJECTDIR}/_ext/1939458138/pic24_uart4.o.d 
	@${RM} ${OBJECTDIR}/_ext/1939458138/pic24_uart4.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../../../Pumpkin/Library/PIC24/Src/pic24_uart4.c  -o ${OBJECTDIR}/_ext/1939458138/pic24_uart4.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/1939458138/pic24_uart4.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1    -omf=coff -I"ProjectHeaders" -I"../../../../Pumpkin/CubeSatKit/PIC24/inc" -I"../../../../Pumpkin/Library/PIC24/Inc" -I"../../../../Pumpkin/Salvo/Inc" -I"../../../../Pumpkin/Salvo/Inc/MCC30" -mlarge-code -mlarge-data -mlarge-scalar -O0 -I"ProjectHeaders" -I"../../../../Pumpkin/CubeSatKit/PIC24/inc" -I"../../../../Pumpkin/Library/PIC24/Inc" -I"../../../../Pumpkin/Salvo/Inc/MCC30" -I"../../../../Pumpkin/Salvo/Inc" -DOSMCC30_LARGE_CM=1 -msmart-io=1 -Wall -msfr-warn=off -finline -Winline
	@${FIXDEPS} "${OBJECTDIR}/_ext/1939458138/pic24_uart4.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/1939458138/pic24_uart4_msg.o: ../../../../Pumpkin/Library/PIC24/Src/pic24_uart4_msg.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1939458138" 
	@${RM} ${OBJECTDIR}/_ext/1939458138/pic24_uart4_msg.o.d 
	@${RM} ${OBJECTDIR}/_ext/1939458138/pic24_uart4_msg.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../../../Pumpkin/Library/PIC24/Src/pic24_uart4_msg.c  -o ${OBJECTDIR}/_ext/1939458138/pic24_uart4_msg.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/1939458138/pic24_uart4_msg.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1    -omf=coff -I"ProjectHeaders" -I"../../../../Pumpkin/CubeSatKit/PIC24/inc" -I"../../../../Pumpkin/Library/PIC24/Inc" -I"../../../../Pumpkin/Salvo/Inc" -I"../../../../Pumpkin/Salvo/Inc/MCC30" -mlarge-code -mlarge-data -mlarge-scalar -O0 -I"ProjectHeaders" -I"../../../../Pumpkin/CubeSatKit/PIC24/inc" -I"../../../../Pumpkin/Library/PIC24/Inc" -I"../../../../Pumpkin/Salvo/Inc/MCC30" -I"../../../../Pumpkin/Salvo/Inc" -DOSMCC30_LARGE_CM=1 -msmart-io=1 -Wall -msfr-warn=off -finline -Winline
	@${FIXDEPS} "${OBJECTDIR}/_ext/1939458138/pic24_uart4_msg.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/1939458138/pic24_uart4_msg_ts.o: ../../../../Pumpkin/Library/PIC24/Src/pic24_uart4_msg_ts.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1939458138" 
	@${RM} ${OBJECTDIR}/_ext/1939458138/pic24_uart4_msg_ts.o.d 
	@${RM} ${OBJECTDIR}/_ext/1939458138/pic24_uart4_msg_ts.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../../../Pumpkin/Library/PIC24/Src/pic24_uart4_msg_ts.c  -o ${OBJECTDIR}/_ext/1939458138/pic24_uart4_msg_ts.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/1939458138/pic24_uart4_msg_ts.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1    -omf=coff -I"ProjectHeaders" -I"../../../../Pumpkin/CubeSatKit/PIC24/inc" -I"../../../../Pumpkin/Library/PIC24/Inc" -I"../../../../Pumpkin/Salvo/Inc" -I"../../../../Pumpkin/Salvo/Inc/MCC30" -mlarge-code -mlarge-data -mlarge-scalar -O0 -I"ProjectHeaders" -I"../../../../Pumpkin/CubeSatKit/PIC24/inc" -I"../../../../Pumpkin/Library/PIC24/Inc" -I"../../../../Pumpkin/Salvo/Inc/MCC30" -I"../../../../Pumpkin/Salvo/Inc" -DOSMCC30_LARGE_CM=1 -msmart-io=1 -Wall -msfr-warn=off -finline -Winline
	@${FIXDEPS} "${OBJECTDIR}/_ext/1939458138/pic24_uart4_msg_ts.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/ProjectSources/main.o: ProjectSources/main.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/ProjectSources" 
	@${RM} ${OBJECTDIR}/ProjectSources/main.o.d 
	@${RM} ${OBJECTDIR}/ProjectSources/main.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ProjectSources/main.c  -o ${OBJECTDIR}/ProjectSources/main.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/ProjectSources/main.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1    -omf=coff -I"ProjectHeaders" -I"../../../../Pumpkin/CubeSatKit/PIC24/inc" -I"../../../../Pumpkin/Library/PIC24/Inc" -I"../../../../Pumpkin/Salvo/Inc" -I"../../../../Pumpkin/Salvo/Inc/MCC30" -mlarge-code -mlarge-data -mlarge-scalar -O0 -I"ProjectHeaders" -I"../../../../Pumpkin/CubeSatKit/PIC24/inc" -I"../../../../Pumpkin/Library/PIC24/Inc" -I"../../../../Pumpkin/Salvo/Inc/MCC30" -I"../../../../Pumpkin/Salvo/Inc" -DOSMCC30_LARGE_CM=1 -msmart-io=1 -Wall -msfr-warn=off -finline -Winline
	@${FIXDEPS} "${OBJECTDIR}/ProjectSources/main.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/ProjectSources/debug_functions.o: ProjectSources/debug_functions.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/ProjectSources" 
	@${RM} ${OBJECTDIR}/ProjectSources/debug_functions.o.d 
	@${RM} ${OBJECTDIR}/ProjectSources/debug_functions.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ProjectSources/debug_functions.c  -o ${OBJECTDIR}/ProjectSources/debug_functions.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/ProjectSources/debug_functions.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1    -omf=coff -I"ProjectHeaders" -I"../../../../Pumpkin/CubeSatKit/PIC24/inc" -I"../../../../Pumpkin/Library/PIC24/Inc" -I"../../../../Pumpkin/Salvo/Inc" -I"../../../../Pumpkin/Salvo/Inc/MCC30" -mlarge-code -mlarge-data -mlarge-scalar -O0 -I"ProjectHeaders" -I"../../../../Pumpkin/CubeSatKit/PIC24/inc" -I"../../../../Pumpkin/Library/PIC24/Inc" -I"../../../../Pumpkin/Salvo/Inc/MCC30" -I"../../../../Pumpkin/Salvo/Inc" -DOSMCC30_LARGE_CM=1 -msmart-io=1 -Wall -msfr-warn=off -finline -Winline
	@${FIXDEPS} "${OBJECTDIR}/ProjectSources/debug_functions.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/ProjectSources/messagequeues.o: ProjectSources/messagequeues.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/ProjectSources" 
	@${RM} ${OBJECTDIR}/ProjectSources/messagequeues.o.d 
	@${RM} ${OBJECTDIR}/ProjectSources/messagequeues.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ProjectSources/messagequeues.c  -o ${OBJECTDIR}/ProjectSources/messagequeues.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/ProjectSources/messagequeues.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1    -omf=coff -I"ProjectHeaders" -I"../../../../Pumpkin/CubeSatKit/PIC24/inc" -I"../../../../Pumpkin/Library/PIC24/Inc" -I"../../../../Pumpkin/Salvo/Inc" -I"../../../../Pumpkin/Salvo/Inc/MCC30" -mlarge-code -mlarge-data -mlarge-scalar -O0 -I"ProjectHeaders" -I"../../../../Pumpkin/CubeSatKit/PIC24/inc" -I"../../../../Pumpkin/Library/PIC24/Inc" -I"../../../../Pumpkin/Salvo/Inc/MCC30" -I"../../../../Pumpkin/Salvo/Inc" -DOSMCC30_LARGE_CM=1 -msmart-io=1 -Wall -msfr-warn=off -finline -Winline
	@${FIXDEPS} "${OBJECTDIR}/ProjectSources/messagequeues.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/ProjectSources/task_beacon.o: ProjectSources/task_beacon.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/ProjectSources" 
	@${RM} ${OBJECTDIR}/ProjectSources/task_beacon.o.d 
	@${RM} ${OBJECTDIR}/ProjectSources/task_beacon.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ProjectSources/task_beacon.c  -o ${OBJECTDIR}/ProjectSources/task_beacon.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/ProjectSources/task_beacon.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1    -omf=coff -I"ProjectHeaders" -I"../../../../Pumpkin/CubeSatKit/PIC24/inc" -I"../../../../Pumpkin/Library/PIC24/Inc" -I"../../../../Pumpkin/Salvo/Inc" -I"../../../../Pumpkin/Salvo/Inc/MCC30" -mlarge-code -mlarge-data -mlarge-scalar -O0 -I"ProjectHeaders" -I"../../../../Pumpkin/CubeSatKit/PIC24/inc" -I"../../../../Pumpkin/Library/PIC24/Inc" -I"../../../../Pumpkin/Salvo/Inc/MCC30" -I"../../../../Pumpkin/Salvo/Inc" -DOSMCC30_LARGE_CM=1 -msmart-io=1 -Wall -msfr-warn=off -finline -Winline
	@${FIXDEPS} "${OBJECTDIR}/ProjectSources/task_beacon.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/ProjectSources/task_radio_listen.o: ProjectSources/task_radio_listen.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/ProjectSources" 
	@${RM} ${OBJECTDIR}/ProjectSources/task_radio_listen.o.d 
	@${RM} ${OBJECTDIR}/ProjectSources/task_radio_listen.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ProjectSources/task_radio_listen.c  -o ${OBJECTDIR}/ProjectSources/task_radio_listen.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/ProjectSources/task_radio_listen.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1    -omf=coff -I"ProjectHeaders" -I"../../../../Pumpkin/CubeSatKit/PIC24/inc" -I"../../../../Pumpkin/Library/PIC24/Inc" -I"../../../../Pumpkin/Salvo/Inc" -I"../../../../Pumpkin/Salvo/Inc/MCC30" -mlarge-code -mlarge-data -mlarge-scalar -O0 -I"ProjectHeaders" -I"../../../../Pumpkin/CubeSatKit/PIC24/inc" -I"../../../../Pumpkin/Library/PIC24/Inc" -I"../../../../Pumpkin/Salvo/Inc/MCC30" -I"../../../../Pumpkin/Salvo/Inc" -DOSMCC30_LARGE_CM=1 -msmart-io=1 -Wall -msfr-warn=off -finline -Winline
	@${FIXDEPS} "${OBJECTDIR}/ProjectSources/task_radio_listen.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/ProjectSources/task_scheduler.o: ProjectSources/task_scheduler.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/ProjectSources" 
	@${RM} ${OBJECTDIR}/ProjectSources/task_scheduler.o.d 
	@${RM} ${OBJECTDIR}/ProjectSources/task_scheduler.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ProjectSources/task_scheduler.c  -o ${OBJECTDIR}/ProjectSources/task_scheduler.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/ProjectSources/task_scheduler.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1    -omf=coff -I"ProjectHeaders" -I"../../../../Pumpkin/CubeSatKit/PIC24/inc" -I"../../../../Pumpkin/Library/PIC24/Inc" -I"../../../../Pumpkin/Salvo/Inc" -I"../../../../Pumpkin/Salvo/Inc/MCC30" -mlarge-code -mlarge-data -mlarge-scalar -O0 -I"ProjectHeaders" -I"../../../../Pumpkin/CubeSatKit/PIC24/inc" -I"../../../../Pumpkin/Library/PIC24/Inc" -I"../../../../Pumpkin/Salvo/Inc/MCC30" -I"../../../../Pumpkin/Salvo/Inc" -DOSMCC30_LARGE_CM=1 -msmart-io=1 -Wall -msfr-warn=off -finline -Winline
	@${FIXDEPS} "${OBJECTDIR}/ProjectSources/task_scheduler.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/ProjectSources/task_test.o: ProjectSources/task_test.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/ProjectSources" 
	@${RM} ${OBJECTDIR}/ProjectSources/task_test.o.d 
	@${RM} ${OBJECTDIR}/ProjectSources/task_test.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ProjectSources/task_test.c  -o ${OBJECTDIR}/ProjectSources/task_test.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/ProjectSources/task_test.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1    -omf=coff -I"ProjectHeaders" -I"../../../../Pumpkin/CubeSatKit/PIC24/inc" -I"../../../../Pumpkin/Library/PIC24/Inc" -I"../../../../Pumpkin/Salvo/Inc" -I"../../../../Pumpkin/Salvo/Inc/MCC30" -mlarge-code -mlarge-data -mlarge-scalar -O0 -I"ProjectHeaders" -I"../../../../Pumpkin/CubeSatKit/PIC24/inc" -I"../../../../Pumpkin/Library/PIC24/Inc" -I"../../../../Pumpkin/Salvo/Inc/MCC30" -I"../../../../Pumpkin/Salvo/Inc" -DOSMCC30_LARGE_CM=1 -msmart-io=1 -Wall -msfr-warn=off -finline -Winline
	@${FIXDEPS} "${OBJECTDIR}/ProjectSources/task_test.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/ProjectSources/init.o: ProjectSources/init.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/ProjectSources" 
	@${RM} ${OBJECTDIR}/ProjectSources/init.o.d 
	@${RM} ${OBJECTDIR}/ProjectSources/init.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ProjectSources/init.c  -o ${OBJECTDIR}/ProjectSources/init.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/ProjectSources/init.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1    -omf=coff -I"ProjectHeaders" -I"../../../../Pumpkin/CubeSatKit/PIC24/inc" -I"../../../../Pumpkin/Library/PIC24/Inc" -I"../../../../Pumpkin/Salvo/Inc" -I"../../../../Pumpkin/Salvo/Inc/MCC30" -mlarge-code -mlarge-data -mlarge-scalar -O0 -I"ProjectHeaders" -I"../../../../Pumpkin/CubeSatKit/PIC24/inc" -I"../../../../Pumpkin/Library/PIC24/Inc" -I"../../../../Pumpkin/Salvo/Inc/MCC30" -I"../../../../Pumpkin/Salvo/Inc" -DOSMCC30_LARGE_CM=1 -msmart-io=1 -Wall -msfr-warn=off -finline -Winline
	@${FIXDEPS} "${OBJECTDIR}/ProjectSources/init.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/ProjectSources/task_radio_talk.o: ProjectSources/task_radio_talk.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/ProjectSources" 
	@${RM} ${OBJECTDIR}/ProjectSources/task_radio_talk.o.d 
	@${RM} ${OBJECTDIR}/ProjectSources/task_radio_talk.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ProjectSources/task_radio_talk.c  -o ${OBJECTDIR}/ProjectSources/task_radio_talk.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/ProjectSources/task_radio_talk.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1    -omf=coff -I"ProjectHeaders" -I"../../../../Pumpkin/CubeSatKit/PIC24/inc" -I"../../../../Pumpkin/Library/PIC24/Inc" -I"../../../../Pumpkin/Salvo/Inc" -I"../../../../Pumpkin/Salvo/Inc/MCC30" -mlarge-code -mlarge-data -mlarge-scalar -O0 -I"ProjectHeaders" -I"../../../../Pumpkin/CubeSatKit/PIC24/inc" -I"../../../../Pumpkin/Library/PIC24/Inc" -I"../../../../Pumpkin/Salvo/Inc/MCC30" -I"../../../../Pumpkin/Salvo/Inc" -DOSMCC30_LARGE_CM=1 -msmart-io=1 -Wall -msfr-warn=off -finline -Winline
	@${FIXDEPS} "${OBJECTDIR}/ProjectSources/task_radio_talk.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/1458030235/salvomem.o: ../../../../Pumpkin/Salvo/Src/salvomem.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1458030235" 
	@${RM} ${OBJECTDIR}/_ext/1458030235/salvomem.o.d 
	@${RM} ${OBJECTDIR}/_ext/1458030235/salvomem.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../../../Pumpkin/Salvo/Src/salvomem.c  -o ${OBJECTDIR}/_ext/1458030235/salvomem.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/1458030235/salvomem.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1    -omf=coff -I"ProjectHeaders" -I"../../../../Pumpkin/CubeSatKit/PIC24/inc" -I"../../../../Pumpkin/Library/PIC24/Inc" -I"../../../../Pumpkin/Salvo/Inc" -I"../../../../Pumpkin/Salvo/Inc/MCC30" -mlarge-code -mlarge-data -mlarge-scalar -O0 -I"ProjectHeaders" -I"../../../../Pumpkin/CubeSatKit/PIC24/inc" -I"../../../../Pumpkin/Library/PIC24/Inc" -I"../../../../Pumpkin/Salvo/Inc/MCC30" -I"../../../../Pumpkin/Salvo/Inc" -DOSMCC30_LARGE_CM=1 -msmart-io=1 -Wall -msfr-warn=off -finline -Winline
	@${FIXDEPS} "${OBJECTDIR}/_ext/1458030235/salvomem.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
else
${OBJECTDIR}/_ext/1443471778/csk_led.o: ../../../../Pumpkin/CubeSatKit/PIC24/src/csk_led.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1443471778" 
	@${RM} ${OBJECTDIR}/_ext/1443471778/csk_led.o.d 
	@${RM} ${OBJECTDIR}/_ext/1443471778/csk_led.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../../../Pumpkin/CubeSatKit/PIC24/src/csk_led.c  -o ${OBJECTDIR}/_ext/1443471778/csk_led.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/1443471778/csk_led.o.d"        -g -omf=coff -I"ProjectHeaders" -I"../../../../Pumpkin/CubeSatKit/PIC24/inc" -I"../../../../Pumpkin/Library/PIC24/Inc" -I"../../../../Pumpkin/Salvo/Inc" -I"../../../../Pumpkin/Salvo/Inc/MCC30" -mlarge-code -mlarge-data -mlarge-scalar -O0 -I"ProjectHeaders" -I"../../../../Pumpkin/CubeSatKit/PIC24/inc" -I"../../../../Pumpkin/Library/PIC24/Inc" -I"../../../../Pumpkin/Salvo/Inc/MCC30" -I"../../../../Pumpkin/Salvo/Inc" -DOSMCC30_LARGE_CM=1 -msmart-io=1 -Wall -msfr-warn=off -finline -Winline
	@${FIXDEPS} "${OBJECTDIR}/_ext/1443471778/csk_led.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/1443471778/csk_mhx.o: ../../../../Pumpkin/CubeSatKit/PIC24/src/csk_mhx.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1443471778" 
	@${RM} ${OBJECTDIR}/_ext/1443471778/csk_mhx.o.d 
	@${RM} ${OBJECTDIR}/_ext/1443471778/csk_mhx.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../../../Pumpkin/CubeSatKit/PIC24/src/csk_mhx.c  -o ${OBJECTDIR}/_ext/1443471778/csk_mhx.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/1443471778/csk_mhx.o.d"        -g -omf=coff -I"ProjectHeaders" -I"../../../../Pumpkin/CubeSatKit/PIC24/inc" -I"../../../../Pumpkin/Library/PIC24/Inc" -I"../../../../Pumpkin/Salvo/Inc" -I"../../../../Pumpkin/Salvo/Inc/MCC30" -mlarge-code -mlarge-data -mlarge-scalar -O0 -I"ProjectHeaders" -I"../../../../Pumpkin/CubeSatKit/PIC24/inc" -I"../../../../Pumpkin/Library/PIC24/Inc" -I"../../../../Pumpkin/Salvo/Inc/MCC30" -I"../../../../Pumpkin/Salvo/Inc" -DOSMCC30_LARGE_CM=1 -msmart-io=1 -Wall -msfr-warn=off -finline -Winline
	@${FIXDEPS} "${OBJECTDIR}/_ext/1443471778/csk_mhx.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/1443471778/csk_power.o: ../../../../Pumpkin/CubeSatKit/PIC24/src/csk_power.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1443471778" 
	@${RM} ${OBJECTDIR}/_ext/1443471778/csk_power.o.d 
	@${RM} ${OBJECTDIR}/_ext/1443471778/csk_power.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../../../Pumpkin/CubeSatKit/PIC24/src/csk_power.c  -o ${OBJECTDIR}/_ext/1443471778/csk_power.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/1443471778/csk_power.o.d"        -g -omf=coff -I"ProjectHeaders" -I"../../../../Pumpkin/CubeSatKit/PIC24/inc" -I"../../../../Pumpkin/Library/PIC24/Inc" -I"../../../../Pumpkin/Salvo/Inc" -I"../../../../Pumpkin/Salvo/Inc/MCC30" -mlarge-code -mlarge-data -mlarge-scalar -O0 -I"ProjectHeaders" -I"../../../../Pumpkin/CubeSatKit/PIC24/inc" -I"../../../../Pumpkin/Library/PIC24/Inc" -I"../../../../Pumpkin/Salvo/Inc/MCC30" -I"../../../../Pumpkin/Salvo/Inc" -DOSMCC30_LARGE_CM=1 -msmart-io=1 -Wall -msfr-warn=off -finline -Winline
	@${FIXDEPS} "${OBJECTDIR}/_ext/1443471778/csk_power.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/1443471778/csk_rand.o: ../../../../Pumpkin/CubeSatKit/PIC24/src/csk_rand.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1443471778" 
	@${RM} ${OBJECTDIR}/_ext/1443471778/csk_rand.o.d 
	@${RM} ${OBJECTDIR}/_ext/1443471778/csk_rand.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../../../Pumpkin/CubeSatKit/PIC24/src/csk_rand.c  -o ${OBJECTDIR}/_ext/1443471778/csk_rand.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/1443471778/csk_rand.o.d"        -g -omf=coff -I"ProjectHeaders" -I"../../../../Pumpkin/CubeSatKit/PIC24/inc" -I"../../../../Pumpkin/Library/PIC24/Inc" -I"../../../../Pumpkin/Salvo/Inc" -I"../../../../Pumpkin/Salvo/Inc/MCC30" -mlarge-code -mlarge-data -mlarge-scalar -O0 -I"ProjectHeaders" -I"../../../../Pumpkin/CubeSatKit/PIC24/inc" -I"../../../../Pumpkin/Library/PIC24/Inc" -I"../../../../Pumpkin/Salvo/Inc/MCC30" -I"../../../../Pumpkin/Salvo/Inc" -DOSMCC30_LARGE_CM=1 -msmart-io=1 -Wall -msfr-warn=off -finline -Winline
	@${FIXDEPS} "${OBJECTDIR}/_ext/1443471778/csk_rand.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/1443471778/csk_sd.o: ../../../../Pumpkin/CubeSatKit/PIC24/src/csk_sd.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1443471778" 
	@${RM} ${OBJECTDIR}/_ext/1443471778/csk_sd.o.d 
	@${RM} ${OBJECTDIR}/_ext/1443471778/csk_sd.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../../../Pumpkin/CubeSatKit/PIC24/src/csk_sd.c  -o ${OBJECTDIR}/_ext/1443471778/csk_sd.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/1443471778/csk_sd.o.d"        -g -omf=coff -I"ProjectHeaders" -I"../../../../Pumpkin/CubeSatKit/PIC24/inc" -I"../../../../Pumpkin/Library/PIC24/Inc" -I"../../../../Pumpkin/Salvo/Inc" -I"../../../../Pumpkin/Salvo/Inc/MCC30" -mlarge-code -mlarge-data -mlarge-scalar -O0 -I"ProjectHeaders" -I"../../../../Pumpkin/CubeSatKit/PIC24/inc" -I"../../../../Pumpkin/Library/PIC24/Inc" -I"../../../../Pumpkin/Salvo/Inc/MCC30" -I"../../../../Pumpkin/Salvo/Inc" -DOSMCC30_LARGE_CM=1 -msmart-io=1 -Wall -msfr-warn=off -finline -Winline
	@${FIXDEPS} "${OBJECTDIR}/_ext/1443471778/csk_sd.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/1443471778/csk_usb.o: ../../../../Pumpkin/CubeSatKit/PIC24/src/csk_usb.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1443471778" 
	@${RM} ${OBJECTDIR}/_ext/1443471778/csk_usb.o.d 
	@${RM} ${OBJECTDIR}/_ext/1443471778/csk_usb.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../../../Pumpkin/CubeSatKit/PIC24/src/csk_usb.c  -o ${OBJECTDIR}/_ext/1443471778/csk_usb.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/1443471778/csk_usb.o.d"        -g -omf=coff -I"ProjectHeaders" -I"../../../../Pumpkin/CubeSatKit/PIC24/inc" -I"../../../../Pumpkin/Library/PIC24/Inc" -I"../../../../Pumpkin/Salvo/Inc" -I"../../../../Pumpkin/Salvo/Inc/MCC30" -mlarge-code -mlarge-data -mlarge-scalar -O0 -I"ProjectHeaders" -I"../../../../Pumpkin/CubeSatKit/PIC24/inc" -I"../../../../Pumpkin/Library/PIC24/Inc" -I"../../../../Pumpkin/Salvo/Inc/MCC30" -I"../../../../Pumpkin/Salvo/Inc" -DOSMCC30_LARGE_CM=1 -msmart-io=1 -Wall -msfr-warn=off -finline -Winline
	@${FIXDEPS} "${OBJECTDIR}/_ext/1443471778/csk_usb.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/1443471778/csk_wdt.o: ../../../../Pumpkin/CubeSatKit/PIC24/src/csk_wdt.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1443471778" 
	@${RM} ${OBJECTDIR}/_ext/1443471778/csk_wdt.o.d 
	@${RM} ${OBJECTDIR}/_ext/1443471778/csk_wdt.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../../../Pumpkin/CubeSatKit/PIC24/src/csk_wdt.c  -o ${OBJECTDIR}/_ext/1443471778/csk_wdt.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/1443471778/csk_wdt.o.d"        -g -omf=coff -I"ProjectHeaders" -I"../../../../Pumpkin/CubeSatKit/PIC24/inc" -I"../../../../Pumpkin/Library/PIC24/Inc" -I"../../../../Pumpkin/Salvo/Inc" -I"../../../../Pumpkin/Salvo/Inc/MCC30" -mlarge-code -mlarge-data -mlarge-scalar -O0 -I"ProjectHeaders" -I"../../../../Pumpkin/CubeSatKit/PIC24/inc" -I"../../../../Pumpkin/Library/PIC24/Inc" -I"../../../../Pumpkin/Salvo/Inc/MCC30" -I"../../../../Pumpkin/Salvo/Inc" -DOSMCC30_LARGE_CM=1 -msmart-io=1 -Wall -msfr-warn=off -finline -Winline
	@${FIXDEPS} "${OBJECTDIR}/_ext/1443471778/csk_wdt.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/1443471778/effs_thin_mmc_drv_spi1.o: ../../../../Pumpkin/CubeSatKit/PIC24/src/effs_thin_mmc_drv_spi1.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1443471778" 
	@${RM} ${OBJECTDIR}/_ext/1443471778/effs_thin_mmc_drv_spi1.o.d 
	@${RM} ${OBJECTDIR}/_ext/1443471778/effs_thin_mmc_drv_spi1.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../../../Pumpkin/CubeSatKit/PIC24/src/effs_thin_mmc_drv_spi1.c  -o ${OBJECTDIR}/_ext/1443471778/effs_thin_mmc_drv_spi1.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/1443471778/effs_thin_mmc_drv_spi1.o.d"        -g -omf=coff -I"ProjectHeaders" -I"../../../../Pumpkin/CubeSatKit/PIC24/inc" -I"../../../../Pumpkin/Library/PIC24/Inc" -I"../../../../Pumpkin/Salvo/Inc" -I"../../../../Pumpkin/Salvo/Inc/MCC30" -mlarge-code -mlarge-data -mlarge-scalar -O0 -I"ProjectHeaders" -I"../../../../Pumpkin/CubeSatKit/PIC24/inc" -I"../../../../Pumpkin/Library/PIC24/Inc" -I"../../../../Pumpkin/Salvo/Inc/MCC30" -I"../../../../Pumpkin/Salvo/Inc" -DOSMCC30_LARGE_CM=1 -msmart-io=1 -Wall -msfr-warn=off -finline -Winline
	@${FIXDEPS} "${OBJECTDIR}/_ext/1443471778/effs_thin_mmc_drv_spi1.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/1443471778/csk_io.o: ../../../../Pumpkin/CubeSatKit/PIC24/src/csk_io.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1443471778" 
	@${RM} ${OBJECTDIR}/_ext/1443471778/csk_io.o.d 
	@${RM} ${OBJECTDIR}/_ext/1443471778/csk_io.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../../../Pumpkin/CubeSatKit/PIC24/src/csk_io.c  -o ${OBJECTDIR}/_ext/1443471778/csk_io.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/1443471778/csk_io.o.d"        -g -omf=coff -I"ProjectHeaders" -I"../../../../Pumpkin/CubeSatKit/PIC24/inc" -I"../../../../Pumpkin/Library/PIC24/Inc" -I"../../../../Pumpkin/Salvo/Inc" -I"../../../../Pumpkin/Salvo/Inc/MCC30" -mlarge-code -mlarge-data -mlarge-scalar -O0 -I"ProjectHeaders" -I"../../../../Pumpkin/CubeSatKit/PIC24/inc" -I"../../../../Pumpkin/Library/PIC24/Inc" -I"../../../../Pumpkin/Salvo/Inc/MCC30" -I"../../../../Pumpkin/Salvo/Inc" -DOSMCC30_LARGE_CM=1 -msmart-io=1 -Wall -msfr-warn=off -finline -Winline
	@${FIXDEPS} "${OBJECTDIR}/_ext/1443471778/csk_io.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/1939458138/pic24_uart1.o: ../../../../Pumpkin/Library/PIC24/Src/pic24_uart1.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1939458138" 
	@${RM} ${OBJECTDIR}/_ext/1939458138/pic24_uart1.o.d 
	@${RM} ${OBJECTDIR}/_ext/1939458138/pic24_uart1.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../../../Pumpkin/Library/PIC24/Src/pic24_uart1.c  -o ${OBJECTDIR}/_ext/1939458138/pic24_uart1.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/1939458138/pic24_uart1.o.d"        -g -omf=coff -I"ProjectHeaders" -I"../../../../Pumpkin/CubeSatKit/PIC24/inc" -I"../../../../Pumpkin/Library/PIC24/Inc" -I"../../../../Pumpkin/Salvo/Inc" -I"../../../../Pumpkin/Salvo/Inc/MCC30" -mlarge-code -mlarge-data -mlarge-scalar -O0 -I"ProjectHeaders" -I"../../../../Pumpkin/CubeSatKit/PIC24/inc" -I"../../../../Pumpkin/Library/PIC24/Inc" -I"../../../../Pumpkin/Salvo/Inc/MCC30" -I"../../../../Pumpkin/Salvo/Inc" -DOSMCC30_LARGE_CM=1 -msmart-io=1 -Wall -msfr-warn=off -finline -Winline
	@${FIXDEPS} "${OBJECTDIR}/_ext/1939458138/pic24_uart1.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/1939458138/pic24_uart1_msg.o: ../../../../Pumpkin/Library/PIC24/Src/pic24_uart1_msg.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1939458138" 
	@${RM} ${OBJECTDIR}/_ext/1939458138/pic24_uart1_msg.o.d 
	@${RM} ${OBJECTDIR}/_ext/1939458138/pic24_uart1_msg.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../../../Pumpkin/Library/PIC24/Src/pic24_uart1_msg.c  -o ${OBJECTDIR}/_ext/1939458138/pic24_uart1_msg.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/1939458138/pic24_uart1_msg.o.d"        -g -omf=coff -I"ProjectHeaders" -I"../../../../Pumpkin/CubeSatKit/PIC24/inc" -I"../../../../Pumpkin/Library/PIC24/Inc" -I"../../../../Pumpkin/Salvo/Inc" -I"../../../../Pumpkin/Salvo/Inc/MCC30" -mlarge-code -mlarge-data -mlarge-scalar -O0 -I"ProjectHeaders" -I"../../../../Pumpkin/CubeSatKit/PIC24/inc" -I"../../../../Pumpkin/Library/PIC24/Inc" -I"../../../../Pumpkin/Salvo/Inc/MCC30" -I"../../../../Pumpkin/Salvo/Inc" -DOSMCC30_LARGE_CM=1 -msmart-io=1 -Wall -msfr-warn=off -finline -Winline
	@${FIXDEPS} "${OBJECTDIR}/_ext/1939458138/pic24_uart1_msg.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/1939458138/pic24_uart1_msg_ts.o: ../../../../Pumpkin/Library/PIC24/Src/pic24_uart1_msg_ts.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1939458138" 
	@${RM} ${OBJECTDIR}/_ext/1939458138/pic24_uart1_msg_ts.o.d 
	@${RM} ${OBJECTDIR}/_ext/1939458138/pic24_uart1_msg_ts.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../../../Pumpkin/Library/PIC24/Src/pic24_uart1_msg_ts.c  -o ${OBJECTDIR}/_ext/1939458138/pic24_uart1_msg_ts.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/1939458138/pic24_uart1_msg_ts.o.d"        -g -omf=coff -I"ProjectHeaders" -I"../../../../Pumpkin/CubeSatKit/PIC24/inc" -I"../../../../Pumpkin/Library/PIC24/Inc" -I"../../../../Pumpkin/Salvo/Inc" -I"../../../../Pumpkin/Salvo/Inc/MCC30" -mlarge-code -mlarge-data -mlarge-scalar -O0 -I"ProjectHeaders" -I"../../../../Pumpkin/CubeSatKit/PIC24/inc" -I"../../../../Pumpkin/Library/PIC24/Inc" -I"../../../../Pumpkin/Salvo/Inc/MCC30" -I"../../../../Pumpkin/Salvo/Inc" -DOSMCC30_LARGE_CM=1 -msmart-io=1 -Wall -msfr-warn=off -finline -Winline
	@${FIXDEPS} "${OBJECTDIR}/_ext/1939458138/pic24_uart1_msg_ts.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/1939458138/pic24_uart2.o: ../../../../Pumpkin/Library/PIC24/Src/pic24_uart2.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1939458138" 
	@${RM} ${OBJECTDIR}/_ext/1939458138/pic24_uart2.o.d 
	@${RM} ${OBJECTDIR}/_ext/1939458138/pic24_uart2.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../../../Pumpkin/Library/PIC24/Src/pic24_uart2.c  -o ${OBJECTDIR}/_ext/1939458138/pic24_uart2.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/1939458138/pic24_uart2.o.d"        -g -omf=coff -I"ProjectHeaders" -I"../../../../Pumpkin/CubeSatKit/PIC24/inc" -I"../../../../Pumpkin/Library/PIC24/Inc" -I"../../../../Pumpkin/Salvo/Inc" -I"../../../../Pumpkin/Salvo/Inc/MCC30" -mlarge-code -mlarge-data -mlarge-scalar -O0 -I"ProjectHeaders" -I"../../../../Pumpkin/CubeSatKit/PIC24/inc" -I"../../../../Pumpkin/Library/PIC24/Inc" -I"../../../../Pumpkin/Salvo/Inc/MCC30" -I"../../../../Pumpkin/Salvo/Inc" -DOSMCC30_LARGE_CM=1 -msmart-io=1 -Wall -msfr-warn=off -finline -Winline
	@${FIXDEPS} "${OBJECTDIR}/_ext/1939458138/pic24_uart2.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/1939458138/pic24_uart2_msg.o: ../../../../Pumpkin/Library/PIC24/Src/pic24_uart2_msg.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1939458138" 
	@${RM} ${OBJECTDIR}/_ext/1939458138/pic24_uart2_msg.o.d 
	@${RM} ${OBJECTDIR}/_ext/1939458138/pic24_uart2_msg.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../../../Pumpkin/Library/PIC24/Src/pic24_uart2_msg.c  -o ${OBJECTDIR}/_ext/1939458138/pic24_uart2_msg.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/1939458138/pic24_uart2_msg.o.d"        -g -omf=coff -I"ProjectHeaders" -I"../../../../Pumpkin/CubeSatKit/PIC24/inc" -I"../../../../Pumpkin/Library/PIC24/Inc" -I"../../../../Pumpkin/Salvo/Inc" -I"../../../../Pumpkin/Salvo/Inc/MCC30" -mlarge-code -mlarge-data -mlarge-scalar -O0 -I"ProjectHeaders" -I"../../../../Pumpkin/CubeSatKit/PIC24/inc" -I"../../../../Pumpkin/Library/PIC24/Inc" -I"../../../../Pumpkin/Salvo/Inc/MCC30" -I"../../../../Pumpkin/Salvo/Inc" -DOSMCC30_LARGE_CM=1 -msmart-io=1 -Wall -msfr-warn=off -finline -Winline
	@${FIXDEPS} "${OBJECTDIR}/_ext/1939458138/pic24_uart2_msg.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/1939458138/pic24_uart2_msg_ts.o: ../../../../Pumpkin/Library/PIC24/Src/pic24_uart2_msg_ts.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1939458138" 
	@${RM} ${OBJECTDIR}/_ext/1939458138/pic24_uart2_msg_ts.o.d 
	@${RM} ${OBJECTDIR}/_ext/1939458138/pic24_uart2_msg_ts.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../../../Pumpkin/Library/PIC24/Src/pic24_uart2_msg_ts.c  -o ${OBJECTDIR}/_ext/1939458138/pic24_uart2_msg_ts.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/1939458138/pic24_uart2_msg_ts.o.d"        -g -omf=coff -I"ProjectHeaders" -I"../../../../Pumpkin/CubeSatKit/PIC24/inc" -I"../../../../Pumpkin/Library/PIC24/Inc" -I"../../../../Pumpkin/Salvo/Inc" -I"../../../../Pumpkin/Salvo/Inc/MCC30" -mlarge-code -mlarge-data -mlarge-scalar -O0 -I"ProjectHeaders" -I"../../../../Pumpkin/CubeSatKit/PIC24/inc" -I"../../../../Pumpkin/Library/PIC24/Inc" -I"../../../../Pumpkin/Salvo/Inc/MCC30" -I"../../../../Pumpkin/Salvo/Inc" -DOSMCC30_LARGE_CM=1 -msmart-io=1 -Wall -msfr-warn=off -finline -Winline
	@${FIXDEPS} "${OBJECTDIR}/_ext/1939458138/pic24_uart2_msg_ts.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/1939458138/pic24_uart3.o: ../../../../Pumpkin/Library/PIC24/Src/pic24_uart3.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1939458138" 
	@${RM} ${OBJECTDIR}/_ext/1939458138/pic24_uart3.o.d 
	@${RM} ${OBJECTDIR}/_ext/1939458138/pic24_uart3.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../../../Pumpkin/Library/PIC24/Src/pic24_uart3.c  -o ${OBJECTDIR}/_ext/1939458138/pic24_uart3.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/1939458138/pic24_uart3.o.d"        -g -omf=coff -I"ProjectHeaders" -I"../../../../Pumpkin/CubeSatKit/PIC24/inc" -I"../../../../Pumpkin/Library/PIC24/Inc" -I"../../../../Pumpkin/Salvo/Inc" -I"../../../../Pumpkin/Salvo/Inc/MCC30" -mlarge-code -mlarge-data -mlarge-scalar -O0 -I"ProjectHeaders" -I"../../../../Pumpkin/CubeSatKit/PIC24/inc" -I"../../../../Pumpkin/Library/PIC24/Inc" -I"../../../../Pumpkin/Salvo/Inc/MCC30" -I"../../../../Pumpkin/Salvo/Inc" -DOSMCC30_LARGE_CM=1 -msmart-io=1 -Wall -msfr-warn=off -finline -Winline
	@${FIXDEPS} "${OBJECTDIR}/_ext/1939458138/pic24_uart3.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/1939458138/pic24_uart3_msg.o: ../../../../Pumpkin/Library/PIC24/Src/pic24_uart3_msg.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1939458138" 
	@${RM} ${OBJECTDIR}/_ext/1939458138/pic24_uart3_msg.o.d 
	@${RM} ${OBJECTDIR}/_ext/1939458138/pic24_uart3_msg.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../../../Pumpkin/Library/PIC24/Src/pic24_uart3_msg.c  -o ${OBJECTDIR}/_ext/1939458138/pic24_uart3_msg.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/1939458138/pic24_uart3_msg.o.d"        -g -omf=coff -I"ProjectHeaders" -I"../../../../Pumpkin/CubeSatKit/PIC24/inc" -I"../../../../Pumpkin/Library/PIC24/Inc" -I"../../../../Pumpkin/Salvo/Inc" -I"../../../../Pumpkin/Salvo/Inc/MCC30" -mlarge-code -mlarge-data -mlarge-scalar -O0 -I"ProjectHeaders" -I"../../../../Pumpkin/CubeSatKit/PIC24/inc" -I"../../../../Pumpkin/Library/PIC24/Inc" -I"../../../../Pumpkin/Salvo/Inc/MCC30" -I"../../../../Pumpkin/Salvo/Inc" -DOSMCC30_LARGE_CM=1 -msmart-io=1 -Wall -msfr-warn=off -finline -Winline
	@${FIXDEPS} "${OBJECTDIR}/_ext/1939458138/pic24_uart3_msg.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/1939458138/pic24_uart3_msg_ts.o: ../../../../Pumpkin/Library/PIC24/Src/pic24_uart3_msg_ts.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1939458138" 
	@${RM} ${OBJECTDIR}/_ext/1939458138/pic24_uart3_msg_ts.o.d 
	@${RM} ${OBJECTDIR}/_ext/1939458138/pic24_uart3_msg_ts.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../../../Pumpkin/Library/PIC24/Src/pic24_uart3_msg_ts.c  -o ${OBJECTDIR}/_ext/1939458138/pic24_uart3_msg_ts.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/1939458138/pic24_uart3_msg_ts.o.d"        -g -omf=coff -I"ProjectHeaders" -I"../../../../Pumpkin/CubeSatKit/PIC24/inc" -I"../../../../Pumpkin/Library/PIC24/Inc" -I"../../../../Pumpkin/Salvo/Inc" -I"../../../../Pumpkin/Salvo/Inc/MCC30" -mlarge-code -mlarge-data -mlarge-scalar -O0 -I"ProjectHeaders" -I"../../../../Pumpkin/CubeSatKit/PIC24/inc" -I"../../../../Pumpkin/Library/PIC24/Inc" -I"../../../../Pumpkin/Salvo/Inc/MCC30" -I"../../../../Pumpkin/Salvo/Inc" -DOSMCC30_LARGE_CM=1 -msmart-io=1 -Wall -msfr-warn=off -finline -Winline
	@${FIXDEPS} "${OBJECTDIR}/_ext/1939458138/pic24_uart3_msg_ts.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/1939458138/pic24_uart4.o: ../../../../Pumpkin/Library/PIC24/Src/pic24_uart4.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1939458138" 
	@${RM} ${OBJECTDIR}/_ext/1939458138/pic24_uart4.o.d 
	@${RM} ${OBJECTDIR}/_ext/1939458138/pic24_uart4.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../../../Pumpkin/Library/PIC24/Src/pic24_uart4.c  -o ${OBJECTDIR}/_ext/1939458138/pic24_uart4.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/1939458138/pic24_uart4.o.d"        -g -omf=coff -I"ProjectHeaders" -I"../../../../Pumpkin/CubeSatKit/PIC24/inc" -I"../../../../Pumpkin/Library/PIC24/Inc" -I"../../../../Pumpkin/Salvo/Inc" -I"../../../../Pumpkin/Salvo/Inc/MCC30" -mlarge-code -mlarge-data -mlarge-scalar -O0 -I"ProjectHeaders" -I"../../../../Pumpkin/CubeSatKit/PIC24/inc" -I"../../../../Pumpkin/Library/PIC24/Inc" -I"../../../../Pumpkin/Salvo/Inc/MCC30" -I"../../../../Pumpkin/Salvo/Inc" -DOSMCC30_LARGE_CM=1 -msmart-io=1 -Wall -msfr-warn=off -finline -Winline
	@${FIXDEPS} "${OBJECTDIR}/_ext/1939458138/pic24_uart4.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/1939458138/pic24_uart4_msg.o: ../../../../Pumpkin/Library/PIC24/Src/pic24_uart4_msg.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1939458138" 
	@${RM} ${OBJECTDIR}/_ext/1939458138/pic24_uart4_msg.o.d 
	@${RM} ${OBJECTDIR}/_ext/1939458138/pic24_uart4_msg.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../../../Pumpkin/Library/PIC24/Src/pic24_uart4_msg.c  -o ${OBJECTDIR}/_ext/1939458138/pic24_uart4_msg.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/1939458138/pic24_uart4_msg.o.d"        -g -omf=coff -I"ProjectHeaders" -I"../../../../Pumpkin/CubeSatKit/PIC24/inc" -I"../../../../Pumpkin/Library/PIC24/Inc" -I"../../../../Pumpkin/Salvo/Inc" -I"../../../../Pumpkin/Salvo/Inc/MCC30" -mlarge-code -mlarge-data -mlarge-scalar -O0 -I"ProjectHeaders" -I"../../../../Pumpkin/CubeSatKit/PIC24/inc" -I"../../../../Pumpkin/Library/PIC24/Inc" -I"../../../../Pumpkin/Salvo/Inc/MCC30" -I"../../../../Pumpkin/Salvo/Inc" -DOSMCC30_LARGE_CM=1 -msmart-io=1 -Wall -msfr-warn=off -finline -Winline
	@${FIXDEPS} "${OBJECTDIR}/_ext/1939458138/pic24_uart4_msg.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/1939458138/pic24_uart4_msg_ts.o: ../../../../Pumpkin/Library/PIC24/Src/pic24_uart4_msg_ts.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1939458138" 
	@${RM} ${OBJECTDIR}/_ext/1939458138/pic24_uart4_msg_ts.o.d 
	@${RM} ${OBJECTDIR}/_ext/1939458138/pic24_uart4_msg_ts.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../../../Pumpkin/Library/PIC24/Src/pic24_uart4_msg_ts.c  -o ${OBJECTDIR}/_ext/1939458138/pic24_uart4_msg_ts.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/1939458138/pic24_uart4_msg_ts.o.d"        -g -omf=coff -I"ProjectHeaders" -I"../../../../Pumpkin/CubeSatKit/PIC24/inc" -I"../../../../Pumpkin/Library/PIC24/Inc" -I"../../../../Pumpkin/Salvo/Inc" -I"../../../../Pumpkin/Salvo/Inc/MCC30" -mlarge-code -mlarge-data -mlarge-scalar -O0 -I"ProjectHeaders" -I"../../../../Pumpkin/CubeSatKit/PIC24/inc" -I"../../../../Pumpkin/Library/PIC24/Inc" -I"../../../../Pumpkin/Salvo/Inc/MCC30" -I"../../../../Pumpkin/Salvo/Inc" -DOSMCC30_LARGE_CM=1 -msmart-io=1 -Wall -msfr-warn=off -finline -Winline
	@${FIXDEPS} "${OBJECTDIR}/_ext/1939458138/pic24_uart4_msg_ts.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/ProjectSources/main.o: ProjectSources/main.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/ProjectSources" 
	@${RM} ${OBJECTDIR}/ProjectSources/main.o.d 
	@${RM} ${OBJECTDIR}/ProjectSources/main.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ProjectSources/main.c  -o ${OBJECTDIR}/ProjectSources/main.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/ProjectSources/main.o.d"        -g -omf=coff -I"ProjectHeaders" -I"../../../../Pumpkin/CubeSatKit/PIC24/inc" -I"../../../../Pumpkin/Library/PIC24/Inc" -I"../../../../Pumpkin/Salvo/Inc" -I"../../../../Pumpkin/Salvo/Inc/MCC30" -mlarge-code -mlarge-data -mlarge-scalar -O0 -I"ProjectHeaders" -I"../../../../Pumpkin/CubeSatKit/PIC24/inc" -I"../../../../Pumpkin/Library/PIC24/Inc" -I"../../../../Pumpkin/Salvo/Inc/MCC30" -I"../../../../Pumpkin/Salvo/Inc" -DOSMCC30_LARGE_CM=1 -msmart-io=1 -Wall -msfr-warn=off -finline -Winline
	@${FIXDEPS} "${OBJECTDIR}/ProjectSources/main.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/ProjectSources/debug_functions.o: ProjectSources/debug_functions.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/ProjectSources" 
	@${RM} ${OBJECTDIR}/ProjectSources/debug_functions.o.d 
	@${RM} ${OBJECTDIR}/ProjectSources/debug_functions.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ProjectSources/debug_functions.c  -o ${OBJECTDIR}/ProjectSources/debug_functions.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/ProjectSources/debug_functions.o.d"        -g -omf=coff -I"ProjectHeaders" -I"../../../../Pumpkin/CubeSatKit/PIC24/inc" -I"../../../../Pumpkin/Library/PIC24/Inc" -I"../../../../Pumpkin/Salvo/Inc" -I"../../../../Pumpkin/Salvo/Inc/MCC30" -mlarge-code -mlarge-data -mlarge-scalar -O0 -I"ProjectHeaders" -I"../../../../Pumpkin/CubeSatKit/PIC24/inc" -I"../../../../Pumpkin/Library/PIC24/Inc" -I"../../../../Pumpkin/Salvo/Inc/MCC30" -I"../../../../Pumpkin/Salvo/Inc" -DOSMCC30_LARGE_CM=1 -msmart-io=1 -Wall -msfr-warn=off -finline -Winline
	@${FIXDEPS} "${OBJECTDIR}/ProjectSources/debug_functions.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/ProjectSources/messagequeues.o: ProjectSources/messagequeues.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/ProjectSources" 
	@${RM} ${OBJECTDIR}/ProjectSources/messagequeues.o.d 
	@${RM} ${OBJECTDIR}/ProjectSources/messagequeues.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ProjectSources/messagequeues.c  -o ${OBJECTDIR}/ProjectSources/messagequeues.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/ProjectSources/messagequeues.o.d"        -g -omf=coff -I"ProjectHeaders" -I"../../../../Pumpkin/CubeSatKit/PIC24/inc" -I"../../../../Pumpkin/Library/PIC24/Inc" -I"../../../../Pumpkin/Salvo/Inc" -I"../../../../Pumpkin/Salvo/Inc/MCC30" -mlarge-code -mlarge-data -mlarge-scalar -O0 -I"ProjectHeaders" -I"../../../../Pumpkin/CubeSatKit/PIC24/inc" -I"../../../../Pumpkin/Library/PIC24/Inc" -I"../../../../Pumpkin/Salvo/Inc/MCC30" -I"../../../../Pumpkin/Salvo/Inc" -DOSMCC30_LARGE_CM=1 -msmart-io=1 -Wall -msfr-warn=off -finline -Winline
	@${FIXDEPS} "${OBJECTDIR}/ProjectSources/messagequeues.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/ProjectSources/task_beacon.o: ProjectSources/task_beacon.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/ProjectSources" 
	@${RM} ${OBJECTDIR}/ProjectSources/task_beacon.o.d 
	@${RM} ${OBJECTDIR}/ProjectSources/task_beacon.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ProjectSources/task_beacon.c  -o ${OBJECTDIR}/ProjectSources/task_beacon.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/ProjectSources/task_beacon.o.d"        -g -omf=coff -I"ProjectHeaders" -I"../../../../Pumpkin/CubeSatKit/PIC24/inc" -I"../../../../Pumpkin/Library/PIC24/Inc" -I"../../../../Pumpkin/Salvo/Inc" -I"../../../../Pumpkin/Salvo/Inc/MCC30" -mlarge-code -mlarge-data -mlarge-scalar -O0 -I"ProjectHeaders" -I"../../../../Pumpkin/CubeSatKit/PIC24/inc" -I"../../../../Pumpkin/Library/PIC24/Inc" -I"../../../../Pumpkin/Salvo/Inc/MCC30" -I"../../../../Pumpkin/Salvo/Inc" -DOSMCC30_LARGE_CM=1 -msmart-io=1 -Wall -msfr-warn=off -finline -Winline
	@${FIXDEPS} "${OBJECTDIR}/ProjectSources/task_beacon.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/ProjectSources/task_radio_listen.o: ProjectSources/task_radio_listen.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/ProjectSources" 
	@${RM} ${OBJECTDIR}/ProjectSources/task_radio_listen.o.d 
	@${RM} ${OBJECTDIR}/ProjectSources/task_radio_listen.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ProjectSources/task_radio_listen.c  -o ${OBJECTDIR}/ProjectSources/task_radio_listen.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/ProjectSources/task_radio_listen.o.d"        -g -omf=coff -I"ProjectHeaders" -I"../../../../Pumpkin/CubeSatKit/PIC24/inc" -I"../../../../Pumpkin/Library/PIC24/Inc" -I"../../../../Pumpkin/Salvo/Inc" -I"../../../../Pumpkin/Salvo/Inc/MCC30" -mlarge-code -mlarge-data -mlarge-scalar -O0 -I"ProjectHeaders" -I"../../../../Pumpkin/CubeSatKit/PIC24/inc" -I"../../../../Pumpkin/Library/PIC24/Inc" -I"../../../../Pumpkin/Salvo/Inc/MCC30" -I"../../../../Pumpkin/Salvo/Inc" -DOSMCC30_LARGE_CM=1 -msmart-io=1 -Wall -msfr-warn=off -finline -Winline
	@${FIXDEPS} "${OBJECTDIR}/ProjectSources/task_radio_listen.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/ProjectSources/task_scheduler.o: ProjectSources/task_scheduler.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/ProjectSources" 
	@${RM} ${OBJECTDIR}/ProjectSources/task_scheduler.o.d 
	@${RM} ${OBJECTDIR}/ProjectSources/task_scheduler.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ProjectSources/task_scheduler.c  -o ${OBJECTDIR}/ProjectSources/task_scheduler.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/ProjectSources/task_scheduler.o.d"        -g -omf=coff -I"ProjectHeaders" -I"../../../../Pumpkin/CubeSatKit/PIC24/inc" -I"../../../../Pumpkin/Library/PIC24/Inc" -I"../../../../Pumpkin/Salvo/Inc" -I"../../../../Pumpkin/Salvo/Inc/MCC30" -mlarge-code -mlarge-data -mlarge-scalar -O0 -I"ProjectHeaders" -I"../../../../Pumpkin/CubeSatKit/PIC24/inc" -I"../../../../Pumpkin/Library/PIC24/Inc" -I"../../../../Pumpkin/Salvo/Inc/MCC30" -I"../../../../Pumpkin/Salvo/Inc" -DOSMCC30_LARGE_CM=1 -msmart-io=1 -Wall -msfr-warn=off -finline -Winline
	@${FIXDEPS} "${OBJECTDIR}/ProjectSources/task_scheduler.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/ProjectSources/task_test.o: ProjectSources/task_test.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/ProjectSources" 
	@${RM} ${OBJECTDIR}/ProjectSources/task_test.o.d 
	@${RM} ${OBJECTDIR}/ProjectSources/task_test.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ProjectSources/task_test.c  -o ${OBJECTDIR}/ProjectSources/task_test.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/ProjectSources/task_test.o.d"        -g -omf=coff -I"ProjectHeaders" -I"../../../../Pumpkin/CubeSatKit/PIC24/inc" -I"../../../../Pumpkin/Library/PIC24/Inc" -I"../../../../Pumpkin/Salvo/Inc" -I"../../../../Pumpkin/Salvo/Inc/MCC30" -mlarge-code -mlarge-data -mlarge-scalar -O0 -I"ProjectHeaders" -I"../../../../Pumpkin/CubeSatKit/PIC24/inc" -I"../../../../Pumpkin/Library/PIC24/Inc" -I"../../../../Pumpkin/Salvo/Inc/MCC30" -I"../../../../Pumpkin/Salvo/Inc" -DOSMCC30_LARGE_CM=1 -msmart-io=1 -Wall -msfr-warn=off -finline -Winline
	@${FIXDEPS} "${OBJECTDIR}/ProjectSources/task_test.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/ProjectSources/init.o: ProjectSources/init.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/ProjectSources" 
	@${RM} ${OBJECTDIR}/ProjectSources/init.o.d 
	@${RM} ${OBJECTDIR}/ProjectSources/init.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ProjectSources/init.c  -o ${OBJECTDIR}/ProjectSources/init.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/ProjectSources/init.o.d"        -g -omf=coff -I"ProjectHeaders" -I"../../../../Pumpkin/CubeSatKit/PIC24/inc" -I"../../../../Pumpkin/Library/PIC24/Inc" -I"../../../../Pumpkin/Salvo/Inc" -I"../../../../Pumpkin/Salvo/Inc/MCC30" -mlarge-code -mlarge-data -mlarge-scalar -O0 -I"ProjectHeaders" -I"../../../../Pumpkin/CubeSatKit/PIC24/inc" -I"../../../../Pumpkin/Library/PIC24/Inc" -I"../../../../Pumpkin/Salvo/Inc/MCC30" -I"../../../../Pumpkin/Salvo/Inc" -DOSMCC30_LARGE_CM=1 -msmart-io=1 -Wall -msfr-warn=off -finline -Winline
	@${FIXDEPS} "${OBJECTDIR}/ProjectSources/init.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/ProjectSources/task_radio_talk.o: ProjectSources/task_radio_talk.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/ProjectSources" 
	@${RM} ${OBJECTDIR}/ProjectSources/task_radio_talk.o.d 
	@${RM} ${OBJECTDIR}/ProjectSources/task_radio_talk.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ProjectSources/task_radio_talk.c  -o ${OBJECTDIR}/ProjectSources/task_radio_talk.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/ProjectSources/task_radio_talk.o.d"        -g -omf=coff -I"ProjectHeaders" -I"../../../../Pumpkin/CubeSatKit/PIC24/inc" -I"../../../../Pumpkin/Library/PIC24/Inc" -I"../../../../Pumpkin/Salvo/Inc" -I"../../../../Pumpkin/Salvo/Inc/MCC30" -mlarge-code -mlarge-data -mlarge-scalar -O0 -I"ProjectHeaders" -I"../../../../Pumpkin/CubeSatKit/PIC24/inc" -I"../../../../Pumpkin/Library/PIC24/Inc" -I"../../../../Pumpkin/Salvo/Inc/MCC30" -I"../../../../Pumpkin/Salvo/Inc" -DOSMCC30_LARGE_CM=1 -msmart-io=1 -Wall -msfr-warn=off -finline -Winline
	@${FIXDEPS} "${OBJECTDIR}/ProjectSources/task_radio_talk.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/_ext/1458030235/salvomem.o: ../../../../Pumpkin/Salvo/Src/salvomem.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1458030235" 
	@${RM} ${OBJECTDIR}/_ext/1458030235/salvomem.o.d 
	@${RM} ${OBJECTDIR}/_ext/1458030235/salvomem.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  ../../../../Pumpkin/Salvo/Src/salvomem.c  -o ${OBJECTDIR}/_ext/1458030235/salvomem.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/1458030235/salvomem.o.d"        -g -omf=coff -I"ProjectHeaders" -I"../../../../Pumpkin/CubeSatKit/PIC24/inc" -I"../../../../Pumpkin/Library/PIC24/Inc" -I"../../../../Pumpkin/Salvo/Inc" -I"../../../../Pumpkin/Salvo/Inc/MCC30" -mlarge-code -mlarge-data -mlarge-scalar -O0 -I"ProjectHeaders" -I"../../../../Pumpkin/CubeSatKit/PIC24/inc" -I"../../../../Pumpkin/Library/PIC24/Inc" -I"../../../../Pumpkin/Salvo/Inc/MCC30" -I"../../../../Pumpkin/Salvo/Inc" -DOSMCC30_LARGE_CM=1 -msmart-io=1 -Wall -msfr-warn=off -finline -Winline
	@${FIXDEPS} "${OBJECTDIR}/_ext/1458030235/salvomem.o.d" $(SILENT)  -rsi ${MP_CC_DIR}../ 
	
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: assemble
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
${OBJECTDIR}/_ext/307288224/salvoportmcc30-lm.o: ../../../../Pumpkin/Salvo/Src/MCC30/salvoportmcc30-lm.s  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/307288224" 
	@${RM} ${OBJECTDIR}/_ext/307288224/salvoportmcc30-lm.o.d 
	@${RM} ${OBJECTDIR}/_ext/307288224/salvoportmcc30-lm.o 
	${MP_CC} $(MP_EXTRA_AS_PRE)  ../../../../Pumpkin/Salvo/Src/MCC30/salvoportmcc30-lm.s  -o ${OBJECTDIR}/_ext/307288224/salvoportmcc30-lm.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -omf=coff -I"ProjectHeaders" -I"../../../../Pumpkin/CubeSatKit/PIC24/inc" -I"../../../../Pumpkin/Library/PIC24/Inc" -I"../../../../Pumpkin/Salvo/Inc" -I"../../../../Pumpkin/Salvo/Inc/MCC30" -Wa,-MD,"${OBJECTDIR}/_ext/307288224/salvoportmcc30-lm.o.d",--defsym=__MPLAB_BUILD=1,--defsym=__ICD2RAM=1,--defsym=__MPLAB_DEBUG=1,--defsym=__DEBUG=1,--defsym=__MPLAB_DEBUGGER_PK3=1,-g,--no-relax$(MP_EXTRA_AS_POST)
	@${FIXDEPS} "${OBJECTDIR}/_ext/307288224/salvoportmcc30-lm.o.d"  $(SILENT)  -rsi ${MP_CC_DIR}../  
	
else
${OBJECTDIR}/_ext/307288224/salvoportmcc30-lm.o: ../../../../Pumpkin/Salvo/Src/MCC30/salvoportmcc30-lm.s  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/307288224" 
	@${RM} ${OBJECTDIR}/_ext/307288224/salvoportmcc30-lm.o.d 
	@${RM} ${OBJECTDIR}/_ext/307288224/salvoportmcc30-lm.o 
	${MP_CC} $(MP_EXTRA_AS_PRE)  ../../../../Pumpkin/Salvo/Src/MCC30/salvoportmcc30-lm.s  -o ${OBJECTDIR}/_ext/307288224/salvoportmcc30-lm.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -omf=coff -I"ProjectHeaders" -I"../../../../Pumpkin/CubeSatKit/PIC24/inc" -I"../../../../Pumpkin/Library/PIC24/Inc" -I"../../../../Pumpkin/Salvo/Inc" -I"../../../../Pumpkin/Salvo/Inc/MCC30" -Wa,-MD,"${OBJECTDIR}/_ext/307288224/salvoportmcc30-lm.o.d",--defsym=__MPLAB_BUILD=1,-g,--no-relax$(MP_EXTRA_AS_POST)
	@${FIXDEPS} "${OBJECTDIR}/_ext/307288224/salvoportmcc30-lm.o.d"  $(SILENT)  -rsi ${MP_CC_DIR}../  
	
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: assemblePreproc
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
else
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: link
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
dist/${CND_CONF}/${IMAGE_TYPE}/Copper2v1-new_lib_build.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk  ../../../../Pumpkin/Salvo/Lib/MCC30-v3/libsalvolmcc30lit.a  ../../../../Program\ Files\ (x86)/Microchip/xc16/v1.26/support/PIC24F/gld/p24FJ256GA110.gld
	@${MKDIR} dist/${CND_CONF}/${IMAGE_TYPE} 
	${MP_CC} $(MP_EXTRA_LD_PRE)  -o dist/${CND_CONF}/${IMAGE_TYPE}/Copper2v1-new_lib_build.${IMAGE_TYPE}.${OUTPUT_SUFFIX}  ${OBJECTFILES_QUOTED_IF_SPACED}    ..\..\..\..\Pumpkin\Salvo\Lib\MCC30-v3\libsalvolmcc30lit.a  -mcpu=$(MP_PROCESSOR_OPTION)        -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -omf=coff -I"ProjectHeaders" -I"../../../../Pumpkin/CubeSatKit/PIC24/inc" -I"../../../../Pumpkin/Library/PIC24/Inc" -I"../../../../Pumpkin/Salvo/Inc" -I"../../../../Pumpkin/Salvo/Inc/MCC30"  -mreserve=data@0x800:0x81F -mreserve=data@0x820:0x821 -mreserve=data@0x822:0x823 -mreserve=data@0x824:0x825 -mreserve=data@0x826:0x84F   -Wl,,--defsym=__MPLAB_BUILD=1,--defsym=__MPLAB_DEBUG=1,--defsym=__DEBUG=1,--defsym=__MPLAB_DEBUGGER_PK3=1,$(MP_LINKER_FILE_OPTION),--heap=0,--check-sections,--data-init,--pack-data,--handles,--isr,--no-gc-sections,--fill-upper=0,--stackguard=16,--no-force-link,--smart-io,-Map="${DISTDIR}/${PROJECTNAME}.${IMAGE_TYPE}.map"$(MP_EXTRA_LD_POST) 
	
else
dist/${CND_CONF}/${IMAGE_TYPE}/Copper2v1-new_lib_build.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk  ../../../../Pumpkin/Salvo/Lib/MCC30-v3/libsalvolmcc30lit.a ../../../../Program\ Files\ (x86)/Microchip/xc16/v1.26/support/PIC24F/gld/p24FJ256GA110.gld
	@${MKDIR} dist/${CND_CONF}/${IMAGE_TYPE} 
	${MP_CC} $(MP_EXTRA_LD_PRE)  -o dist/${CND_CONF}/${IMAGE_TYPE}/Copper2v1-new_lib_build.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX}  ${OBJECTFILES_QUOTED_IF_SPACED}    ..\..\..\..\Pumpkin\Salvo\Lib\MCC30-v3\libsalvolmcc30lit.a  -mcpu=$(MP_PROCESSOR_OPTION)        -omf=coff -I"ProjectHeaders" -I"../../../../Pumpkin/CubeSatKit/PIC24/inc" -I"../../../../Pumpkin/Library/PIC24/Inc" -I"../../../../Pumpkin/Salvo/Inc" -I"../../../../Pumpkin/Salvo/Inc/MCC30" -Wl,,--defsym=__MPLAB_BUILD=1,$(MP_LINKER_FILE_OPTION),--heap=0,--check-sections,--data-init,--pack-data,--handles,--isr,--no-gc-sections,--fill-upper=0,--stackguard=16,--no-force-link,--smart-io,-Map="${DISTDIR}/${PROJECTNAME}.${IMAGE_TYPE}.map"$(MP_EXTRA_LD_POST) 
	${MP_CC_DIR}\\xc16-bin2hex dist/${CND_CONF}/${IMAGE_TYPE}/Copper2v1-new_lib_build.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX} -a  -omf=coff  
	
endif


# Subprojects
.build-subprojects:


# Subprojects
.clean-subprojects:

# Clean Targets
.clean-conf: ${CLEAN_SUBPROJECTS}
	${RM} -r build/XC16
	${RM} -r dist/XC16

# Enable dependency checking
.dep.inc: .depcheck-impl

DEPFILES=$(shell mplabwildcard ${POSSIBLE_DEPFILES})
ifneq (${DEPFILES},)
include ${DEPFILES}
endif
