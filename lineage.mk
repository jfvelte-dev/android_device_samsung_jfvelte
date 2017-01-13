$(call inherit-product, device/samsung/jfvelte/full_jfvelte.mk)

# Inherit some common LineageOS stuff.
$(call inherit-product, vendor/cm/config/common_full_phone.mk)

PRODUCT_DEVICE := jfvelte
PRODUCT_NAME := lineage_jfvelte
