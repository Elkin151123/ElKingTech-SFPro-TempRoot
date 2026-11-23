#!/system/bin/sh
# ==============================================================================
# Marca: ElKing Tech Solutions
# Eslogan: Rey absoluto del sistema de tu equipo.
# Desarrollador: Elkin Wilson Alejandro Dominguez (ELKIN)
# Origen: Santa Elena, Ecuador
# Canal Oficial: https://t.me/ElKingTechSolutions
# ==============================================================================
# service.sh - Refresco no destructivo de Transsion MagicFont (si aplica)

while [ "$(getprop sys.boot_completed)" != "1" ]; do
  sleep 2
done

# Solo reinicia en memoria la app MagicFont de Tecno/Infinix si existe, sin borrar datos
if pm path com.transsion.magicfont >/dev/null 2>&1; then
  am force-stop com.transsion.magicfont >/dev/null 2>&1 || true
fi
