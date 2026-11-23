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
ui_print "- Módulo: SF Pro iOS Font (Variable - Temp Root Safe)"
ui_print " "

SRC_UPRIGHT="$MODPATH/assets/SF-Pro.ttf"
SRC_ITALIC="$MODPATH/assets/SF-Pro-Italic.ttf"
BASE_DIR="$MODPATH/fonts"
TARGET_DIR="$MODPATH/system/fonts"

if [ ! -s "$SRC_UPRIGHT" ] || [ ! -s "$SRC_ITALIC" ]; then
  abort "! Faltan SF-Pro.ttf o SF-Pro-Italic.ttf en assets/."
fi

mkdir -p "$BASE_DIR" "$TARGET_DIR"
mv -f "$SRC_UPRIGHT" "$BASE_DIR/SF-Pro.ttf"
mv -f "$SRC_ITALIC" "$BASE_DIR/SF-Pro-Italic.ttf"
rm -rf "$MODPATH/assets"

BASE_UPRIGHT="$BASE_DIR/SF-Pro.ttf"
BASE_ITALIC="$BASE_DIR/SF-Pro-Italic.ttf"

link_font() {
  src="$1"
  dst="$2"
  ln "$src" "$dst" 2>/dev/null || cp -f "$src" "$dst"
}

ui_print "- Mapeando familias Roboto y GoogleSans del sistema..."
COUNT=0

for sys_font in /system/fonts/Roboto*.ttf /system/fonts/GoogleSans*.ttf; do
  [ -f "$sys_font" ] || continue
  [ -L "$sys_font" ] && continue

  fname="$(basename "$sys_font")"
  case "$fname" in
    *Clock*|*Mono*|*Emoji*|*Symbol*) continue ;;
  esac

  case "$fname" in
    *Italic*) link_font "$BASE_ITALIC" "$TARGET_DIR/$fname" ;;
    *)        link_font "$BASE_UPRIGHT" "$TARGET_DIR/$fname" ;;
  esac
  COUNT=$((COUNT + 1))
done

# Fallback seguro si Roboto-Regular.ttf no coincidió o era enlace
if [ ! -f "$TARGET_DIR/Roboto-Regular.ttf" ]; then
  link_font "$BASE_UPRIGHT" "$TARGET_DIR/Roboto-Regular.ttf"
  COUNT=$((COUNT + 1))
fi

ui_print "- Fuentes mapeadas de forma systemless: $COUNT"

set_perm_recursive "$BASE_DIR" 0 0 0755 0644
set_perm_recursive "$TARGET_DIR" 0 0 0755 0644
chcon -R u:object_r:system_file:s0 "$BASE_DIR" "$TARGET_DIR" 2>/dev/null

if [ ! -d "/data/adb/metamodule" ]; then
  ui_print "! Aviso: No se detectó un metamódulo en /data/adb/metamodule."
  ui_print "  En KernelSU moderno instala UN metamódulo (Mountify / meta-overlayfs / magic_mount_rs)."
fi

ui_print "- Compatible junto al módulo [ElKing Tech] iOS 26.4 Emoji."
ui_print "- Haz un Soft Reboot para aplicar en la sesión actual."
ui_print "- Abriendo canal oficial: https://t.me/ElKingTechSolutions"

if [ "$BOOTMODE" = "true" ] && command -v am >/dev/null 2>&1; then
  sleep 1
  am start -a android.intent.action.VIEW -d "https://t.me/ElKingTechSolutions" >/dev/null 2>&1 || true
fi
