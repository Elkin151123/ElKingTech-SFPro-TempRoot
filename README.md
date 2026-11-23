<div align="center">
  <img src="./assets/elkingtech_logo.jpg" alt="ElKing Tech Solutions Logo" width="480" />

  # [ElKing Tech] SF Pro iOS Font — Temp Root Safe

  **Rey absoluto del sistema de tu equipo.**

  [![Version](https://img.shields.io/badge/Version-v1.0.0-00E5FF?style=for-the-badge)](https://github.com/Elkin151123/ElKingTech-SFPro-TempRoot/releases)
  [![Font](https://img.shields.io/badge/SF%20Pro-Variable%20TTF-D4AF37?style=for-the-badge)](#)
  [![Root](https://img.shields.io/badge/Temp%20Root-KernelSU%20%7C%20DirtyFrag%20%7C%20BakaSU%20%7C%20SukiSU-00E5FF?style=for-the-badge)](#)
  [![Telegram](https://img.shields.io/badge/Telegram-ElKingTechSolutions-26A5E4?style=for-the-badge&logo=telegram)](https://t.me/ElKingTechSolutions)

  *Desarrollado por **Elkin Wilson Alejandro Dominguez (ELKIN)** — Santa Elena, Ecuador*

  [🇪🇸 Español](#-español) • [🇬🇧 English](#-english)
</div>

---

## 🇪🇸 Español

Módulo **100% systemless y no destructivo** para aplicar la tipografía oficial de Apple **SF Pro (Variable TrueType)** en Android 12–16, diseñado especialmente para **Root Temporal** (**DirtyFrag / DFRoot**, **KernelSU / KernelSU Next**, **BakaSU**, **SukiSU**, **APatch** y **Magisk**).

Es el complemento directo de [**ElKingTech-iOS-Emoji-TempRoot**](https://github.com/Elkin151123/ElKingTech-iOS-Emoji-TempRoot): juntos consiguen la estética completa de iOS sin tocar particiones físicas del sistema.

### ¿Por qué es seguro para Root Temporal?
* **Fuentes TrueType Variables reales (`SF-Pro.ttf` + `SF-Pro-Italic.ttf`):** Incluye ejes completos (`wght` 1–1000, `wdth` 30–150, `opsz` 17–28) con cabecera TrueType válida (`00010000`), evitando los fallos de Skia/FreeType o textos rotos en Android 14–16.
* **No toca relojes ni emojis:** Excluye explícitamente `*Clock*`, `*Mono*`, `*Emoji*` y `*Symbol*` para no romper el reloj de pantalla de bloqueo ni interferir con tu módulo de emojis.
* **Cero cambios permanentes en `/data`:** Usa `mount -o bind` en RAM sobre `/data/fonts/files/` y `/product/fonts/` (si existen) en lugar de borrar carpetas del sistema. Un reinicio normal sin root temporal devuelve tu equipo intacto a stock.
* **Sin `ro.product.*`:** No modifica identificadores del teléfono; tu cámara stock y estabilidad siguen intactas.

### Requisitos
1. Gestor de Root activo (**DirtyFrag / DFRoot**, **KernelSU / Next / BakaSU / SukiSU**, **APatch** o **Magisk**).
2. En **KernelSU y derivados**, tener instalado **un único** metamódulo de montaje (`Mountify`, `meta-overlayfs`, `magic_mount_rs` o `Hybrid Mount`).

### Guía de Instalación
1. Descarga `ElKingTech-SFPro-TempRoot_v1.0.0.zip` desde [**Releases**](https://github.com/Elkin151123/ElKingTech-SFPro-TempRoot/releases) (o compílalo con `package.ps1`).
2. En tu gestor de Root → **Módulos** → **Instalar desde almacenamiento** → selecciona el `.zip`.
3. Haz un **Soft Reboot** (en root temporal) o **Reinicio normal** (en root permanente).
   > **Nota Samsung One UI:** En *Ajustes → Pantalla → Tamaño y estilo de fuente*, deja seleccionada la fuente **Predeterminada** para que aplique SF Pro en todo el sistema.
4. **Si algunas apps (como Chrome o Gboard) mantienen Roboto:** desactiva **`Umount modules`** para esas apps en la pestaña *Apps / Superuser* de tu gestor y realiza otro *Soft Reboot*.

### Verificar Firma de Marca (Opcional)
```sh
getprop | grep elkingtech
```

---

## 🇬🇧 English

A **100% systemless and non-destructive** module to bring Apple's **SF Pro (TrueType Variable Font)** to Android 12–16, engineered specifically for **Temporary Root** (**DirtyFrag / DFRoot**, **KernelSU / KernelSU Next**, **BakaSU**, **SukiSU**, **APatch**, and **Magisk**).

Pairs seamlessly with [**ElKingTech-iOS-Emoji-TempRoot**](https://github.com/Elkin151123/ElKingTech-iOS-Emoji-TempRoot) for a complete iOS look without modifying physical system partitions.

### Why is it Temp-Root Safe?
* **Genuine TrueType Variable Fonts (`SF-Pro.ttf` + `SF-Pro-Italic.ttf`):** Full variable axes (`wght` 1–1000, `wdth` 30–150, `opsz` 17–28) with valid TrueType headers (`00010000`), avoiding Skia/FreeType crashes or broken weights on Android 14–16.
* **Preserves clocks & emojis:** Explicitly skips `*Clock*`, `*Mono*`, `*Emoji*`, and `*Symbol*` files so lockscreen clocks and emoji modules remain unaffected.
* **Zero permanent `/data` edits:** Uses temporary RAM `mount -o bind` over `/data/fonts/files/` and `/product/fonts/` (when present) instead of deleting system folders. A full reboot without temp root leaves your phone 100% stock.
* **No `ro.product.*` spoofing:** Stock camera and system stability remain untouched.

### Requirements
1. Active root manager (**DirtyFrag / DFRoot**, **KernelSU / Next / BakaSU / SukiSU**, **APatch**, or **Magisk**).
2. On **KernelSU and forks**, install **one** compatible mounting metamodule (`Mountify`, `meta-overlayfs`, `magic_mount_rs`, or `Hybrid Mount`).

### Installation Guide
1. Download `ElKingTech-SFPro-TempRoot_v1.0.0.zip` from [**Releases**](https://github.com/Elkin151123/ElKingTech-SFPro-TempRoot/releases) (or build via `package.ps1`).
2. Open your Root Manager → **Modules** → **Install from storage** → select the `.zip` file.
3. Perform a **Soft Reboot** (on temp root) or **Normal Reboot** (on permanent root).
   > **Samsung One UI note:** Keep *Default* font selected in *Settings → Display → Font size and style* so SF Pro applies system-wide.
4. **If certain apps still show Roboto:** disable **`Umount modules`** for those apps in your manager's *Apps / Superuser* tab and do another *Soft Reboot*.

### Verify Brand Signature (Optional)
```sh
getprop | grep elkingtech
```

---

## Créditos & Comunidad / Credits & Community
* **Autor / Developer:** Elkin Wilson Alejandro Dominguez (**ELKIN**) — ElKing Tech Solutions (Santa Elena, Ecuador)
* **Base tipográfica / Font source:** Apple SF Pro TrueType Variable (`SF-Pro.ttf`, `SF-Pro-Italic.ttf` via [anuragxone/apple-fonts](https://github.com/anuragxone/apple-fonts))
* **Canal de Telegram / Telegram Channel:** [t.me/ElKingTechSolutions](https://t.me/ElKingTechSolutions)
