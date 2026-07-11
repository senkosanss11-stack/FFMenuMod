TARGET := iphone:clang:latest:15.0
ARCHS := arm64 arm64e

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = FFMenuMod

FFMenuMod_FILES = Tweak.xm Menu.mm $(wildcard KittyMemory/*.cpp) $(wildcard SCLAlertView/*.m)
FFMenuMod_CFLAGS = -fobjc-arc -Wno-deprecated-declarations
FFMenuMod_FRAMEWORKS = UIKit CoreGraphics QuartzCore

include $(THEOS_MAKE_PATH)/tweak.mk