#!/system/bin/sh
# ==============================================================================
# Marca: ElKing Tech Solutions
# Eslogan: Rey absoluto del sistema de tu equipo.
# Desarrollador: Elkin Wilson Alejandro Dominguez (ELKIN)
# Origen: Santa Elena, Ecuador
# Canal Oficial: https://t.me/ElKingTechSolutions
# ==============================================================================
# post-fs-data.sh - Override temporal en RAM para /product/fonts y /data/fonts/files

MODDIR="${0%/*}"
BASE_FONT="$MODDIR/fonts/SF-Pro-Display-Black.ttf"

[ -f "$BASE_FONT" ] || exit 0

bind_match() {
  target="$1"
  [ -f "$target" ] || return 0
  [ -L "$target" ] && return 0
  case "$(basename "$target")" in
    *Clock*|*Mono*|*Emoji*|*Symbol*) return 0 ;;
  esac
  mount -o bind "$BASE_FONT" "$target" 2>/dev/null
}

# 1. Fuentes en particion /product separada (crucial en TranssionOS HiOS/XOS: TOS_VF.ttf, TranSans*, TransSans*)
if [ -d /product/fonts ]; then
  for f in /product/fonts/TOS_VF.ttf /product/fonts/TranSans*.ttf /product/fonts/TransSans*.ttf /product/fonts/GoogleSans*.ttf; do
    bind_match "$f"
  done
fi

# 2. Actualizaciones dinamicas de fuentes en Android 12-16 (/data/fonts/files) sin borrar archivos reales
if [ -d /data/fonts/files ]; then
  for f in /data/fonts/files/*/*Roboto*.ttf /data/fonts/files/*/*GoogleSans*.ttf /data/fonts/files/*/*Tran*Sans*.ttf /data/fonts/files/*/*TOS*.ttf /data/fonts/files/*Roboto*.ttf /data/fonts/files/*GoogleSans*.ttf; do
    bind_match "$f"
  done
fi
