TARGET := iphone:clang:latest:16.0
ARCHS = arm64 arm64e

INSTALL_TARGET_PROCESSES = SpringBoard

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = SnowBoardiOS16Fix

SnowBoardiOS16Fix_FILES = Tweak.x
SnowBoardiOS16Fix_CFLAGS = -fobjc-arc

include $(THEOS_MAKE_PATH)/tweak.mk
