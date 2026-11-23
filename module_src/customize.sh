#!/system/bin/sh
# ==============================================================================
# Marca: ElKing Tech Solutions
# Eslogan: Rey absoluto del sistema de tu equipo.
# Desarrollador: Elkin Wilson Alejandro Dominguez (ELKIN)
# Origen: Santa Elena, Ecuador
# Canal Oficial: https://t.me/ElKingTechSolutions
# ==============================================================================

ui_print "**************************************************"
ui_print "              ELKING TECH SOLUTIONS               "
ui_print "      Rey absoluto del sistema de tu equipo.      "
ui_print "**************************************************"
ui_print " "
ui_print "- Autor: ELKIN (Santa Elena, Ecuador)"
ui_print "- Módulo: SF Pro Display Bold/Black (Temp Root Safe)"
ui_print " "

SRC_FONT="$MODPATH/assets/SF-Pro-Display-Black.ttf"
BASE_DIR="$MODPATH/fonts"
SYS_FONT_DIR="$MODPATH/system/fonts"

if [ ! -s "$SRC_FONT" ]; then
  abort "! Falta assets/SF-Pro-Display-Black.ttf."
fi

mkdir -p "$BASE_DIR" "$SYS_FONT_DIR"
mv -f "$SRC_FONT" "$BASE_DIR/SF-Pro-Display-Black.ttf"
rm -rf "$MODPATH/assets"

BASE_FONT="$BASE_DIR/SF-Pro-Display-Black.ttf"

link_font() {
  ln "$1" "$2" 2>/dev/null || cp -f "$1" "$2"
}

map_dir_fonts() {
  src_sys_dir="$1"
  dst_mod_dir="$2"
  shift 2
  [ -d "$src_sys_dir" ] || return 0
  mkdir -p "$dst_mod_dir"

  for pattern in "$@"; do
    for sys_font in "$src_sys_dir"/$pattern; do
      [ -f "$sys_font" ] || continue
      [ -L "$sys_font" ] && continue
      fname="$(basename "$sys_font")"
      case "$fname" in
        *Clock*|*Mono*|*Emoji*|*Symbol*) continue ;;
      esac
      [ -e "$dst_mod_dir/$fname" ] && continue
      link_font "$BASE_FONT" "$dst_mod_dir/$fname"
      COUNT=$((COUNT + 1))
    done
  done
}

ui_print "- Detectando fuentes del sistema (AOSP, TranssionOS HiOS/XOS, GoogleSans)..."
COUNT=0

# 1. /system/fonts (Roboto + TranssionOS Shell + GoogleSans)
map_dir_fonts "/system/fonts" "$SYS_FONT_DIR" \
  "Roboto-Regular.ttf" "RobotoFlex-Regular.ttf" "RobotoStatic-Regular.ttf" "Roboto*.ttf" \
  "TranSans*Shell.ttf" "GoogleSans*.ttf"

# 2. /system/product/fonts solo si /system/product es directorio real (no symlink en SAR)
if [ -d "/system/product/fonts" ] && [ ! -L "/system/product" ]; then
  map_dir_fonts "/system/product/fonts" "$MODPATH/system/product/fonts" \
    "TOS_VF.ttf" "TranSans*.ttf" "TransSans*.ttf" "GoogleSans*.ttf"
fi

# Fallback mínimo garantizado
if [ ! -f "$SYS_FONT_DIR/Roboto-Regular.ttf" ]; then
  link_font "$BASE_FONT" "$SYS_FONT_DIR/Roboto-Regular.ttf"
  COUNT=$((COUNT + 1))
fi

ui_print "- Fuentes mapeadas de forma systemless: $COUNT"

set_perm_recursive "$BASE_DIR" 0 0 0755 0644
set_perm_recursive "$MODPATH/system" 0 0 0755 0644
chcon -R u:object_r:system_file:s0 "$BASE_DIR" "$MODPATH/system" 2>/dev/null

if [ ! -d "/data/adb/metamodule" ]; then
  ui_print "! Aviso: No se detectó un metamódulo en /data/adb/metamodule."
  ui_print "  En KernelSU moderno instala UN metamódulo (Mountify / meta-overlayfs / magic_mount_rs)."
fi

ui_print "- Compatible junto a [ElKing Tech] iOS 26.4 Emoji."
ui_print "- Haz un Soft Reboot para aplicar en la sesión actual."
ui_print "- Abriendo canal oficial: https://t.me/ElKingTechSolutions"

if [ "$BOOTMODE" = "true" ] && command -v am >/dev/null 2>&1; then
  sleep 1
  am start -a android.intent.action.VIEW -d "https://t.me/ElKingTechSolutions" >/dev/null 2>&1 || true
fi
