ifneq ($(filter venturi venturiusa,$(TARGET_DEVICE)),)
    include $(all-subdir-makefiles)
endif
