#!/system/bin/sh
# ==============================================================================
# Marca: ElKing Tech Solutions
# Eslogan: Rey absoluto del sistema de tu equipo.
# Desarrollador: Elkin Wilson Alejandro Dominguez (ELKIN)
# Origen: Santa Elena, Ecuador
# Canal Oficial: https://t.me/ElKingTechSolutions
# ==============================================================================
# post-fs-data.sh - Override temporal en RAM (sin modificar archivos reales en /data ni /product)

MODDIR="${0%/*}"
BASE_UPRIGHT="$MODDIR/fonts/SF-Pro.ttf"
BASE_ITALIC="$MODDIR/fonts/SF-Pro-Italic.ttf"

[ -f "$BASE_UPRIGHT" ] || exit 0
[ -f "$BASE_ITALIC" ] || BASE_ITALIC="$BASE_UPRIGHT"

bind_match() {
  target="$1"
  [ -f "$target" ] || return 0
  [ -L "$target" ] && return 0
  case "$(basename "$target")" in
    *Clock*|*Mono*|*Emoji*|*Symbol*) return 0 ;;
    *Italic*) mount -o bind "$BASE_ITALIC" "$target" 2>/dev/null ;;
    *)        mount -o bind "$BASE_UPRIGHT" "$target" 2>/dev/null ;;
  esac
}

# 1. Actualizaciones dinámicas de fuentes GMS en Android 12-16 (/data/fonts/files)
if [ -d /data/fonts/files ]; then
  for f in /data/fonts/files/*/*Roboto*.ttf /data/fonts/files/*/*GoogleSans*.ttf /data/fonts/files/*Roboto*.ttf /data/fonts/files/*GoogleSans*.ttf; do
    bind_match "$f"
  done
fi

# 2. Fuentes GoogleSans en partición /product separada (si aplica)
if [ -d /product/fonts ]; then
  for f in /product/fonts/GoogleSans*.ttf; do
    bind_match "$f"
  done
fi
