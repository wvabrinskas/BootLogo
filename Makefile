SDKVERSION = 7.1

GO_EASY_ON_ME=1

THEOS_DEVICE_IP = 192.168.1.17
THEOS_DEVICE_PORT = 22
THEOS_PACKAGE_DIR_NAME = debs

include theos/makefiles/common.mk

TOOL_NAME = animate
animate_FILES = animate.mm
animate_FRAMEWORKS = Foundation CoreFoundation CoreGraphics IOKit
animate_PRIVATE_FRAMEWORKS = CoreSurface ImageIO IOMobileFramebuffer
animate_CFLAGS = -I. -Iinclude/
animate_LDFLAGS = -undefined dynamic_lookup
animate_INSTALL_PATH = /etc/rc.d/

SUBPROJECTS = settings

include $(THEOS_MAKE_PATH)/tool.mk
include $(THEOS_MAKE_PATH)/aggregate.mk

after-install::
	install.exec "killall -9 SpringBoard"