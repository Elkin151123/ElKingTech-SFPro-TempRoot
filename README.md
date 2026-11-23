<div align="center">
  <img src="./assets/elkingtech_logo.jpg" alt="ElKing Tech Solutions Logo" width="480" />

  # [ElKing Tech] SF Pro iOS Bold Font — Temp Root Safe

  **Rey absoluto del sistema de tu equipo.**

  [![Version](https://img.shields.io/badge/Version-v1.1.0-00E5FF?style=for-the-badge)](https://github.com/Elkin151123/ElKingTech-SFPro-TempRoot/releases)
  [![Font](https://img.shields.io/badge/SF%20Pro%20Display-Bold%20%2F%20Black%20TTF-D4AF37?style=for-the-badge)](#)
  [![Size](https://img.shields.io/badge/Peso-~430%20KB-00E5FF?style=for-the-badge)](#)
  [![Telegram](https://img.shields.io/badge/Telegram-ElKingTechSolutions-26A5E4?style=for-the-badge&logo=telegram)](https://t.me/ElKingTechSolutions)

  *Desarrollado por **Elkin Wilson Alejandro Dominguez (ELKIN)** — Santa Elena, Ecuador*

  [🇪🇸 Español](#-español) • [🇬🇧 English](#-english)
</div>

---

## 🇪🇸 Español

Módulo **ultraligero (~430 KB), 100% systemless y no destructivo** para aplicar la tipografía **iOS SF Pro Display Bold/Black** en Android 12–16, optimizado especialmente para **TranssionOS (Tecno HiOS / Infinix XOS)**, **Samsung One UI**, **HyperOS** y **AOSP/Pixel** en **Root Temporal** (**DirtyFrag / DFRoot**, **KernelSU / Next**, **BakaSU**, **SukiSU**, **APatch** y **Magisk**).

Es el complemento directo de [**ElKingTech-iOS-Emoji-TempRoot**](https://github.com/Elkin151123/ElKingTech-iOS-Emoji-TempRoot): ambos trabajan juntos sin pisarse entre sí.

### ¿Por qué v1.1.0 aplica mejor y sigue siendo 100% segura?
* **Soporte nativo TranssionOS (Tecno HiOS / Infinix XOS):** Además de `Roboto*.ttf` (`Roboto-Regular.ttf`, `RobotoFlex-Regular.ttf`, `RobotoStatic-Regular.ttf`) y `GoogleSans*.ttf`, mapea automáticamente las fuentes propietarias de Transsion: `TranSans*Shell.ttf`, `TOS_VF.ttf` y `TransSans_*.ttf` / `TranSans_*.ttf`.
* **Ultraligero con *hardlinks*:** Usa una sola fuente TrueType válida (`SF-Pro-Display-Black.ttf`, `426 KB`) enlazada en el mismo directorio sin duplicar espacio en `/data`.
* **Compatible con Android 12–16:** Sin bloqueos por `SDK=36`, sin preguntas interactivas por botones de volumen y sin publicidad ni notificaciones externas.
* **No toca relojes ni emojis:** Excluye explícitamente `*Clock*`, `*Mono*`, `*Emoji*` y `*Symbol*`.
* **Cero borrados permanentes en `/data`:** En lugar de borrar `/data/fonts/` o cachés de sistema, aplica `mount -o bind` temporal en RAM sobre `/product/fonts/` y `/data/fonts/files/`. Al reiniciar sin root temporal, tu equipo vuelve limpio a stock.

### Guía de Instalación
1. Descarga `ElKingTech-SFPro-TempRoot_v1.1.0.zip` desde [**Releases**](https://github.com/Elkin151123/ElKingTech-SFPro-TempRoot/releases).
2. En **KernelSU y derivados**, asegúrate de tener instalado **un único** metamódulo de montaje (`Mountify`, `meta-overlayfs`, `magic_mount_rs` o `Hybrid Mount`).
3. Instala el `.zip` desde tu gestor → **Módulos** → **Instalar desde almacenamiento**.
4. Realiza un **Soft Reboot** (root temporal) o **Reinicio normal** (root permanente).
   > **Samsung One UI:** Deja seleccionada la fuente **Predeterminada** en *Ajustes → Pantalla → Tamaño y estilo de fuente*.
5. **Si alguna app no cambia:** desactiva **`Umount modules`** para esa app en tu gestor y haz otro *Soft Reboot*.

### Verificar Firma de Marca (Opcional)
```sh
getprop | grep elkingtech
```

---

## 🇬🇧 English

An **ultra-lightweight (~430 KB), 100% systemless, non-destructive** module to apply **iOS SF Pro Display Bold/Black** typography on Android 12–16, optimized for **TranssionOS (Tecno HiOS / Infinix XOS)**, **Samsung One UI**, **HyperOS**, and **AOSP/Pixel** on **Temporary Root** (**DirtyFrag / DFRoot**, **KernelSU / Next**, **BakaSU**, **SukiSU**, **APatch**, and **Magisk**).

Designed to pair cleanly with [**ElKingTech-iOS-Emoji-TempRoot**](https://github.com/Elkin151123/ElKingTech-iOS-Emoji-TempRoot).

### Why v1.1.0 applies reliably while staying Temp-Root Safe
* **Full TranssionOS (Tecno HiOS / Infinix XOS) support:** Beyond `Roboto*.ttf` (`Roboto-Regular.ttf`, `RobotoFlex-Regular.ttf`, `RobotoStatic-Regular.ttf`) and `GoogleSans*.ttf`, it automatically maps Transsion fonts: `TranSans*Shell.ttf`, `TOS_VF.ttf`, and `TransSans_*.ttf` / `TranSans_*.ttf`.
* **Ultra-lightweight hardlinks:** Uses a single valid TrueType font (`SF-Pro-Display-Black.ttf`, `426 KB`) linked without wasting `/data` storage.
* **Android 12–16 compatible:** No `SDK=36`-only lock, no interactive volume-key timeout, and no third-party notification spam.
* **Preserves clocks & emojis:** Explicitly skips `*Clock*`, `*Mono*`, `*Emoji*`, and `*Symbol*`.
* **Zero permanent `/data` deletions:** Uses temporary RAM `mount -o bind` on `/product/fonts/` and `/data/fonts/files/` instead of deleting system font caches. A full reboot without temp root leaves your phone completely stock.

### Installation Guide
1. Download `ElKingTech-SFPro-TempRoot_v1.1.0.zip` from [**Releases**](https://github.com/Elkin151123/ElKingTech-SFPro-TempRoot/releases).
2. On **KernelSU and forks**, ensure **one** mounting metamodule is installed (`Mountify`, `meta-overlayfs`, `magic_mount_rs`, or `Hybrid Mount`).
3. Flash the `.zip` in your Root Manager → **Modules** → **Install from storage**.
4. Perform a **Soft Reboot** (temp root) or **Normal Reboot** (permanent root).
   > **Samsung One UI:** Keep *Default* font selected in *Settings → Display → Font size and style*.
5. **If specific apps don't change:** disable **`Umount modules`** for those apps in your manager and perform another *Soft Reboot*.

### Verify Brand Signature (Optional)
```sh
getprop | grep elkingtech
```

---

## Créditos & Comunidad / Credits & Community
* **Autor / Developer:** Elkin Wilson Alejandro Dominguez (**ELKIN**) — ElKing Tech Solutions (Santa Elena, Ecuador)
* **Canal de Telegram / Telegram Channel:** [t.me/ElKingTechSolutions](https://t.me/ElKingTechSolutions)
