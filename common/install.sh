## Getting Props into Vars ##

OEM=`grep_prop ro.product.brand`
DEV=`grep_prop ro.product.model`
AOS=`grep_prop ro.build.version.release`

## Compat Checks ##

ui_print "Checking Device and Build..."
ui_print ""
ui_print "OEM:		"$OEM
ui_print "DEVICE:	"$DEV
ui_print "ANDROID:	"$AOS
ui_print ""

## Running Aborts ##

if [ $OEM != "samsung" ]
then abort "OEM Mismatch! Please use the right Module for your device."
fi

if [ $DEV != "SM-G950F" ] && [ $DEV != "SM-G955F" ]
then abort "Device Mismatch! Please use the right Module for your device."
fi

if [ $AOS != "8.1.0" ] && [ $AOS != "9" ]
then abort "Android Mismatch! Please use the right Module for your device."
fi

## Installing Stuff ##

if [ $AOS == "7" ] && [ $AOS == "8.1.0" ] && [ $AOS == "9" ]
	then
		cp_ch $MODPATH/common/bootanimation/bootsamsung.qmg $MODPATH/system/media/bootsamsung.qmg
		cp_ch $MODPATH/common/bootanimation/bootsamsungloop.qmg $MODPATH/system/media/bootsamsungloop.qmg
		cp_ch $MODPATH/common/bootanimation/shutdown.qmg $MODPATH/system/media/shutdown.qmg
		
		touch $MODPATH/system.prop
		echo boot.fps=30 > $MODPATH/system.prop
		echo shutdown.fps=30 >> $MODPATH/system.prop
fi

ui_print "Done!"
