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
ifeq "$(wildcard nbproject/Makefile-local-C30.mk)" "nbproject/Makefile-local-C30.mk"
include nbproject/Makefile-local-C30.mk
endif
endif

# Environment
MKDIR=gnumkdir -p
RM=rm -f 
MV=mv 
CP=cp 

# Macros
CND_CONF=C30
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
SOURCEFILES_QUOTED_IF_SPACED=../../../../Pumpkin/CubeSatKit/PIC24/src/csk_led.c ../../../../Pumpkin/CubeSatKit/PIC24/src/csk_mhx.c ../../../../Pumpkin/CubeSatKit/PIC24/src/csk_power.c ../../../../Pumpkin/CubeSatKit/PIC24/src/csk_rand.c ../../../../Pumpkin/CubeSatKit/PIC24/src/csk_sd.c ../../../../Pumpkin/CubeSatKit/PIC24/src/csk_usb.c ../../../../Pumpkin/CubeSatKit/PIC24/src/csk_wdt.c ../../../../Pumpkin/CubeSatKit/PIC24/src/effs_thin_mmc_drv_spi1.c ../../../../Pumpkin/CubeSatKit/PIC24/src/csk_io.c ../../../../Pumpkin/Library/PIC24/Src/pic24_uart1.c ../../../../Pumpkin/Library/PIC24/Src/pic24_uart1_msg.c ../../../../Pumpkin/Library/PIC24/Src/pic24_uart1_msg_ts.c ../../../../Pumpkin/Library/PIC24/Src/pic24_uart2.c ../../../../Pumpkin/Library/PIC24/Src/pic24_uart2_msg.c ../../../../Pumpkin/Library/PIC24/Src/pic24_uart2_msg_ts.c ../../../../Pumpkin/Library/PIC24/Src/pic24_uart3.c ../../../../Pumpkin/Library/PIC24/Src/pic24_uart3_msg.c ../../../../Pumpkin/Library/PIC24/Src/pic24_uart3_msg_ts.c ../../../../Pumpkin/Library/PIC24/Src/pic24_uart4.c ../../../../Pumpkin/Library/PIC24/Src/pic24_uart4_msg.c ../../../../Pumpkin/Library/PIC24/Src/pic24_uart4_msg_ts.c ProjectSources/main.c ProjectSources/debug_functions.c ProjectSources/messagequeues.c ProjectSources/task_beacon.c ProjectSources/task_radio_listen.c ProjectSources/task_radio_talk.c ProjectSources/task_scheduler.c ProjectSources/task_test.c ProjectSources/init.c ../../../../Pumpkin/Salvo/Src/salvomem.c

# Object Files Quoted if spaced
OBJECTFILES_QUOTED_IF_SPACED=${OBJECTDIR}/_ext/1443471778/csk_led.o ${OBJECTDIR}/_ext/1443471778/csk_mhx.o ${OBJECTDIR}/_ext/1443471778/csk_power.o ${OBJECTDIR}/_ext/1443471778/csk_rand.o ${OBJECTDIR}/_ext/1443471778/csk_sd.o ${OBJECTDIR}/_ext/1443471778/csk_usb.o ${OBJECTDIR}/_ext/1443471778/csk_wdt.o ${OBJECTDIR}/_ext/1443471778/effs_thin_mmc_drv_spi1.o ${OBJECTDIR}/_ext/1443471778/csk_io.o ${OBJECTDIR}/_ext/1939458138/pic24_uart1.o ${OBJECTDIR}/_ext/1939458138/pic24_uart1_msg.o ${OBJECTDIR}/_ext/1939458138/pic24_uart1_msg_ts.o ${OBJECTDIR}/_ext/1939458138/pic24_uart2.o ${OBJECTDIR}/_ext/1939458138/pic24_uart2_msg.o ${OBJECTDIR}/_ext/1939458138/pic24_uart2_msg_ts.o ${OBJECTDIR}/_ext/1939458138/pic24_uart3.o ${OBJECTDIR}/_ext/1939458138/pic24_uart3_msg.o ${OBJECTDIR}/_ext/1939458138/pic24_uart3_msg_ts.o ${OBJECTDIR}/_ext/1939458138/pic24_uart4.o ${OBJECTDIR}/_ext/1939458138/pic24_uart4_msg.o ${OBJECTDIR}/_ext/1939458138/pic24_uart4_msg_ts.o ${OBJECTDIR}/ProjectSources/main.o ${OBJECTDIR}/ProjectSources/debug_functions.o ${OBJECTDIR}/ProjectSources/messagequeues.o ${OBJECTDIR}/ProjectSources/task_beacon.o ${OBJECTDIR}/ProjectSources/task_radio_listen.o ${OBJECTDIR}/ProjectSources/task_radio_talk.o ${OBJECTDIR}/ProjectSources/task_scheduler.o ${OBJECTDIR}/ProjectSources/task_test.o ${OBJECTDIR}/ProjectSources/init.o ${OBJECTDIR}/_ext/1458030235/salvomem.o
POSSIBLE_DEPFILES=${OBJECTDIR}/_ext/1443471778/csk_led.o.d ${OBJECTDIR}/_ext/1443471778/csk_mhx.o.d ${OBJECTDIR}/_ext/1443471778/csk_power.o.d ${OBJECTDIR}/_ext/1443471778/csk_rand.o.d ${OBJECTDIR}/_ext/1443471778/csk_sd.o.d ${OBJECTDIR}/_ext/1443471778/csk_usb.o.d ${OBJECTDIR}/_ext/1443471778/csk_wdt.o.d ${OBJECTDIR}/_ext/1443471778/effs_thin_mmc_drv_spi1.o.d ${OBJECTDIR}/_ext/1443471778/csk_io.o.d ${OBJECTDIR}/_ext/1939458138/pic24_uart1.o.d ${OBJECTDIR}/_ext/1939458138/pic24_uart1_msg.o.d ${OBJECTDIR}/_ext/1939458138/pic24_uart1_msg_ts.o.d ${OBJECTDIR}/_ext/1939458138/pic24_uart2.o.d ${OBJECTDIR}/_ext/1939458138/pic24_uart2_msg.o.d ${OBJECTDIR}/_ext/1939458138/pic24_uart2_msg_ts.o.d ${OBJECTDIR}/_ext/1939458138/pic24_uart3.o.d ${OBJECTDIR}/_ext/1939458138/pic24_uart3_msg.o.d ${OBJECTDIR}/_ext/1939458138/pic24_uart3_msg_ts.o.d ${OBJECTDIR}/_ext/1939458138/pic24_uart4.o.d ${OBJECTDIR}/_ext/1939458138/pic24_uart4_msg.o.d ${OBJECTDIR}/_ext/1939458138/pic24_uart4_msg_ts.o.d ${OBJECTDIR}/ProjectSources/main.o.d ${OBJECTDIR}/ProjectSources/debug_functions.o.d ${OBJECTDIR}/ProjectSources/messagequeues.o.d ${OBJECTDIR}/ProjectSources/task_beacon.o.d ${OBJECTDIR}/ProjectSources/task_radio_listen.o.d ${OBJECTDIR}/ProjectSources/task_radio_talk.o.d ${OBJECTDIR}/ProjectSources/task_scheduler.o.d ${OBJECTDIR}/ProjectSources/task_test.o.d ${OBJECTDIR}/ProjectSources/init.o.d ${OBJECTDIR}/_ext/1458030235/salvomem.o.d

# Object Files
OBJECTFILES=${OBJECTDIR}/_ext/1443471778/csk_led.o ${OBJECTDIR}/_ext/1443471778/csk_mhx.o ${OBJECTDIR}/_ext/1443471778/csk_power.o ${OBJECTDIR}/_ext/1443471778/csk_rand.o ${OBJECTDIR}/_ext/1443471778/csk_sd.o ${OBJECTDIR}/_ext/1443471778/csk_usb.o ${OBJECTDIR}/_ext/1443471778/csk_wdt.o ${OBJECTDIR}/_ext/1443471778/effs_thin_mmc_drv_spi1.o ${OBJECTDIR}/_ext/1443471778/csk_io.o ${OBJECTDIR}/_ext/1939458138/pic24_uart1.o ${OBJECTDIR}/_ext/1939458138/pic24_uart1_msg.o ${OBJECTDIR}/_ext/1939458138/pic24_uart1_msg_ts.o ${OBJECTDIR}/_ext/1939458138/pic24_uart2.o ${OBJECTDIR}/_ext/1939458138/pic24_uart2_msg.o ${OBJECTDIR}/_ext/1939458138/pic24_uart2_msg_ts.o ${OBJECTDIR}/_ext/1939458138/pic24_uart3.o ${OBJECTDIR}/_ext/1939458138/pic24_uart3_msg.o ${OBJECTDIR}/_ext/1939458138/pic24_uart3_msg_ts.o ${OBJECTDIR}/_ext/1939458138/pic24_uart4.o ${OBJECTDIR}/_ext/1939458138/pic24_uart4_msg.o ${OBJECTDIR}/_ext/1939458138/pic24_uart4_msg_ts.o ${OBJECTDIR}/ProjectSources/main.o ${OBJECTDIR}/ProjectSources/debug_functions.o ${OBJECTDIR}/ProjectSources/messagequeues.o ${OBJECTDIR}/ProjectSources/task_beacon.o ${OBJECTDIR}/ProjectSources/task_radio_listen.o ${OBJECTDIR}/ProjectSources/task_radio_talk.o ${OBJECTDIR}/ProjectSources/task_scheduler.o ${OBJECTDIR}/ProjectSources/task_test.o ${OBJECTDIR}/ProjectSources/init.o ${OBJECTDIR}/_ext/1458030235/salvomem.o

# Source Files
SOURCEFILES=../../../../Pumpkin/CubeSatKit/PIC24/src/csk_led.c ../../../../Pumpkin/CubeSatKit/PIC24/src/csk_mhx.c ../../../../Pumpkin/CubeSatKit/PIC24/src/csk_power.c ../../../../Pumpkin/CubeSatKit/PIC24/src/csk_rand.c ../../../../Pumpkin/CubeSatKit/PIC24/src/csk_sd.c ../../../../Pumpkin/CubeSatKit/PIC24/src/csk_usb.c ../../../../Pumpkin/CubeSatKit/PIC24/src/csk_wdt.c ../../../../Pumpkin/CubeSatKit/PIC24/src/effs_thin_mmc_drv_spi1.c ../../../../Pumpkin/CubeSatKit/PIC24/src/csk_io.c ../../../../Pumpkin/Library/PIC24/Src/pic24_uart1.c ../../../../Pumpkin/Library/PIC24/Src/pic24_uart1_msg.c ../../../../Pumpkin/Library/PIC24/Src/pic24_uart1_msg_ts.c ../../../../Pumpkin/Library/PIC24/Src/pic24_uart2.c ../../../../Pumpkin/Library/PIC24/Src/pic24_uart2_msg.c ../../../../Pumpkin/Library/PIC24/Src/pic24_uart2_msg_ts.c ../../../../Pumpkin/Library/PIC24/Src/pic24_uart3.c ../../../../Pumpkin/Library/PIC24/Src/pic24_uart3_msg.c ../../../../Pumpkin/Library/PIC24/Src/pic24_uart3_msg_ts.c ../../../../Pumpkin/Library/PIC24/Src/pic24_uart4.c ../../../../Pumpkin/Library/PIC24/Src/pic24_uart4_msg.c ../../../../Pumpkin/Library/PIC24/Src/pic24_uart4_msg_ts.c ProjectSources/main.c ProjectSources/debug_functions.c ProjectSources/messagequeues.c ProjectSources/task_beacon.c ProjectSources/task_radio_listen.c ProjectSources/task_radio_talk.c ProjectSources/task_scheduler.c ProjectSources/task_test.c ProjectSources/init.c ../../../../Pumpkin/Salvo/Src/salvomem.c


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
	${MAKE}  -f nbproject/Makefile-C30.mk dist/${CND_CONF}/${IMAGE_TYPE}/Copper2v1-new_lib_build.${IMAGE_TYPE}.${OUTPUT_SUFFIX}

MP_PROCESSOR_OPTION=24FJ256GA110
MP_LINKER_FILE_OPTION=,--script="..\..\..\..\Program Files (x86)\Microchip\xc16\v1.26\support\PIC24F\gld\p24FJ256GA110.gld"
# ------------------------------------------------------------------------------------
# Rules for buildStep: assemble
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
else
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: assembleWithPreprocess
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
else
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: compile
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
${OBJECTDIR}/_ext/1443471778/csk_led.o: ../../../../Pumpkin/CubeSatKit/PIC24/src/csk_led.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1443471778" 
	@${RM} ${OBJECTDIR}/_ext/1443471778/csk_led.o.d 
	@${RM} ${OBJECTDIR}/_ext/1443471778/csk_led.o.ok ${OBJECTDIR}/_ext/1443471778/csk_led.o.err 
	@${RM} ${OBJECTDIR}/_ext/1443471778/csk_led.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1443471778/csk_led.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ -c ${MP_CC} $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1 -omf=coff -x c -c -mcpu=$(MP_PROCESSOR_OPTION) -Wall -I"ProjectHeaders" -I"../../../../Pumpkin/CubeSatKit/PIC24/inc" -I"../../../../Pumpkin/Library/PIC24/Inc" -I"../../../../Pumpkin/Salvo/Inc/MCC30" -I"../../../../Pumpkin/Salvo/Inc" -I"../../../../Program Files (x86)/Microchip/mplabc30/v3.31/support/PIC24F" -msmall-code -msmall-data -msmall-scalar -MMD -MF "${OBJECTDIR}/_ext/1443471778/csk_led.o.d" -o ${OBJECTDIR}/_ext/1443471778/csk_led.o ../../../../Pumpkin/CubeSatKit/PIC24/src/csk_led.c    
	
${OBJECTDIR}/_ext/1443471778/csk_mhx.o: ../../../../Pumpkin/CubeSatKit/PIC24/src/csk_mhx.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1443471778" 
	@${RM} ${OBJECTDIR}/_ext/1443471778/csk_mhx.o.d 
	@${RM} ${OBJECTDIR}/_ext/1443471778/csk_mhx.o.ok ${OBJECTDIR}/_ext/1443471778/csk_mhx.o.err 
	@${RM} ${OBJECTDIR}/_ext/1443471778/csk_mhx.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1443471778/csk_mhx.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ -c ${MP_CC} $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1 -omf=coff -x c -c -mcpu=$(MP_PROCESSOR_OPTION) -Wall -I"ProjectHeaders" -I"../../../../Pumpkin/CubeSatKit/PIC24/inc" -I"../../../../Pumpkin/Library/PIC24/Inc" -I"../../../../Pumpkin/Salvo/Inc/MCC30" -I"../../../../Pumpkin/Salvo/Inc" -I"../../../../Program Files (x86)/Microchip/mplabc30/v3.31/support/PIC24F" -msmall-code -msmall-data -msmall-scalar -MMD -MF "${OBJECTDIR}/_ext/1443471778/csk_mhx.o.d" -o ${OBJECTDIR}/_ext/1443471778/csk_mhx.o ../../../../Pumpkin/CubeSatKit/PIC24/src/csk_mhx.c    
	
${OBJECTDIR}/_ext/1443471778/csk_power.o: ../../../../Pumpkin/CubeSatKit/PIC24/src/csk_power.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1443471778" 
	@${RM} ${OBJECTDIR}/_ext/1443471778/csk_power.o.d 
	@${RM} ${OBJECTDIR}/_ext/1443471778/csk_power.o.ok ${OBJECTDIR}/_ext/1443471778/csk_power.o.err 
	@${RM} ${OBJECTDIR}/_ext/1443471778/csk_power.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1443471778/csk_power.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ -c ${MP_CC} $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1 -omf=coff -x c -c -mcpu=$(MP_PROCESSOR_OPTION) -Wall -I"ProjectHeaders" -I"../../../../Pumpkin/CubeSatKit/PIC24/inc" -I"../../../../Pumpkin/Library/PIC24/Inc" -I"../../../../Pumpkin/Salvo/Inc/MCC30" -I"../../../../Pumpkin/Salvo/Inc" -I"../../../../Program Files (x86)/Microchip/mplabc30/v3.31/support/PIC24F" -msmall-code -msmall-data -msmall-scalar -MMD -MF "${OBJECTDIR}/_ext/1443471778/csk_power.o.d" -o ${OBJECTDIR}/_ext/1443471778/csk_power.o ../../../../Pumpkin/CubeSatKit/PIC24/src/csk_power.c    
	
${OBJECTDIR}/_ext/1443471778/csk_rand.o: ../../../../Pumpkin/CubeSatKit/PIC24/src/csk_rand.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1443471778" 
	@${RM} ${OBJECTDIR}/_ext/1443471778/csk_rand.o.d 
	@${RM} ${OBJECTDIR}/_ext/1443471778/csk_rand.o.ok ${OBJECTDIR}/_ext/1443471778/csk_rand.o.err 
	@${RM} ${OBJECTDIR}/_ext/1443471778/csk_rand.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1443471778/csk_rand.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ -c ${MP_CC} $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1 -omf=coff -x c -c -mcpu=$(MP_PROCESSOR_OPTION) -Wall -I"ProjectHeaders" -I"../../../../Pumpkin/CubeSatKit/PIC24/inc" -I"../../../../Pumpkin/Library/PIC24/Inc" -I"../../../../Pumpkin/Salvo/Inc/MCC30" -I"../../../../Pumpkin/Salvo/Inc" -I"../../../../Program Files (x86)/Microchip/mplabc30/v3.31/support/PIC24F" -msmall-code -msmall-data -msmall-scalar -MMD -MF "${OBJECTDIR}/_ext/1443471778/csk_rand.o.d" -o ${OBJECTDIR}/_ext/1443471778/csk_rand.o ../../../../Pumpkin/CubeSatKit/PIC24/src/csk_rand.c    
	
${OBJECTDIR}/_ext/1443471778/csk_sd.o: ../../../../Pumpkin/CubeSatKit/PIC24/src/csk_sd.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1443471778" 
	@${RM} ${OBJECTDIR}/_ext/1443471778/csk_sd.o.d 
	@${RM} ${OBJECTDIR}/_ext/1443471778/csk_sd.o.ok ${OBJECTDIR}/_ext/1443471778/csk_sd.o.err 
	@${RM} ${OBJECTDIR}/_ext/1443471778/csk_sd.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1443471778/csk_sd.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ -c ${MP_CC} $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1 -omf=coff -x c -c -mcpu=$(MP_PROCESSOR_OPTION) -Wall -I"ProjectHeaders" -I"../../../../Pumpkin/CubeSatKit/PIC24/inc" -I"../../../../Pumpkin/Library/PIC24/Inc" -I"../../../../Pumpkin/Salvo/Inc/MCC30" -I"../../../../Pumpkin/Salvo/Inc" -I"../../../../Program Files (x86)/Microchip/mplabc30/v3.31/support/PIC24F" -msmall-code -msmall-data -msmall-scalar -MMD -MF "${OBJECTDIR}/_ext/1443471778/csk_sd.o.d" -o ${OBJECTDIR}/_ext/1443471778/csk_sd.o ../../../../Pumpkin/CubeSatKit/PIC24/src/csk_sd.c    
	
${OBJECTDIR}/_ext/1443471778/csk_usb.o: ../../../../Pumpkin/CubeSatKit/PIC24/src/csk_usb.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1443471778" 
	@${RM} ${OBJECTDIR}/_ext/1443471778/csk_usb.o.d 
	@${RM} ${OBJECTDIR}/_ext/1443471778/csk_usb.o.ok ${OBJECTDIR}/_ext/1443471778/csk_usb.o.err 
	@${RM} ${OBJECTDIR}/_ext/1443471778/csk_usb.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1443471778/csk_usb.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ -c ${MP_CC} $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1 -omf=coff -x c -c -mcpu=$(MP_PROCESSOR_OPTION) -Wall -I"ProjectHeaders" -I"../../../../Pumpkin/CubeSatKit/PIC24/inc" -I"../../../../Pumpkin/Library/PIC24/Inc" -I"../../../../Pumpkin/Salvo/Inc/MCC30" -I"../../../../Pumpkin/Salvo/Inc" -I"../../../../Program Files (x86)/Microchip/mplabc30/v3.31/support/PIC24F" -msmall-code -msmall-data -msmall-scalar -MMD -MF "${OBJECTDIR}/_ext/1443471778/csk_usb.o.d" -o ${OBJECTDIR}/_ext/1443471778/csk_usb.o ../../../../Pumpkin/CubeSatKit/PIC24/src/csk_usb.c    
	
${OBJECTDIR}/_ext/1443471778/csk_wdt.o: ../../../../Pumpkin/CubeSatKit/PIC24/src/csk_wdt.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1443471778" 
	@${RM} ${OBJECTDIR}/_ext/1443471778/csk_wdt.o.d 
	@${RM} ${OBJECTDIR}/_ext/1443471778/csk_wdt.o.ok ${OBJECTDIR}/_ext/1443471778/csk_wdt.o.err 
	@${RM} ${OBJECTDIR}/_ext/1443471778/csk_wdt.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1443471778/csk_wdt.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ -c ${MP_CC} $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1 -omf=coff -x c -c -mcpu=$(MP_PROCESSOR_OPTION) -Wall -I"ProjectHeaders" -I"../../../../Pumpkin/CubeSatKit/PIC24/inc" -I"../../../../Pumpkin/Library/PIC24/Inc" -I"../../../../Pumpkin/Salvo/Inc/MCC30" -I"../../../../Pumpkin/Salvo/Inc" -I"../../../../Program Files (x86)/Microchip/mplabc30/v3.31/support/PIC24F" -msmall-code -msmall-data -msmall-scalar -MMD -MF "${OBJECTDIR}/_ext/1443471778/csk_wdt.o.d" -o ${OBJECTDIR}/_ext/1443471778/csk_wdt.o ../../../../Pumpkin/CubeSatKit/PIC24/src/csk_wdt.c    
	
${OBJECTDIR}/_ext/1443471778/effs_thin_mmc_drv_spi1.o: ../../../../Pumpkin/CubeSatKit/PIC24/src/effs_thin_mmc_drv_spi1.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1443471778" 
	@${RM} ${OBJECTDIR}/_ext/1443471778/effs_thin_mmc_drv_spi1.o.d 
	@${RM} ${OBJECTDIR}/_ext/1443471778/effs_thin_mmc_drv_spi1.o.ok ${OBJECTDIR}/_ext/1443471778/effs_thin_mmc_drv_spi1.o.err 
	@${RM} ${OBJECTDIR}/_ext/1443471778/effs_thin_mmc_drv_spi1.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1443471778/effs_thin_mmc_drv_spi1.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ -c ${MP_CC} $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1 -omf=coff -x c -c -mcpu=$(MP_PROCESSOR_OPTION) -Wall -I"ProjectHeaders" -I"../../../../Pumpkin/CubeSatKit/PIC24/inc" -I"../../../../Pumpkin/Library/PIC24/Inc" -I"../../../../Pumpkin/Salvo/Inc/MCC30" -I"../../../../Pumpkin/Salvo/Inc" -I"../../../../Program Files (x86)/Microchip/mplabc30/v3.31/support/PIC24F" -msmall-code -msmall-data -msmall-scalar -MMD -MF "${OBJECTDIR}/_ext/1443471778/effs_thin_mmc_drv_spi1.o.d" -o ${OBJECTDIR}/_ext/1443471778/effs_thin_mmc_drv_spi1.o ../../../../Pumpkin/CubeSatKit/PIC24/src/effs_thin_mmc_drv_spi1.c    
	
${OBJECTDIR}/_ext/1443471778/csk_io.o: ../../../../Pumpkin/CubeSatKit/PIC24/src/csk_io.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1443471778" 
	@${RM} ${OBJECTDIR}/_ext/1443471778/csk_io.o.d 
	@${RM} ${OBJECTDIR}/_ext/1443471778/csk_io.o.ok ${OBJECTDIR}/_ext/1443471778/csk_io.o.err 
	@${RM} ${OBJECTDIR}/_ext/1443471778/csk_io.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1443471778/csk_io.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ -c ${MP_CC} $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1 -omf=coff -x c -c -mcpu=$(MP_PROCESSOR_OPTION) -Wall -I"ProjectHeaders" -I"../../../../Pumpkin/CubeSatKit/PIC24/inc" -I"../../../../Pumpkin/Library/PIC24/Inc" -I"../../../../Pumpkin/Salvo/Inc/MCC30" -I"../../../../Pumpkin/Salvo/Inc" -I"../../../../Program Files (x86)/Microchip/mplabc30/v3.31/support/PIC24F" -msmall-code -msmall-data -msmall-scalar -MMD -MF "${OBJECTDIR}/_ext/1443471778/csk_io.o.d" -o ${OBJECTDIR}/_ext/1443471778/csk_io.o ../../../../Pumpkin/CubeSatKit/PIC24/src/csk_io.c    
	
${OBJECTDIR}/_ext/1939458138/pic24_uart1.o: ../../../../Pumpkin/Library/PIC24/Src/pic24_uart1.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1939458138" 
	@${RM} ${OBJECTDIR}/_ext/1939458138/pic24_uart1.o.d 
	@${RM} ${OBJECTDIR}/_ext/1939458138/pic24_uart1.o.ok ${OBJECTDIR}/_ext/1939458138/pic24_uart1.o.err 
	@${RM} ${OBJECTDIR}/_ext/1939458138/pic24_uart1.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1939458138/pic24_uart1.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ -c ${MP_CC} $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1 -omf=coff -x c -c -mcpu=$(MP_PROCESSOR_OPTION) -Wall -I"ProjectHeaders" -I"../../../../Pumpkin/CubeSatKit/PIC24/inc" -I"../../../../Pumpkin/Library/PIC24/Inc" -I"../../../../Pumpkin/Salvo/Inc/MCC30" -I"../../../../Pumpkin/Salvo/Inc" -I"../../../../Program Files (x86)/Microchip/mplabc30/v3.31/support/PIC24F" -msmall-code -msmall-data -msmall-scalar -MMD -MF "${OBJECTDIR}/_ext/1939458138/pic24_uart1.o.d" -o ${OBJECTDIR}/_ext/1939458138/pic24_uart1.o ../../../../Pumpkin/Library/PIC24/Src/pic24_uart1.c    
	
${OBJECTDIR}/_ext/1939458138/pic24_uart1_msg.o: ../../../../Pumpkin/Library/PIC24/Src/pic24_uart1_msg.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1939458138" 
	@${RM} ${OBJECTDIR}/_ext/1939458138/pic24_uart1_msg.o.d 
	@${RM} ${OBJECTDIR}/_ext/1939458138/pic24_uart1_msg.o.ok ${OBJECTDIR}/_ext/1939458138/pic24_uart1_msg.o.err 
	@${RM} ${OBJECTDIR}/_ext/1939458138/pic24_uart1_msg.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1939458138/pic24_uart1_msg.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ -c ${MP_CC} $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1 -omf=coff -x c -c -mcpu=$(MP_PROCESSOR_OPTION) -Wall -I"ProjectHeaders" -I"../../../../Pumpkin/CubeSatKit/PIC24/inc" -I"../../../../Pumpkin/Library/PIC24/Inc" -I"../../../../Pumpkin/Salvo/Inc/MCC30" -I"../../../../Pumpkin/Salvo/Inc" -I"../../../../Program Files (x86)/Microchip/mplabc30/v3.31/support/PIC24F" -msmall-code -msmall-data -msmall-scalar -MMD -MF "${OBJECTDIR}/_ext/1939458138/pic24_uart1_msg.o.d" -o ${OBJECTDIR}/_ext/1939458138/pic24_uart1_msg.o ../../../../Pumpkin/Library/PIC24/Src/pic24_uart1_msg.c    
	
${OBJECTDIR}/_ext/1939458138/pic24_uart1_msg_ts.o: ../../../../Pumpkin/Library/PIC24/Src/pic24_uart1_msg_ts.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1939458138" 
	@${RM} ${OBJECTDIR}/_ext/1939458138/pic24_uart1_msg_ts.o.d 
	@${RM} ${OBJECTDIR}/_ext/1939458138/pic24_uart1_msg_ts.o.ok ${OBJECTDIR}/_ext/1939458138/pic24_uart1_msg_ts.o.err 
	@${RM} ${OBJECTDIR}/_ext/1939458138/pic24_uart1_msg_ts.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1939458138/pic24_uart1_msg_ts.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ -c ${MP_CC} $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1 -omf=coff -x c -c -mcpu=$(MP_PROCESSOR_OPTION) -Wall -I"ProjectHeaders" -I"../../../../Pumpkin/CubeSatKit/PIC24/inc" -I"../../../../Pumpkin/Library/PIC24/Inc" -I"../../../../Pumpkin/Salvo/Inc/MCC30" -I"../../../../Pumpkin/Salvo/Inc" -I"../../../../Program Files (x86)/Microchip/mplabc30/v3.31/support/PIC24F" -msmall-code -msmall-data -msmall-scalar -MMD -MF "${OBJECTDIR}/_ext/1939458138/pic24_uart1_msg_ts.o.d" -o ${OBJECTDIR}/_ext/1939458138/pic24_uart1_msg_ts.o ../../../../Pumpkin/Library/PIC24/Src/pic24_uart1_msg_ts.c    
	
${OBJECTDIR}/_ext/1939458138/pic24_uart2.o: ../../../../Pumpkin/Library/PIC24/Src/pic24_uart2.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1939458138" 
	@${RM} ${OBJECTDIR}/_ext/1939458138/pic24_uart2.o.d 
	@${RM} ${OBJECTDIR}/_ext/1939458138/pic24_uart2.o.ok ${OBJECTDIR}/_ext/1939458138/pic24_uart2.o.err 
	@${RM} ${OBJECTDIR}/_ext/1939458138/pic24_uart2.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1939458138/pic24_uart2.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ -c ${MP_CC} $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1 -omf=coff -x c -c -mcpu=$(MP_PROCESSOR_OPTION) -Wall -I"ProjectHeaders" -I"../../../../Pumpkin/CubeSatKit/PIC24/inc" -I"../../../../Pumpkin/Library/PIC24/Inc" -I"../../../../Pumpkin/Salvo/Inc/MCC30" -I"../../../../Pumpkin/Salvo/Inc" -I"../../../../Program Files (x86)/Microchip/mplabc30/v3.31/support/PIC24F" -msmall-code -msmall-data -msmall-scalar -MMD -MF "${OBJECTDIR}/_ext/1939458138/pic24_uart2.o.d" -o ${OBJECTDIR}/_ext/1939458138/pic24_uart2.o ../../../../Pumpkin/Library/PIC24/Src/pic24_uart2.c    
	
${OBJECTDIR}/_ext/1939458138/pic24_uart2_msg.o: ../../../../Pumpkin/Library/PIC24/Src/pic24_uart2_msg.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1939458138" 
	@${RM} ${OBJECTDIR}/_ext/1939458138/pic24_uart2_msg.o.d 
	@${RM} ${OBJECTDIR}/_ext/1939458138/pic24_uart2_msg.o.ok ${OBJECTDIR}/_ext/1939458138/pic24_uart2_msg.o.err 
	@${RM} ${OBJECTDIR}/_ext/1939458138/pic24_uart2_msg.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1939458138/pic24_uart2_msg.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ -c ${MP_CC} $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1 -omf=coff -x c -c -mcpu=$(MP_PROCESSOR_OPTION) -Wall -I"ProjectHeaders" -I"../../../../Pumpkin/CubeSatKit/PIC24/inc" -I"../../../../Pumpkin/Library/PIC24/Inc" -I"../../../../Pumpkin/Salvo/Inc/MCC30" -I"../../../../Pumpkin/Salvo/Inc" -I"../../../../Program Files (x86)/Microchip/mplabc30/v3.31/support/PIC24F" -msmall-code -msmall-data -msmall-scalar -MMD -MF "${OBJECTDIR}/_ext/1939458138/pic24_uart2_msg.o.d" -o ${OBJECTDIR}/_ext/1939458138/pic24_uart2_msg.o ../../../../Pumpkin/Library/PIC24/Src/pic24_uart2_msg.c    
	
${OBJECTDIR}/_ext/1939458138/pic24_uart2_msg_ts.o: ../../../../Pumpkin/Library/PIC24/Src/pic24_uart2_msg_ts.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1939458138" 
	@${RM} ${OBJECTDIR}/_ext/1939458138/pic24_uart2_msg_ts.o.d 
	@${RM} ${OBJECTDIR}/_ext/1939458138/pic24_uart2_msg_ts.o.ok ${OBJECTDIR}/_ext/1939458138/pic24_uart2_msg_ts.o.err 
	@${RM} ${OBJECTDIR}/_ext/1939458138/pic24_uart2_msg_ts.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1939458138/pic24_uart2_msg_ts.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ -c ${MP_CC} $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1 -omf=coff -x c -c -mcpu=$(MP_PROCESSOR_OPTION) -Wall -I"ProjectHeaders" -I"../../../../Pumpkin/CubeSatKit/PIC24/inc" -I"../../../../Pumpkin/Library/PIC24/Inc" -I"../../../../Pumpkin/Salvo/Inc/MCC30" -I"../../../../Pumpkin/Salvo/Inc" -I"../../../../Program Files (x86)/Microchip/mplabc30/v3.31/support/PIC24F" -msmall-code -msmall-data -msmall-scalar -MMD -MF "${OBJECTDIR}/_ext/1939458138/pic24_uart2_msg_ts.o.d" -o ${OBJECTDIR}/_ext/1939458138/pic24_uart2_msg_ts.o ../../../../Pumpkin/Library/PIC24/Src/pic24_uart2_msg_ts.c    
	
${OBJECTDIR}/_ext/1939458138/pic24_uart3.o: ../../../../Pumpkin/Library/PIC24/Src/pic24_uart3.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1939458138" 
	@${RM} ${OBJECTDIR}/_ext/1939458138/pic24_uart3.o.d 
	@${RM} ${OBJECTDIR}/_ext/1939458138/pic24_uart3.o.ok ${OBJECTDIR}/_ext/1939458138/pic24_uart3.o.err 
	@${RM} ${OBJECTDIR}/_ext/1939458138/pic24_uart3.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1939458138/pic24_uart3.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ -c ${MP_CC} $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1 -omf=coff -x c -c -mcpu=$(MP_PROCESSOR_OPTION) -Wall -I"ProjectHeaders" -I"../../../../Pumpkin/CubeSatKit/PIC24/inc" -I"../../../../Pumpkin/Library/PIC24/Inc" -I"../../../../Pumpkin/Salvo/Inc/MCC30" -I"../../../../Pumpkin/Salvo/Inc" -I"../../../../Program Files (x86)/Microchip/mplabc30/v3.31/support/PIC24F" -msmall-code -msmall-data -msmall-scalar -MMD -MF "${OBJECTDIR}/_ext/1939458138/pic24_uart3.o.d" -o ${OBJECTDIR}/_ext/1939458138/pic24_uart3.o ../../../../Pumpkin/Library/PIC24/Src/pic24_uart3.c    
	
${OBJECTDIR}/_ext/1939458138/pic24_uart3_msg.o: ../../../../Pumpkin/Library/PIC24/Src/pic24_uart3_msg.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1939458138" 
	@${RM} ${OBJECTDIR}/_ext/1939458138/pic24_uart3_msg.o.d 
	@${RM} ${OBJECTDIR}/_ext/1939458138/pic24_uart3_msg.o.ok ${OBJECTDIR}/_ext/1939458138/pic24_uart3_msg.o.err 
	@${RM} ${OBJECTDIR}/_ext/1939458138/pic24_uart3_msg.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1939458138/pic24_uart3_msg.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ -c ${MP_CC} $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1 -omf=coff -x c -c -mcpu=$(MP_PROCESSOR_OPTION) -Wall -I"ProjectHeaders" -I"../../../../Pumpkin/CubeSatKit/PIC24/inc" -I"../../../../Pumpkin/Library/PIC24/Inc" -I"../../../../Pumpkin/Salvo/Inc/MCC30" -I"../../../../Pumpkin/Salvo/Inc" -I"../../../../Program Files (x86)/Microchip/mplabc30/v3.31/support/PIC24F" -msmall-code -msmall-data -msmall-scalar -MMD -MF "${OBJECTDIR}/_ext/1939458138/pic24_uart3_msg.o.d" -o ${OBJECTDIR}/_ext/1939458138/pic24_uart3_msg.o ../../../../Pumpkin/Library/PIC24/Src/pic24_uart3_msg.c    
	
${OBJECTDIR}/_ext/1939458138/pic24_uart3_msg_ts.o: ../../../../Pumpkin/Library/PIC24/Src/pic24_uart3_msg_ts.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1939458138" 
	@${RM} ${OBJECTDIR}/_ext/1939458138/pic24_uart3_msg_ts.o.d 
	@${RM} ${OBJECTDIR}/_ext/1939458138/pic24_uart3_msg_ts.o.ok ${OBJECTDIR}/_ext/1939458138/pic24_uart3_msg_ts.o.err 
	@${RM} ${OBJECTDIR}/_ext/1939458138/pic24_uart3_msg_ts.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1939458138/pic24_uart3_msg_ts.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ -c ${MP_CC} $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1 -omf=coff -x c -c -mcpu=$(MP_PROCESSOR_OPTION) -Wall -I"ProjectHeaders" -I"../../../../Pumpkin/CubeSatKit/PIC24/inc" -I"../../../../Pumpkin/Library/PIC24/Inc" -I"../../../../Pumpkin/Salvo/Inc/MCC30" -I"../../../../Pumpkin/Salvo/Inc" -I"../../../../Program Files (x86)/Microchip/mplabc30/v3.31/support/PIC24F" -msmall-code -msmall-data -msmall-scalar -MMD -MF "${OBJECTDIR}/_ext/1939458138/pic24_uart3_msg_ts.o.d" -o ${OBJECTDIR}/_ext/1939458138/pic24_uart3_msg_ts.o ../../../../Pumpkin/Library/PIC24/Src/pic24_uart3_msg_ts.c    
	
${OBJECTDIR}/_ext/1939458138/pic24_uart4.o: ../../../../Pumpkin/Library/PIC24/Src/pic24_uart4.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1939458138" 
	@${RM} ${OBJECTDIR}/_ext/1939458138/pic24_uart4.o.d 
	@${RM} ${OBJECTDIR}/_ext/1939458138/pic24_uart4.o.ok ${OBJECTDIR}/_ext/1939458138/pic24_uart4.o.err 
	@${RM} ${OBJECTDIR}/_ext/1939458138/pic24_uart4.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1939458138/pic24_uart4.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ -c ${MP_CC} $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1 -omf=coff -x c -c -mcpu=$(MP_PROCESSOR_OPTION) -Wall -I"ProjectHeaders" -I"../../../../Pumpkin/CubeSatKit/PIC24/inc" -I"../../../../Pumpkin/Library/PIC24/Inc" -I"../../../../Pumpkin/Salvo/Inc/MCC30" -I"../../../../Pumpkin/Salvo/Inc" -I"../../../../Program Files (x86)/Microchip/mplabc30/v3.31/support/PIC24F" -msmall-code -msmall-data -msmall-scalar -MMD -MF "${OBJECTDIR}/_ext/1939458138/pic24_uart4.o.d" -o ${OBJECTDIR}/_ext/1939458138/pic24_uart4.o ../../../../Pumpkin/Library/PIC24/Src/pic24_uart4.c    
	
${OBJECTDIR}/_ext/1939458138/pic24_uart4_msg.o: ../../../../Pumpkin/Library/PIC24/Src/pic24_uart4_msg.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1939458138" 
	@${RM} ${OBJECTDIR}/_ext/1939458138/pic24_uart4_msg.o.d 
	@${RM} ${OBJECTDIR}/_ext/1939458138/pic24_uart4_msg.o.ok ${OBJECTDIR}/_ext/1939458138/pic24_uart4_msg.o.err 
	@${RM} ${OBJECTDIR}/_ext/1939458138/pic24_uart4_msg.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1939458138/pic24_uart4_msg.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ -c ${MP_CC} $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1 -omf=coff -x c -c -mcpu=$(MP_PROCESSOR_OPTION) -Wall -I"ProjectHeaders" -I"../../../../Pumpkin/CubeSatKit/PIC24/inc" -I"../../../../Pumpkin/Library/PIC24/Inc" -I"../../../../Pumpkin/Salvo/Inc/MCC30" -I"../../../../Pumpkin/Salvo/Inc" -I"../../../../Program Files (x86)/Microchip/mplabc30/v3.31/support/PIC24F" -msmall-code -msmall-data -msmall-scalar -MMD -MF "${OBJECTDIR}/_ext/1939458138/pic24_uart4_msg.o.d" -o ${OBJECTDIR}/_ext/1939458138/pic24_uart4_msg.o ../../../../Pumpkin/Library/PIC24/Src/pic24_uart4_msg.c    
	
${OBJECTDIR}/_ext/1939458138/pic24_uart4_msg_ts.o: ../../../../Pumpkin/Library/PIC24/Src/pic24_uart4_msg_ts.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1939458138" 
	@${RM} ${OBJECTDIR}/_ext/1939458138/pic24_uart4_msg_ts.o.d 
	@${RM} ${OBJECTDIR}/_ext/1939458138/pic24_uart4_msg_ts.o.ok ${OBJECTDIR}/_ext/1939458138/pic24_uart4_msg_ts.o.err 
	@${RM} ${OBJECTDIR}/_ext/1939458138/pic24_uart4_msg_ts.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1939458138/pic24_uart4_msg_ts.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ -c ${MP_CC} $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1 -omf=coff -x c -c -mcpu=$(MP_PROCESSOR_OPTION) -Wall -I"ProjectHeaders" -I"../../../../Pumpkin/CubeSatKit/PIC24/inc" -I"../../../../Pumpkin/Library/PIC24/Inc" -I"../../../../Pumpkin/Salvo/Inc/MCC30" -I"../../../../Pumpkin/Salvo/Inc" -I"../../../../Program Files (x86)/Microchip/mplabc30/v3.31/support/PIC24F" -msmall-code -msmall-data -msmall-scalar -MMD -MF "${OBJECTDIR}/_ext/1939458138/pic24_uart4_msg_ts.o.d" -o ${OBJECTDIR}/_ext/1939458138/pic24_uart4_msg_ts.o ../../../../Pumpkin/Library/PIC24/Src/pic24_uart4_msg_ts.c    
	
${OBJECTDIR}/ProjectSources/main.o: ProjectSources/main.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/ProjectSources" 
	@${RM} ${OBJECTDIR}/ProjectSources/main.o.d 
	@${RM} ${OBJECTDIR}/ProjectSources/main.o.ok ${OBJECTDIR}/ProjectSources/main.o.err 
	@${RM} ${OBJECTDIR}/ProjectSources/main.o 
	@${FIXDEPS} "${OBJECTDIR}/ProjectSources/main.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ -c ${MP_CC} $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1 -omf=coff -x c -c -mcpu=$(MP_PROCESSOR_OPTION) -Wall -I"ProjectHeaders" -I"../../../../Pumpkin/CubeSatKit/PIC24/inc" -I"../../../../Pumpkin/Library/PIC24/Inc" -I"../../../../Pumpkin/Salvo/Inc/MCC30" -I"../../../../Pumpkin/Salvo/Inc" -I"../../../../Program Files (x86)/Microchip/mplabc30/v3.31/support/PIC24F" -msmall-code -msmall-data -msmall-scalar -MMD -MF "${OBJECTDIR}/ProjectSources/main.o.d" -o ${OBJECTDIR}/ProjectSources/main.o ProjectSources/main.c    
	
${OBJECTDIR}/ProjectSources/debug_functions.o: ProjectSources/debug_functions.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/ProjectSources" 
	@${RM} ${OBJECTDIR}/ProjectSources/debug_functions.o.d 
	@${RM} ${OBJECTDIR}/ProjectSources/debug_functions.o.ok ${OBJECTDIR}/ProjectSources/debug_functions.o.err 
	@${RM} ${OBJECTDIR}/ProjectSources/debug_functions.o 
	@${FIXDEPS} "${OBJECTDIR}/ProjectSources/debug_functions.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ -c ${MP_CC} $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1 -omf=coff -x c -c -mcpu=$(MP_PROCESSOR_OPTION) -Wall -I"ProjectHeaders" -I"../../../../Pumpkin/CubeSatKit/PIC24/inc" -I"../../../../Pumpkin/Library/PIC24/Inc" -I"../../../../Pumpkin/Salvo/Inc/MCC30" -I"../../../../Pumpkin/Salvo/Inc" -I"../../../../Program Files (x86)/Microchip/mplabc30/v3.31/support/PIC24F" -msmall-code -msmall-data -msmall-scalar -MMD -MF "${OBJECTDIR}/ProjectSources/debug_functions.o.d" -o ${OBJECTDIR}/ProjectSources/debug_functions.o ProjectSources/debug_functions.c    
	
${OBJECTDIR}/ProjectSources/messagequeues.o: ProjectSources/messagequeues.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/ProjectSources" 
	@${RM} ${OBJECTDIR}/ProjectSources/messagequeues.o.d 
	@${RM} ${OBJECTDIR}/ProjectSources/messagequeues.o.ok ${OBJECTDIR}/ProjectSources/messagequeues.o.err 
	@${RM} ${OBJECTDIR}/ProjectSources/messagequeues.o 
	@${FIXDEPS} "${OBJECTDIR}/ProjectSources/messagequeues.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ -c ${MP_CC} $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1 -omf=coff -x c -c -mcpu=$(MP_PROCESSOR_OPTION) -Wall -I"ProjectHeaders" -I"../../../../Pumpkin/CubeSatKit/PIC24/inc" -I"../../../../Pumpkin/Library/PIC24/Inc" -I"../../../../Pumpkin/Salvo/Inc/MCC30" -I"../../../../Pumpkin/Salvo/Inc" -I"../../../../Program Files (x86)/Microchip/mplabc30/v3.31/support/PIC24F" -msmall-code -msmall-data -msmall-scalar -MMD -MF "${OBJECTDIR}/ProjectSources/messagequeues.o.d" -o ${OBJECTDIR}/ProjectSources/messagequeues.o ProjectSources/messagequeues.c    
	
${OBJECTDIR}/ProjectSources/task_beacon.o: ProjectSources/task_beacon.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/ProjectSources" 
	@${RM} ${OBJECTDIR}/ProjectSources/task_beacon.o.d 
	@${RM} ${OBJECTDIR}/ProjectSources/task_beacon.o.ok ${OBJECTDIR}/ProjectSources/task_beacon.o.err 
	@${RM} ${OBJECTDIR}/ProjectSources/task_beacon.o 
	@${FIXDEPS} "${OBJECTDIR}/ProjectSources/task_beacon.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ -c ${MP_CC} $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1 -omf=coff -x c -c -mcpu=$(MP_PROCESSOR_OPTION) -Wall -I"ProjectHeaders" -I"../../../../Pumpkin/CubeSatKit/PIC24/inc" -I"../../../../Pumpkin/Library/PIC24/Inc" -I"../../../../Pumpkin/Salvo/Inc/MCC30" -I"../../../../Pumpkin/Salvo/Inc" -I"../../../../Program Files (x86)/Microchip/mplabc30/v3.31/support/PIC24F" -msmall-code -msmall-data -msmall-scalar -MMD -MF "${OBJECTDIR}/ProjectSources/task_beacon.o.d" -o ${OBJECTDIR}/ProjectSources/task_beacon.o ProjectSources/task_beacon.c    
	
${OBJECTDIR}/ProjectSources/task_radio_listen.o: ProjectSources/task_radio_listen.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/ProjectSources" 
	@${RM} ${OBJECTDIR}/ProjectSources/task_radio_listen.o.d 
	@${RM} ${OBJECTDIR}/ProjectSources/task_radio_listen.o.ok ${OBJECTDIR}/ProjectSources/task_radio_listen.o.err 
	@${RM} ${OBJECTDIR}/ProjectSources/task_radio_listen.o 
	@${FIXDEPS} "${OBJECTDIR}/ProjectSources/task_radio_listen.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ -c ${MP_CC} $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1 -omf=coff -x c -c -mcpu=$(MP_PROCESSOR_OPTION) -Wall -I"ProjectHeaders" -I"../../../../Pumpkin/CubeSatKit/PIC24/inc" -I"../../../../Pumpkin/Library/PIC24/Inc" -I"../../../../Pumpkin/Salvo/Inc/MCC30" -I"../../../../Pumpkin/Salvo/Inc" -I"../../../../Program Files (x86)/Microchip/mplabc30/v3.31/support/PIC24F" -msmall-code -msmall-data -msmall-scalar -MMD -MF "${OBJECTDIR}/ProjectSources/task_radio_listen.o.d" -o ${OBJECTDIR}/ProjectSources/task_radio_listen.o ProjectSources/task_radio_listen.c    
	
${OBJECTDIR}/ProjectSources/task_radio_talk.o: ProjectSources/task_radio_talk.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/ProjectSources" 
	@${RM} ${OBJECTDIR}/ProjectSources/task_radio_talk.o.d 
	@${RM} ${OBJECTDIR}/ProjectSources/task_radio_talk.o.ok ${OBJECTDIR}/ProjectSources/task_radio_talk.o.err 
	@${RM} ${OBJECTDIR}/ProjectSources/task_radio_talk.o 
	@${FIXDEPS} "${OBJECTDIR}/ProjectSources/task_radio_talk.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ -c ${MP_CC} $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1 -omf=coff -x c -c -mcpu=$(MP_PROCESSOR_OPTION) -Wall -I"ProjectHeaders" -I"../../../../Pumpkin/CubeSatKit/PIC24/inc" -I"../../../../Pumpkin/Library/PIC24/Inc" -I"../../../../Pumpkin/Salvo/Inc/MCC30" -I"../../../../Pumpkin/Salvo/Inc" -I"../../../../Program Files (x86)/Microchip/mplabc30/v3.31/support/PIC24F" -msmall-code -msmall-data -msmall-scalar -MMD -MF "${OBJECTDIR}/ProjectSources/task_radio_talk.o.d" -o ${OBJECTDIR}/ProjectSources/task_radio_talk.o ProjectSources/task_radio_talk.c    
	
${OBJECTDIR}/ProjectSources/task_scheduler.o: ProjectSources/task_scheduler.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/ProjectSources" 
	@${RM} ${OBJECTDIR}/ProjectSources/task_scheduler.o.d 
	@${RM} ${OBJECTDIR}/ProjectSources/task_scheduler.o.ok ${OBJECTDIR}/ProjectSources/task_scheduler.o.err 
	@${RM} ${OBJECTDIR}/ProjectSources/task_scheduler.o 
	@${FIXDEPS} "${OBJECTDIR}/ProjectSources/task_scheduler.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ -c ${MP_CC} $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1 -omf=coff -x c -c -mcpu=$(MP_PROCESSOR_OPTION) -Wall -I"ProjectHeaders" -I"../../../../Pumpkin/CubeSatKit/PIC24/inc" -I"../../../../Pumpkin/Library/PIC24/Inc" -I"../../../../Pumpkin/Salvo/Inc/MCC30" -I"../../../../Pumpkin/Salvo/Inc" -I"../../../../Program Files (x86)/Microchip/mplabc30/v3.31/support/PIC24F" -msmall-code -msmall-data -msmall-scalar -MMD -MF "${OBJECTDIR}/ProjectSources/task_scheduler.o.d" -o ${OBJECTDIR}/ProjectSources/task_scheduler.o ProjectSources/task_scheduler.c    
	
${OBJECTDIR}/ProjectSources/task_test.o: ProjectSources/task_test.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/ProjectSources" 
	@${RM} ${OBJECTDIR}/ProjectSources/task_test.o.d 
	@${RM} ${OBJECTDIR}/ProjectSources/task_test.o.ok ${OBJECTDIR}/ProjectSources/task_test.o.err 
	@${RM} ${OBJECTDIR}/ProjectSources/task_test.o 
	@${FIXDEPS} "${OBJECTDIR}/ProjectSources/task_test.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ -c ${MP_CC} $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1 -omf=coff -x c -c -mcpu=$(MP_PROCESSOR_OPTION) -Wall -I"ProjectHeaders" -I"../../../../Pumpkin/CubeSatKit/PIC24/inc" -I"../../../../Pumpkin/Library/PIC24/Inc" -I"../../../../Pumpkin/Salvo/Inc/MCC30" -I"../../../../Pumpkin/Salvo/Inc" -I"../../../../Program Files (x86)/Microchip/mplabc30/v3.31/support/PIC24F" -msmall-code -msmall-data -msmall-scalar -MMD -MF "${OBJECTDIR}/ProjectSources/task_test.o.d" -o ${OBJECTDIR}/ProjectSources/task_test.o ProjectSources/task_test.c    
	
${OBJECTDIR}/ProjectSources/init.o: ProjectSources/init.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/ProjectSources" 
	@${RM} ${OBJECTDIR}/ProjectSources/init.o.d 
	@${RM} ${OBJECTDIR}/ProjectSources/init.o.ok ${OBJECTDIR}/ProjectSources/init.o.err 
	@${RM} ${OBJECTDIR}/ProjectSources/init.o 
	@${FIXDEPS} "${OBJECTDIR}/ProjectSources/init.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ -c ${MP_CC} $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1 -omf=coff -x c -c -mcpu=$(MP_PROCESSOR_OPTION) -Wall -I"ProjectHeaders" -I"../../../../Pumpkin/CubeSatKit/PIC24/inc" -I"../../../../Pumpkin/Library/PIC24/Inc" -I"../../../../Pumpkin/Salvo/Inc/MCC30" -I"../../../../Pumpkin/Salvo/Inc" -I"../../../../Program Files (x86)/Microchip/mplabc30/v3.31/support/PIC24F" -msmall-code -msmall-data -msmall-scalar -MMD -MF "${OBJECTDIR}/ProjectSources/init.o.d" -o ${OBJECTDIR}/ProjectSources/init.o ProjectSources/init.c    
	
${OBJECTDIR}/_ext/1458030235/salvomem.o: ../../../../Pumpkin/Salvo/Src/salvomem.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1458030235" 
	@${RM} ${OBJECTDIR}/_ext/1458030235/salvomem.o.d 
	@${RM} ${OBJECTDIR}/_ext/1458030235/salvomem.o.ok ${OBJECTDIR}/_ext/1458030235/salvomem.o.err 
	@${RM} ${OBJECTDIR}/_ext/1458030235/salvomem.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1458030235/salvomem.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ -c ${MP_CC} $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1 -omf=coff -x c -c -mcpu=$(MP_PROCESSOR_OPTION) -Wall -I"ProjectHeaders" -I"../../../../Pumpkin/CubeSatKit/PIC24/inc" -I"../../../../Pumpkin/Library/PIC24/Inc" -I"../../../../Pumpkin/Salvo/Inc/MCC30" -I"../../../../Pumpkin/Salvo/Inc" -I"../../../../Program Files (x86)/Microchip/mplabc30/v3.31/support/PIC24F" -msmall-code -msmall-data -msmall-scalar -MMD -MF "${OBJECTDIR}/_ext/1458030235/salvomem.o.d" -o ${OBJECTDIR}/_ext/1458030235/salvomem.o ../../../../Pumpkin/Salvo/Src/salvomem.c    
	
else
${OBJECTDIR}/_ext/1443471778/csk_led.o: ../../../../Pumpkin/CubeSatKit/PIC24/src/csk_led.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1443471778" 
	@${RM} ${OBJECTDIR}/_ext/1443471778/csk_led.o.d 
	@${RM} ${OBJECTDIR}/_ext/1443471778/csk_led.o.ok ${OBJECTDIR}/_ext/1443471778/csk_led.o.err 
	@${RM} ${OBJECTDIR}/_ext/1443471778/csk_led.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1443471778/csk_led.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ -c ${MP_CC} $(MP_EXTRA_CC_PRE)  -g -omf=coff -x c -c -mcpu=$(MP_PROCESSOR_OPTION) -Wall -I"ProjectHeaders" -I"../../../../Pumpkin/CubeSatKit/PIC24/inc" -I"../../../../Pumpkin/Library/PIC24/Inc" -I"../../../../Pumpkin/Salvo/Inc/MCC30" -I"../../../../Pumpkin/Salvo/Inc" -I"../../../../Program Files (x86)/Microchip/mplabc30/v3.31/support/PIC24F" -msmall-code -msmall-data -msmall-scalar -MMD -MF "${OBJECTDIR}/_ext/1443471778/csk_led.o.d" -o ${OBJECTDIR}/_ext/1443471778/csk_led.o ../../../../Pumpkin/CubeSatKit/PIC24/src/csk_led.c    
	
${OBJECTDIR}/_ext/1443471778/csk_mhx.o: ../../../../Pumpkin/CubeSatKit/PIC24/src/csk_mhx.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1443471778" 
	@${RM} ${OBJECTDIR}/_ext/1443471778/csk_mhx.o.d 
	@${RM} ${OBJECTDIR}/_ext/1443471778/csk_mhx.o.ok ${OBJECTDIR}/_ext/1443471778/csk_mhx.o.err 
	@${RM} ${OBJECTDIR}/_ext/1443471778/csk_mhx.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1443471778/csk_mhx.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ -c ${MP_CC} $(MP_EXTRA_CC_PRE)  -g -omf=coff -x c -c -mcpu=$(MP_PROCESSOR_OPTION) -Wall -I"ProjectHeaders" -I"../../../../Pumpkin/CubeSatKit/PIC24/inc" -I"../../../../Pumpkin/Library/PIC24/Inc" -I"../../../../Pumpkin/Salvo/Inc/MCC30" -I"../../../../Pumpkin/Salvo/Inc" -I"../../../../Program Files (x86)/Microchip/mplabc30/v3.31/support/PIC24F" -msmall-code -msmall-data -msmall-scalar -MMD -MF "${OBJECTDIR}/_ext/1443471778/csk_mhx.o.d" -o ${OBJECTDIR}/_ext/1443471778/csk_mhx.o ../../../../Pumpkin/CubeSatKit/PIC24/src/csk_mhx.c    
	
${OBJECTDIR}/_ext/1443471778/csk_power.o: ../../../../Pumpkin/CubeSatKit/PIC24/src/csk_power.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1443471778" 
	@${RM} ${OBJECTDIR}/_ext/1443471778/csk_power.o.d 
	@${RM} ${OBJECTDIR}/_ext/1443471778/csk_power.o.ok ${OBJECTDIR}/_ext/1443471778/csk_power.o.err 
	@${RM} ${OBJECTDIR}/_ext/1443471778/csk_power.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1443471778/csk_power.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ -c ${MP_CC} $(MP_EXTRA_CC_PRE)  -g -omf=coff -x c -c -mcpu=$(MP_PROCESSOR_OPTION) -Wall -I"ProjectHeaders" -I"../../../../Pumpkin/CubeSatKit/PIC24/inc" -I"../../../../Pumpkin/Library/PIC24/Inc" -I"../../../../Pumpkin/Salvo/Inc/MCC30" -I"../../../../Pumpkin/Salvo/Inc" -I"../../../../Program Files (x86)/Microchip/mplabc30/v3.31/support/PIC24F" -msmall-code -msmall-data -msmall-scalar -MMD -MF "${OBJECTDIR}/_ext/1443471778/csk_power.o.d" -o ${OBJECTDIR}/_ext/1443471778/csk_power.o ../../../../Pumpkin/CubeSatKit/PIC24/src/csk_power.c    
	
${OBJECTDIR}/_ext/1443471778/csk_rand.o: ../../../../Pumpkin/CubeSatKit/PIC24/src/csk_rand.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1443471778" 
	@${RM} ${OBJECTDIR}/_ext/1443471778/csk_rand.o.d 
	@${RM} ${OBJECTDIR}/_ext/1443471778/csk_rand.o.ok ${OBJECTDIR}/_ext/1443471778/csk_rand.o.err 
	@${RM} ${OBJECTDIR}/_ext/1443471778/csk_rand.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1443471778/csk_rand.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ -c ${MP_CC} $(MP_EXTRA_CC_PRE)  -g -omf=coff -x c -c -mcpu=$(MP_PROCESSOR_OPTION) -Wall -I"ProjectHeaders" -I"../../../../Pumpkin/CubeSatKit/PIC24/inc" -I"../../../../Pumpkin/Library/PIC24/Inc" -I"../../../../Pumpkin/Salvo/Inc/MCC30" -I"../../../../Pumpkin/Salvo/Inc" -I"../../../../Program Files (x86)/Microchip/mplabc30/v3.31/support/PIC24F" -msmall-code -msmall-data -msmall-scalar -MMD -MF "${OBJECTDIR}/_ext/1443471778/csk_rand.o.d" -o ${OBJECTDIR}/_ext/1443471778/csk_rand.o ../../../../Pumpkin/CubeSatKit/PIC24/src/csk_rand.c    
	
${OBJECTDIR}/_ext/1443471778/csk_sd.o: ../../../../Pumpkin/CubeSatKit/PIC24/src/csk_sd.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1443471778" 
	@${RM} ${OBJECTDIR}/_ext/1443471778/csk_sd.o.d 
	@${RM} ${OBJECTDIR}/_ext/1443471778/csk_sd.o.ok ${OBJECTDIR}/_ext/1443471778/csk_sd.o.err 
	@${RM} ${OBJECTDIR}/_ext/1443471778/csk_sd.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1443471778/csk_sd.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ -c ${MP_CC} $(MP_EXTRA_CC_PRE)  -g -omf=coff -x c -c -mcpu=$(MP_PROCESSOR_OPTION) -Wall -I"ProjectHeaders" -I"../../../../Pumpkin/CubeSatKit/PIC24/inc" -I"../../../../Pumpkin/Library/PIC24/Inc" -I"../../../../Pumpkin/Salvo/Inc/MCC30" -I"../../../../Pumpkin/Salvo/Inc" -I"../../../../Program Files (x86)/Microchip/mplabc30/v3.31/support/PIC24F" -msmall-code -msmall-data -msmall-scalar -MMD -MF "${OBJECTDIR}/_ext/1443471778/csk_sd.o.d" -o ${OBJECTDIR}/_ext/1443471778/csk_sd.o ../../../../Pumpkin/CubeSatKit/PIC24/src/csk_sd.c    
	
${OBJECTDIR}/_ext/1443471778/csk_usb.o: ../../../../Pumpkin/CubeSatKit/PIC24/src/csk_usb.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1443471778" 
	@${RM} ${OBJECTDIR}/_ext/1443471778/csk_usb.o.d 
	@${RM} ${OBJECTDIR}/_ext/1443471778/csk_usb.o.ok ${OBJECTDIR}/_ext/1443471778/csk_usb.o.err 
	@${RM} ${OBJECTDIR}/_ext/1443471778/csk_usb.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1443471778/csk_usb.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ -c ${MP_CC} $(MP_EXTRA_CC_PRE)  -g -omf=coff -x c -c -mcpu=$(MP_PROCESSOR_OPTION) -Wall -I"ProjectHeaders" -I"../../../../Pumpkin/CubeSatKit/PIC24/inc" -I"../../../../Pumpkin/Library/PIC24/Inc" -I"../../../../Pumpkin/Salvo/Inc/MCC30" -I"../../../../Pumpkin/Salvo/Inc" -I"../../../../Program Files (x86)/Microchip/mplabc30/v3.31/support/PIC24F" -msmall-code -msmall-data -msmall-scalar -MMD -MF "${OBJECTDIR}/_ext/1443471778/csk_usb.o.d" -o ${OBJECTDIR}/_ext/1443471778/csk_usb.o ../../../../Pumpkin/CubeSatKit/PIC24/src/csk_usb.c    
	
${OBJECTDIR}/_ext/1443471778/csk_wdt.o: ../../../../Pumpkin/CubeSatKit/PIC24/src/csk_wdt.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1443471778" 
	@${RM} ${OBJECTDIR}/_ext/1443471778/csk_wdt.o.d 
	@${RM} ${OBJECTDIR}/_ext/1443471778/csk_wdt.o.ok ${OBJECTDIR}/_ext/1443471778/csk_wdt.o.err 
	@${RM} ${OBJECTDIR}/_ext/1443471778/csk_wdt.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1443471778/csk_wdt.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ -c ${MP_CC} $(MP_EXTRA_CC_PRE)  -g -omf=coff -x c -c -mcpu=$(MP_PROCESSOR_OPTION) -Wall -I"ProjectHeaders" -I"../../../../Pumpkin/CubeSatKit/PIC24/inc" -I"../../../../Pumpkin/Library/PIC24/Inc" -I"../../../../Pumpkin/Salvo/Inc/MCC30" -I"../../../../Pumpkin/Salvo/Inc" -I"../../../../Program Files (x86)/Microchip/mplabc30/v3.31/support/PIC24F" -msmall-code -msmall-data -msmall-scalar -MMD -MF "${OBJECTDIR}/_ext/1443471778/csk_wdt.o.d" -o ${OBJECTDIR}/_ext/1443471778/csk_wdt.o ../../../../Pumpkin/CubeSatKit/PIC24/src/csk_wdt.c    
	
${OBJECTDIR}/_ext/1443471778/effs_thin_mmc_drv_spi1.o: ../../../../Pumpkin/CubeSatKit/PIC24/src/effs_thin_mmc_drv_spi1.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1443471778" 
	@${RM} ${OBJECTDIR}/_ext/1443471778/effs_thin_mmc_drv_spi1.o.d 
	@${RM} ${OBJECTDIR}/_ext/1443471778/effs_thin_mmc_drv_spi1.o.ok ${OBJECTDIR}/_ext/1443471778/effs_thin_mmc_drv_spi1.o.err 
	@${RM} ${OBJECTDIR}/_ext/1443471778/effs_thin_mmc_drv_spi1.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1443471778/effs_thin_mmc_drv_spi1.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ -c ${MP_CC} $(MP_EXTRA_CC_PRE)  -g -omf=coff -x c -c -mcpu=$(MP_PROCESSOR_OPTION) -Wall -I"ProjectHeaders" -I"../../../../Pumpkin/CubeSatKit/PIC24/inc" -I"../../../../Pumpkin/Library/PIC24/Inc" -I"../../../../Pumpkin/Salvo/Inc/MCC30" -I"../../../../Pumpkin/Salvo/Inc" -I"../../../../Program Files (x86)/Microchip/mplabc30/v3.31/support/PIC24F" -msmall-code -msmall-data -msmall-scalar -MMD -MF "${OBJECTDIR}/_ext/1443471778/effs_thin_mmc_drv_spi1.o.d" -o ${OBJECTDIR}/_ext/1443471778/effs_thin_mmc_drv_spi1.o ../../../../Pumpkin/CubeSatKit/PIC24/src/effs_thin_mmc_drv_spi1.c    
	
${OBJECTDIR}/_ext/1443471778/csk_io.o: ../../../../Pumpkin/CubeSatKit/PIC24/src/csk_io.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1443471778" 
	@${RM} ${OBJECTDIR}/_ext/1443471778/csk_io.o.d 
	@${RM} ${OBJECTDIR}/_ext/1443471778/csk_io.o.ok ${OBJECTDIR}/_ext/1443471778/csk_io.o.err 
	@${RM} ${OBJECTDIR}/_ext/1443471778/csk_io.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1443471778/csk_io.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ -c ${MP_CC} $(MP_EXTRA_CC_PRE)  -g -omf=coff -x c -c -mcpu=$(MP_PROCESSOR_OPTION) -Wall -I"ProjectHeaders" -I"../../../../Pumpkin/CubeSatKit/PIC24/inc" -I"../../../../Pumpkin/Library/PIC24/Inc" -I"../../../../Pumpkin/Salvo/Inc/MCC30" -I"../../../../Pumpkin/Salvo/Inc" -I"../../../../Program Files (x86)/Microchip/mplabc30/v3.31/support/PIC24F" -msmall-code -msmall-data -msmall-scalar -MMD -MF "${OBJECTDIR}/_ext/1443471778/csk_io.o.d" -o ${OBJECTDIR}/_ext/1443471778/csk_io.o ../../../../Pumpkin/CubeSatKit/PIC24/src/csk_io.c    
	
${OBJECTDIR}/_ext/1939458138/pic24_uart1.o: ../../../../Pumpkin/Library/PIC24/Src/pic24_uart1.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1939458138" 
	@${RM} ${OBJECTDIR}/_ext/1939458138/pic24_uart1.o.d 
	@${RM} ${OBJECTDIR}/_ext/1939458138/pic24_uart1.o.ok ${OBJECTDIR}/_ext/1939458138/pic24_uart1.o.err 
	@${RM} ${OBJECTDIR}/_ext/1939458138/pic24_uart1.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1939458138/pic24_uart1.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ -c ${MP_CC} $(MP_EXTRA_CC_PRE)  -g -omf=coff -x c -c -mcpu=$(MP_PROCESSOR_OPTION) -Wall -I"ProjectHeaders" -I"../../../../Pumpkin/CubeSatKit/PIC24/inc" -I"../../../../Pumpkin/Library/PIC24/Inc" -I"../../../../Pumpkin/Salvo/Inc/MCC30" -I"../../../../Pumpkin/Salvo/Inc" -I"../../../../Program Files (x86)/Microchip/mplabc30/v3.31/support/PIC24F" -msmall-code -msmall-data -msmall-scalar -MMD -MF "${OBJECTDIR}/_ext/1939458138/pic24_uart1.o.d" -o ${OBJECTDIR}/_ext/1939458138/pic24_uart1.o ../../../../Pumpkin/Library/PIC24/Src/pic24_uart1.c    
	
${OBJECTDIR}/_ext/1939458138/pic24_uart1_msg.o: ../../../../Pumpkin/Library/PIC24/Src/pic24_uart1_msg.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1939458138" 
	@${RM} ${OBJECTDIR}/_ext/1939458138/pic24_uart1_msg.o.d 
	@${RM} ${OBJECTDIR}/_ext/1939458138/pic24_uart1_msg.o.ok ${OBJECTDIR}/_ext/1939458138/pic24_uart1_msg.o.err 
	@${RM} ${OBJECTDIR}/_ext/1939458138/pic24_uart1_msg.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1939458138/pic24_uart1_msg.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ -c ${MP_CC} $(MP_EXTRA_CC_PRE)  -g -omf=coff -x c -c -mcpu=$(MP_PROCESSOR_OPTION) -Wall -I"ProjectHeaders" -I"../../../../Pumpkin/CubeSatKit/PIC24/inc" -I"../../../../Pumpkin/Library/PIC24/Inc" -I"../../../../Pumpkin/Salvo/Inc/MCC30" -I"../../../../Pumpkin/Salvo/Inc" -I"../../../../Program Files (x86)/Microchip/mplabc30/v3.31/support/PIC24F" -msmall-code -msmall-data -msmall-scalar -MMD -MF "${OBJECTDIR}/_ext/1939458138/pic24_uart1_msg.o.d" -o ${OBJECTDIR}/_ext/1939458138/pic24_uart1_msg.o ../../../../Pumpkin/Library/PIC24/Src/pic24_uart1_msg.c    
	
${OBJECTDIR}/_ext/1939458138/pic24_uart1_msg_ts.o: ../../../../Pumpkin/Library/PIC24/Src/pic24_uart1_msg_ts.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1939458138" 
	@${RM} ${OBJECTDIR}/_ext/1939458138/pic24_uart1_msg_ts.o.d 
	@${RM} ${OBJECTDIR}/_ext/1939458138/pic24_uart1_msg_ts.o.ok ${OBJECTDIR}/_ext/1939458138/pic24_uart1_msg_ts.o.err 
	@${RM} ${OBJECTDIR}/_ext/1939458138/pic24_uart1_msg_ts.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1939458138/pic24_uart1_msg_ts.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ -c ${MP_CC} $(MP_EXTRA_CC_PRE)  -g -omf=coff -x c -c -mcpu=$(MP_PROCESSOR_OPTION) -Wall -I"ProjectHeaders" -I"../../../../Pumpkin/CubeSatKit/PIC24/inc" -I"../../../../Pumpkin/Library/PIC24/Inc" -I"../../../../Pumpkin/Salvo/Inc/MCC30" -I"../../../../Pumpkin/Salvo/Inc" -I"../../../../Program Files (x86)/Microchip/mplabc30/v3.31/support/PIC24F" -msmall-code -msmall-data -msmall-scalar -MMD -MF "${OBJECTDIR}/_ext/1939458138/pic24_uart1_msg_ts.o.d" -o ${OBJECTDIR}/_ext/1939458138/pic24_uart1_msg_ts.o ../../../../Pumpkin/Library/PIC24/Src/pic24_uart1_msg_ts.c    
	
${OBJECTDIR}/_ext/1939458138/pic24_uart2.o: ../../../../Pumpkin/Library/PIC24/Src/pic24_uart2.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1939458138" 
	@${RM} ${OBJECTDIR}/_ext/1939458138/pic24_uart2.o.d 
	@${RM} ${OBJECTDIR}/_ext/1939458138/pic24_uart2.o.ok ${OBJECTDIR}/_ext/1939458138/pic24_uart2.o.err 
	@${RM} ${OBJECTDIR}/_ext/1939458138/pic24_uart2.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1939458138/pic24_uart2.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ -c ${MP_CC} $(MP_EXTRA_CC_PRE)  -g -omf=coff -x c -c -mcpu=$(MP_PROCESSOR_OPTION) -Wall -I"ProjectHeaders" -I"../../../../Pumpkin/CubeSatKit/PIC24/inc" -I"../../../../Pumpkin/Library/PIC24/Inc" -I"../../../../Pumpkin/Salvo/Inc/MCC30" -I"../../../../Pumpkin/Salvo/Inc" -I"../../../../Program Files (x86)/Microchip/mplabc30/v3.31/support/PIC24F" -msmall-code -msmall-data -msmall-scalar -MMD -MF "${OBJECTDIR}/_ext/1939458138/pic24_uart2.o.d" -o ${OBJECTDIR}/_ext/1939458138/pic24_uart2.o ../../../../Pumpkin/Library/PIC24/Src/pic24_uart2.c    
	
${OBJECTDIR}/_ext/1939458138/pic24_uart2_msg.o: ../../../../Pumpkin/Library/PIC24/Src/pic24_uart2_msg.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1939458138" 
	@${RM} ${OBJECTDIR}/_ext/1939458138/pic24_uart2_msg.o.d 
	@${RM} ${OBJECTDIR}/_ext/1939458138/pic24_uart2_msg.o.ok ${OBJECTDIR}/_ext/1939458138/pic24_uart2_msg.o.err 
	@${RM} ${OBJECTDIR}/_ext/1939458138/pic24_uart2_msg.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1939458138/pic24_uart2_msg.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ -c ${MP_CC} $(MP_EXTRA_CC_PRE)  -g -omf=coff -x c -c -mcpu=$(MP_PROCESSOR_OPTION) -Wall -I"ProjectHeaders" -I"../../../../Pumpkin/CubeSatKit/PIC24/inc" -I"../../../../Pumpkin/Library/PIC24/Inc" -I"../../../../Pumpkin/Salvo/Inc/MCC30" -I"../../../../Pumpkin/Salvo/Inc" -I"../../../../Program Files (x86)/Microchip/mplabc30/v3.31/support/PIC24F" -msmall-code -msmall-data -msmall-scalar -MMD -MF "${OBJECTDIR}/_ext/1939458138/pic24_uart2_msg.o.d" -o ${OBJECTDIR}/_ext/1939458138/pic24_uart2_msg.o ../../../../Pumpkin/Library/PIC24/Src/pic24_uart2_msg.c    
	
${OBJECTDIR}/_ext/1939458138/pic24_uart2_msg_ts.o: ../../../../Pumpkin/Library/PIC24/Src/pic24_uart2_msg_ts.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1939458138" 
	@${RM} ${OBJECTDIR}/_ext/1939458138/pic24_uart2_msg_ts.o.d 
	@${RM} ${OBJECTDIR}/_ext/1939458138/pic24_uart2_msg_ts.o.ok ${OBJECTDIR}/_ext/1939458138/pic24_uart2_msg_ts.o.err 
	@${RM} ${OBJECTDIR}/_ext/1939458138/pic24_uart2_msg_ts.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1939458138/pic24_uart2_msg_ts.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ -c ${MP_CC} $(MP_EXTRA_CC_PRE)  -g -omf=coff -x c -c -mcpu=$(MP_PROCESSOR_OPTION) -Wall -I"ProjectHeaders" -I"../../../../Pumpkin/CubeSatKit/PIC24/inc" -I"../../../../Pumpkin/Library/PIC24/Inc" -I"../../../../Pumpkin/Salvo/Inc/MCC30" -I"../../../../Pumpkin/Salvo/Inc" -I"../../../../Program Files (x86)/Microchip/mplabc30/v3.31/support/PIC24F" -msmall-code -msmall-data -msmall-scalar -MMD -MF "${OBJECTDIR}/_ext/1939458138/pic24_uart2_msg_ts.o.d" -o ${OBJECTDIR}/_ext/1939458138/pic24_uart2_msg_ts.o ../../../../Pumpkin/Library/PIC24/Src/pic24_uart2_msg_ts.c    
	
${OBJECTDIR}/_ext/1939458138/pic24_uart3.o: ../../../../Pumpkin/Library/PIC24/Src/pic24_uart3.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1939458138" 
	@${RM} ${OBJECTDIR}/_ext/1939458138/pic24_uart3.o.d 
	@${RM} ${OBJECTDIR}/_ext/1939458138/pic24_uart3.o.ok ${OBJECTDIR}/_ext/1939458138/pic24_uart3.o.err 
	@${RM} ${OBJECTDIR}/_ext/1939458138/pic24_uart3.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1939458138/pic24_uart3.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ -c ${MP_CC} $(MP_EXTRA_CC_PRE)  -g -omf=coff -x c -c -mcpu=$(MP_PROCESSOR_OPTION) -Wall -I"ProjectHeaders" -I"../../../../Pumpkin/CubeSatKit/PIC24/inc" -I"../../../../Pumpkin/Library/PIC24/Inc" -I"../../../../Pumpkin/Salvo/Inc/MCC30" -I"../../../../Pumpkin/Salvo/Inc" -I"../../../../Program Files (x86)/Microchip/mplabc30/v3.31/support/PIC24F" -msmall-code -msmall-data -msmall-scalar -MMD -MF "${OBJECTDIR}/_ext/1939458138/pic24_uart3.o.d" -o ${OBJECTDIR}/_ext/1939458138/pic24_uart3.o ../../../../Pumpkin/Library/PIC24/Src/pic24_uart3.c    
	
${OBJECTDIR}/_ext/1939458138/pic24_uart3_msg.o: ../../../../Pumpkin/Library/PIC24/Src/pic24_uart3_msg.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1939458138" 
	@${RM} ${OBJECTDIR}/_ext/1939458138/pic24_uart3_msg.o.d 
	@${RM} ${OBJECTDIR}/_ext/1939458138/pic24_uart3_msg.o.ok ${OBJECTDIR}/_ext/1939458138/pic24_uart3_msg.o.err 
	@${RM} ${OBJECTDIR}/_ext/1939458138/pic24_uart3_msg.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1939458138/pic24_uart3_msg.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ -c ${MP_CC} $(MP_EXTRA_CC_PRE)  -g -omf=coff -x c -c -mcpu=$(MP_PROCESSOR_OPTION) -Wall -I"ProjectHeaders" -I"../../../../Pumpkin/CubeSatKit/PIC24/inc" -I"../../../../Pumpkin/Library/PIC24/Inc" -I"../../../../Pumpkin/Salvo/Inc/MCC30" -I"../../../../Pumpkin/Salvo/Inc" -I"../../../../Program Files (x86)/Microchip/mplabc30/v3.31/support/PIC24F" -msmall-code -msmall-data -msmall-scalar -MMD -MF "${OBJECTDIR}/_ext/1939458138/pic24_uart3_msg.o.d" -o ${OBJECTDIR}/_ext/1939458138/pic24_uart3_msg.o ../../../../Pumpkin/Library/PIC24/Src/pic24_uart3_msg.c    
	
${OBJECTDIR}/_ext/1939458138/pic24_uart3_msg_ts.o: ../../../../Pumpkin/Library/PIC24/Src/pic24_uart3_msg_ts.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1939458138" 
	@${RM} ${OBJECTDIR}/_ext/1939458138/pic24_uart3_msg_ts.o.d 
	@${RM} ${OBJECTDIR}/_ext/1939458138/pic24_uart3_msg_ts.o.ok ${OBJECTDIR}/_ext/1939458138/pic24_uart3_msg_ts.o.err 
	@${RM} ${OBJECTDIR}/_ext/1939458138/pic24_uart3_msg_ts.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1939458138/pic24_uart3_msg_ts.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ -c ${MP_CC} $(MP_EXTRA_CC_PRE)  -g -omf=coff -x c -c -mcpu=$(MP_PROCESSOR_OPTION) -Wall -I"ProjectHeaders" -I"../../../../Pumpkin/CubeSatKit/PIC24/inc" -I"../../../../Pumpkin/Library/PIC24/Inc" -I"../../../../Pumpkin/Salvo/Inc/MCC30" -I"../../../../Pumpkin/Salvo/Inc" -I"../../../../Program Files (x86)/Microchip/mplabc30/v3.31/support/PIC24F" -msmall-code -msmall-data -msmall-scalar -MMD -MF "${OBJECTDIR}/_ext/1939458138/pic24_uart3_msg_ts.o.d" -o ${OBJECTDIR}/_ext/1939458138/pic24_uart3_msg_ts.o ../../../../Pumpkin/Library/PIC24/Src/pic24_uart3_msg_ts.c    
	
${OBJECTDIR}/_ext/1939458138/pic24_uart4.o: ../../../../Pumpkin/Library/PIC24/Src/pic24_uart4.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1939458138" 
	@${RM} ${OBJECTDIR}/_ext/1939458138/pic24_uart4.o.d 
	@${RM} ${OBJECTDIR}/_ext/1939458138/pic24_uart4.o.ok ${OBJECTDIR}/_ext/1939458138/pic24_uart4.o.err 
	@${RM} ${OBJECTDIR}/_ext/1939458138/pic24_uart4.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1939458138/pic24_uart4.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ -c ${MP_CC} $(MP_EXTRA_CC_PRE)  -g -omf=coff -x c -c -mcpu=$(MP_PROCESSOR_OPTION) -Wall -I"ProjectHeaders" -I"../../../../Pumpkin/CubeSatKit/PIC24/inc" -I"../../../../Pumpkin/Library/PIC24/Inc" -I"../../../../Pumpkin/Salvo/Inc/MCC30" -I"../../../../Pumpkin/Salvo/Inc" -I"../../../../Program Files (x86)/Microchip/mplabc30/v3.31/support/PIC24F" -msmall-code -msmall-data -msmall-scalar -MMD -MF "${OBJECTDIR}/_ext/1939458138/pic24_uart4.o.d" -o ${OBJECTDIR}/_ext/1939458138/pic24_uart4.o ../../../../Pumpkin/Library/PIC24/Src/pic24_uart4.c    
	
${OBJECTDIR}/_ext/1939458138/pic24_uart4_msg.o: ../../../../Pumpkin/Library/PIC24/Src/pic24_uart4_msg.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1939458138" 
	@${RM} ${OBJECTDIR}/_ext/1939458138/pic24_uart4_msg.o.d 
	@${RM} ${OBJECTDIR}/_ext/1939458138/pic24_uart4_msg.o.ok ${OBJECTDIR}/_ext/1939458138/pic24_uart4_msg.o.err 
	@${RM} ${OBJECTDIR}/_ext/1939458138/pic24_uart4_msg.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1939458138/pic24_uart4_msg.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ -c ${MP_CC} $(MP_EXTRA_CC_PRE)  -g -omf=coff -x c -c -mcpu=$(MP_PROCESSOR_OPTION) -Wall -I"ProjectHeaders" -I"../../../../Pumpkin/CubeSatKit/PIC24/inc" -I"../../../../Pumpkin/Library/PIC24/Inc" -I"../../../../Pumpkin/Salvo/Inc/MCC30" -I"../../../../Pumpkin/Salvo/Inc" -I"../../../../Program Files (x86)/Microchip/mplabc30/v3.31/support/PIC24F" -msmall-code -msmall-data -msmall-scalar -MMD -MF "${OBJECTDIR}/_ext/1939458138/pic24_uart4_msg.o.d" -o ${OBJECTDIR}/_ext/1939458138/pic24_uart4_msg.o ../../../../Pumpkin/Library/PIC24/Src/pic24_uart4_msg.c    
	
${OBJECTDIR}/_ext/1939458138/pic24_uart4_msg_ts.o: ../../../../Pumpkin/Library/PIC24/Src/pic24_uart4_msg_ts.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1939458138" 
	@${RM} ${OBJECTDIR}/_ext/1939458138/pic24_uart4_msg_ts.o.d 
	@${RM} ${OBJECTDIR}/_ext/1939458138/pic24_uart4_msg_ts.o.ok ${OBJECTDIR}/_ext/1939458138/pic24_uart4_msg_ts.o.err 
	@${RM} ${OBJECTDIR}/_ext/1939458138/pic24_uart4_msg_ts.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1939458138/pic24_uart4_msg_ts.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ -c ${MP_CC} $(MP_EXTRA_CC_PRE)  -g -omf=coff -x c -c -mcpu=$(MP_PROCESSOR_OPTION) -Wall -I"ProjectHeaders" -I"../../../../Pumpkin/CubeSatKit/PIC24/inc" -I"../../../../Pumpkin/Library/PIC24/Inc" -I"../../../../Pumpkin/Salvo/Inc/MCC30" -I"../../../../Pumpkin/Salvo/Inc" -I"../../../../Program Files (x86)/Microchip/mplabc30/v3.31/support/PIC24F" -msmall-code -msmall-data -msmall-scalar -MMD -MF "${OBJECTDIR}/_ext/1939458138/pic24_uart4_msg_ts.o.d" -o ${OBJECTDIR}/_ext/1939458138/pic24_uart4_msg_ts.o ../../../../Pumpkin/Library/PIC24/Src/pic24_uart4_msg_ts.c    
	
${OBJECTDIR}/ProjectSources/main.o: ProjectSources/main.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/ProjectSources" 
	@${RM} ${OBJECTDIR}/ProjectSources/main.o.d 
	@${RM} ${OBJECTDIR}/ProjectSources/main.o.ok ${OBJECTDIR}/ProjectSources/main.o.err 
	@${RM} ${OBJECTDIR}/ProjectSources/main.o 
	@${FIXDEPS} "${OBJECTDIR}/ProjectSources/main.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ -c ${MP_CC} $(MP_EXTRA_CC_PRE)  -g -omf=coff -x c -c -mcpu=$(MP_PROCESSOR_OPTION) -Wall -I"ProjectHeaders" -I"../../../../Pumpkin/CubeSatKit/PIC24/inc" -I"../../../../Pumpkin/Library/PIC24/Inc" -I"../../../../Pumpkin/Salvo/Inc/MCC30" -I"../../../../Pumpkin/Salvo/Inc" -I"../../../../Program Files (x86)/Microchip/mplabc30/v3.31/support/PIC24F" -msmall-code -msmall-data -msmall-scalar -MMD -MF "${OBJECTDIR}/ProjectSources/main.o.d" -o ${OBJECTDIR}/ProjectSources/main.o ProjectSources/main.c    
	
${OBJECTDIR}/ProjectSources/debug_functions.o: ProjectSources/debug_functions.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/ProjectSources" 
	@${RM} ${OBJECTDIR}/ProjectSources/debug_functions.o.d 
	@${RM} ${OBJECTDIR}/ProjectSources/debug_functions.o.ok ${OBJECTDIR}/ProjectSources/debug_functions.o.err 
	@${RM} ${OBJECTDIR}/ProjectSources/debug_functions.o 
	@${FIXDEPS} "${OBJECTDIR}/ProjectSources/debug_functions.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ -c ${MP_CC} $(MP_EXTRA_CC_PRE)  -g -omf=coff -x c -c -mcpu=$(MP_PROCESSOR_OPTION) -Wall -I"ProjectHeaders" -I"../../../../Pumpkin/CubeSatKit/PIC24/inc" -I"../../../../Pumpkin/Library/PIC24/Inc" -I"../../../../Pumpkin/Salvo/Inc/MCC30" -I"../../../../Pumpkin/Salvo/Inc" -I"../../../../Program Files (x86)/Microchip/mplabc30/v3.31/support/PIC24F" -msmall-code -msmall-data -msmall-scalar -MMD -MF "${OBJECTDIR}/ProjectSources/debug_functions.o.d" -o ${OBJECTDIR}/ProjectSources/debug_functions.o ProjectSources/debug_functions.c    
	
${OBJECTDIR}/ProjectSources/messagequeues.o: ProjectSources/messagequeues.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/ProjectSources" 
	@${RM} ${OBJECTDIR}/ProjectSources/messagequeues.o.d 
	@${RM} ${OBJECTDIR}/ProjectSources/messagequeues.o.ok ${OBJECTDIR}/ProjectSources/messagequeues.o.err 
	@${RM} ${OBJECTDIR}/ProjectSources/messagequeues.o 
	@${FIXDEPS} "${OBJECTDIR}/ProjectSources/messagequeues.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ -c ${MP_CC} $(MP_EXTRA_CC_PRE)  -g -omf=coff -x c -c -mcpu=$(MP_PROCESSOR_OPTION) -Wall -I"ProjectHeaders" -I"../../../../Pumpkin/CubeSatKit/PIC24/inc" -I"../../../../Pumpkin/Library/PIC24/Inc" -I"../../../../Pumpkin/Salvo/Inc/MCC30" -I"../../../../Pumpkin/Salvo/Inc" -I"../../../../Program Files (x86)/Microchip/mplabc30/v3.31/support/PIC24F" -msmall-code -msmall-data -msmall-scalar -MMD -MF "${OBJECTDIR}/ProjectSources/messagequeues.o.d" -o ${OBJECTDIR}/ProjectSources/messagequeues.o ProjectSources/messagequeues.c    
	
${OBJECTDIR}/ProjectSources/task_beacon.o: ProjectSources/task_beacon.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/ProjectSources" 
	@${RM} ${OBJECTDIR}/ProjectSources/task_beacon.o.d 
	@${RM} ${OBJECTDIR}/ProjectSources/task_beacon.o.ok ${OBJECTDIR}/ProjectSources/task_beacon.o.err 
	@${RM} ${OBJECTDIR}/ProjectSources/task_beacon.o 
	@${FIXDEPS} "${OBJECTDIR}/ProjectSources/task_beacon.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ -c ${MP_CC} $(MP_EXTRA_CC_PRE)  -g -omf=coff -x c -c -mcpu=$(MP_PROCESSOR_OPTION) -Wall -I"ProjectHeaders" -I"../../../../Pumpkin/CubeSatKit/PIC24/inc" -I"../../../../Pumpkin/Library/PIC24/Inc" -I"../../../../Pumpkin/Salvo/Inc/MCC30" -I"../../../../Pumpkin/Salvo/Inc" -I"../../../../Program Files (x86)/Microchip/mplabc30/v3.31/support/PIC24F" -msmall-code -msmall-data -msmall-scalar -MMD -MF "${OBJECTDIR}/ProjectSources/task_beacon.o.d" -o ${OBJECTDIR}/ProjectSources/task_beacon.o ProjectSources/task_beacon.c    
	
${OBJECTDIR}/ProjectSources/task_radio_listen.o: ProjectSources/task_radio_listen.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/ProjectSources" 
	@${RM} ${OBJECTDIR}/ProjectSources/task_radio_listen.o.d 
	@${RM} ${OBJECTDIR}/ProjectSources/task_radio_listen.o.ok ${OBJECTDIR}/ProjectSources/task_radio_listen.o.err 
	@${RM} ${OBJECTDIR}/ProjectSources/task_radio_listen.o 
	@${FIXDEPS} "${OBJECTDIR}/ProjectSources/task_radio_listen.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ -c ${MP_CC} $(MP_EXTRA_CC_PRE)  -g -omf=coff -x c -c -mcpu=$(MP_PROCESSOR_OPTION) -Wall -I"ProjectHeaders" -I"../../../../Pumpkin/CubeSatKit/PIC24/inc" -I"../../../../Pumpkin/Library/PIC24/Inc" -I"../../../../Pumpkin/Salvo/Inc/MCC30" -I"../../../../Pumpkin/Salvo/Inc" -I"../../../../Program Files (x86)/Microchip/mplabc30/v3.31/support/PIC24F" -msmall-code -msmall-data -msmall-scalar -MMD -MF "${OBJECTDIR}/ProjectSources/task_radio_listen.o.d" -o ${OBJECTDIR}/ProjectSources/task_radio_listen.o ProjectSources/task_radio_listen.c    
	
${OBJECTDIR}/ProjectSources/task_radio_talk.o: ProjectSources/task_radio_talk.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/ProjectSources" 
	@${RM} ${OBJECTDIR}/ProjectSources/task_radio_talk.o.d 
	@${RM} ${OBJECTDIR}/ProjectSources/task_radio_talk.o.ok ${OBJECTDIR}/ProjectSources/task_radio_talk.o.err 
	@${RM} ${OBJECTDIR}/ProjectSources/task_radio_talk.o 
	@${FIXDEPS} "${OBJECTDIR}/ProjectSources/task_radio_talk.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ -c ${MP_CC} $(MP_EXTRA_CC_PRE)  -g -omf=coff -x c -c -mcpu=$(MP_PROCESSOR_OPTION) -Wall -I"ProjectHeaders" -I"../../../../Pumpkin/CubeSatKit/PIC24/inc" -I"../../../../Pumpkin/Library/PIC24/Inc" -I"../../../../Pumpkin/Salvo/Inc/MCC30" -I"../../../../Pumpkin/Salvo/Inc" -I"../../../../Program Files (x86)/Microchip/mplabc30/v3.31/support/PIC24F" -msmall-code -msmall-data -msmall-scalar -MMD -MF "${OBJECTDIR}/ProjectSources/task_radio_talk.o.d" -o ${OBJECTDIR}/ProjectSources/task_radio_talk.o ProjectSources/task_radio_talk.c    
	
${OBJECTDIR}/ProjectSources/task_scheduler.o: ProjectSources/task_scheduler.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/ProjectSources" 
	@${RM} ${OBJECTDIR}/ProjectSources/task_scheduler.o.d 
	@${RM} ${OBJECTDIR}/ProjectSources/task_scheduler.o.ok ${OBJECTDIR}/ProjectSources/task_scheduler.o.err 
	@${RM} ${OBJECTDIR}/ProjectSources/task_scheduler.o 
	@${FIXDEPS} "${OBJECTDIR}/ProjectSources/task_scheduler.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ -c ${MP_CC} $(MP_EXTRA_CC_PRE)  -g -omf=coff -x c -c -mcpu=$(MP_PROCESSOR_OPTION) -Wall -I"ProjectHeaders" -I"../../../../Pumpkin/CubeSatKit/PIC24/inc" -I"../../../../Pumpkin/Library/PIC24/Inc" -I"../../../../Pumpkin/Salvo/Inc/MCC30" -I"../../../../Pumpkin/Salvo/Inc" -I"../../../../Program Files (x86)/Microchip/mplabc30/v3.31/support/PIC24F" -msmall-code -msmall-data -msmall-scalar -MMD -MF "${OBJECTDIR}/ProjectSources/task_scheduler.o.d" -o ${OBJECTDIR}/ProjectSources/task_scheduler.o ProjectSources/task_scheduler.c    
	
${OBJECTDIR}/ProjectSources/task_test.o: ProjectSources/task_test.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/ProjectSources" 
	@${RM} ${OBJECTDIR}/ProjectSources/task_test.o.d 
	@${RM} ${OBJECTDIR}/ProjectSources/task_test.o.ok ${OBJECTDIR}/ProjectSources/task_test.o.err 
	@${RM} ${OBJECTDIR}/ProjectSources/task_test.o 
	@${FIXDEPS} "${OBJECTDIR}/ProjectSources/task_test.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ -c ${MP_CC} $(MP_EXTRA_CC_PRE)  -g -omf=coff -x c -c -mcpu=$(MP_PROCESSOR_OPTION) -Wall -I"ProjectHeaders" -I"../../../../Pumpkin/CubeSatKit/PIC24/inc" -I"../../../../Pumpkin/Library/PIC24/Inc" -I"../../../../Pumpkin/Salvo/Inc/MCC30" -I"../../../../Pumpkin/Salvo/Inc" -I"../../../../Program Files (x86)/Microchip/mplabc30/v3.31/support/PIC24F" -msmall-code -msmall-data -msmall-scalar -MMD -MF "${OBJECTDIR}/ProjectSources/task_test.o.d" -o ${OBJECTDIR}/ProjectSources/task_test.o ProjectSources/task_test.c    
	
${OBJECTDIR}/ProjectSources/init.o: ProjectSources/init.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/ProjectSources" 
	@${RM} ${OBJECTDIR}/ProjectSources/init.o.d 
	@${RM} ${OBJECTDIR}/ProjectSources/init.o.ok ${OBJECTDIR}/ProjectSources/init.o.err 
	@${RM} ${OBJECTDIR}/ProjectSources/init.o 
	@${FIXDEPS} "${OBJECTDIR}/ProjectSources/init.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ -c ${MP_CC} $(MP_EXTRA_CC_PRE)  -g -omf=coff -x c -c -mcpu=$(MP_PROCESSOR_OPTION) -Wall -I"ProjectHeaders" -I"../../../../Pumpkin/CubeSatKit/PIC24/inc" -I"../../../../Pumpkin/Library/PIC24/Inc" -I"../../../../Pumpkin/Salvo/Inc/MCC30" -I"../../../../Pumpkin/Salvo/Inc" -I"../../../../Program Files (x86)/Microchip/mplabc30/v3.31/support/PIC24F" -msmall-code -msmall-data -msmall-scalar -MMD -MF "${OBJECTDIR}/ProjectSources/init.o.d" -o ${OBJECTDIR}/ProjectSources/init.o ProjectSources/init.c    
	
${OBJECTDIR}/_ext/1458030235/salvomem.o: ../../../../Pumpkin/Salvo/Src/salvomem.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1458030235" 
	@${RM} ${OBJECTDIR}/_ext/1458030235/salvomem.o.d 
	@${RM} ${OBJECTDIR}/_ext/1458030235/salvomem.o.ok ${OBJECTDIR}/_ext/1458030235/salvomem.o.err 
	@${RM} ${OBJECTDIR}/_ext/1458030235/salvomem.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1458030235/salvomem.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ -c ${MP_CC} $(MP_EXTRA_CC_PRE)  -g -omf=coff -x c -c -mcpu=$(MP_PROCESSOR_OPTION) -Wall -I"ProjectHeaders" -I"../../../../Pumpkin/CubeSatKit/PIC24/inc" -I"../../../../Pumpkin/Library/PIC24/Inc" -I"../../../../Pumpkin/Salvo/Inc/MCC30" -I"../../../../Pumpkin/Salvo/Inc" -I"../../../../Program Files (x86)/Microchip/mplabc30/v3.31/support/PIC24F" -msmall-code -msmall-data -msmall-scalar -MMD -MF "${OBJECTDIR}/_ext/1458030235/salvomem.o.d" -o ${OBJECTDIR}/_ext/1458030235/salvomem.o ../../../../Pumpkin/Salvo/Src/salvomem.c    
	
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: link
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
dist/${CND_CONF}/${IMAGE_TYPE}/Copper2v1-new_lib_build.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk  ../../../../Pumpkin/Salvo/Lib/MCC30-v3/libsalvolmcc30sia.a  ../../../../Program\ Files\ (x86)/Microchip/xc16/v1.26/support/PIC24F/gld/p24FJ256GA110.gld
	@${MKDIR} dist/${CND_CONF}/${IMAGE_TYPE} 
	${MP_CC} $(MP_EXTRA_LD_PRE)  -omf=coff -mcpu=$(MP_PROCESSOR_OPTION)  -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1 -o dist/${CND_CONF}/${IMAGE_TYPE}/Copper2v1-new_lib_build.${IMAGE_TYPE}.${OUTPUT_SUFFIX} ${OBJECTFILES_QUOTED_IF_SPACED}   ..\..\..\..\Pumpkin\Salvo\Lib\MCC30-v3\libsalvolmcc30sia.a      -Wl,--defsym=__MPLAB_BUILD=1,--heap=0,-Map="${DISTDIR}/${PROJECTNAME}.${IMAGE_TYPE}.map"$(MP_EXTRA_LD_POST)$(MP_LINKER_FILE_OPTION),--defsym=__ICD2RAM=1,--defsym=__MPLAB_DEBUG=1,--defsym=__DEBUG=1,--defsym=__MPLAB_DEBUGGER_PK3=1
else
dist/${CND_CONF}/${IMAGE_TYPE}/Copper2v1-new_lib_build.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk  ../../../../Pumpkin/Salvo/Lib/MCC30-v3/libsalvolmcc30sia.a ../../../../Program\ Files\ (x86)/Microchip/xc16/v1.26/support/PIC24F/gld/p24FJ256GA110.gld
	@${MKDIR} dist/${CND_CONF}/${IMAGE_TYPE} 
	${MP_CC} $(MP_EXTRA_LD_PRE)  -omf=coff -mcpu=$(MP_PROCESSOR_OPTION)  -o dist/${CND_CONF}/${IMAGE_TYPE}/Copper2v1-new_lib_build.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX} ${OBJECTFILES_QUOTED_IF_SPACED}   ..\..\..\..\Pumpkin\Salvo\Lib\MCC30-v3\libsalvolmcc30sia.a      -Wl,--defsym=__MPLAB_BUILD=1,--heap=0,-Map="${DISTDIR}/${PROJECTNAME}.${IMAGE_TYPE}.map"$(MP_EXTRA_LD_POST)$(MP_LINKER_FILE_OPTION)
	${MP_CC_DIR}\\pic30-bin2hex dist/${CND_CONF}/${IMAGE_TYPE}/Copper2v1-new_lib_build.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX} -omf=coff
endif


# Subprojects
.build-subprojects:


# Subprojects
.clean-subprojects:

# Clean Targets
.clean-conf: ${CLEAN_SUBPROJECTS}
	${RM} -r build/C30
	${RM} -r dist/C30

# Enable dependency checking
.dep.inc: .depcheck-impl

DEPFILES=$(shell mplabwildcard ${POSSIBLE_DEPFILES})
ifneq (${DEPFILES},)
include ${DEPFILES}
endif
