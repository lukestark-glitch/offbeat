# Offbeat – Setup-Anleitung

Hier steht, wie du die Offbeat-Plugins auf **Windows, macOS und Linux** installierst und in deiner DAW benutzt (FL Studio, Ableton Live, Logic, Bitwig, Reaper, LMMS, Carla).

- [1. Welches Format brauche ich?](#1-welches-format-brauche-ich)
- [2. Herunterladen](#2-herunterladen)
- [3. Installieren](#3-installieren) – [macOS](#macos) · [Windows](#windows) · [Linux](#linux)
- [4. In der DAW](#4-in-der-daw) – [FL Studio](#fl-studio) · [Ableton Live](#ableton-live) · [Logic Pro / GarageBand](#logic-pro--garageband) · [Bitwig / Reaper](#bitwig-studio--reaper) · [LMMS](#lmms) · [Carla](#carla)
- [5. Selbst bauen](#5-selbst-bauen)
- [6. Probleme lösen](#6-probleme-lösen)

## 1. Welches Format brauche ich?

| DAW | macOS | Windows | Linux |
|---|---|---|---|
| FL Studio 20/21 | VST3 oder AU | VST3 | – |
| FL Studio 2024+ | CLAP, VST3 oder AU | CLAP oder VST3 | – |
| Ableton Live 11/12 | VST3 oder AU | VST3 | – |
| Ableton Live 10 | VST2 oder AU | VST2 | – |
| Logic Pro, GarageBand | AU | – | – |
| Bitwig Studio | CLAP oder VST3 | CLAP oder VST3 | CLAP oder VST3 |
| Reaper | CLAP, VST3 oder AU | CLAP oder VST3 | CLAP, VST3 oder LV2 |
| LMMS 1.2 | Instrumente: LV2 in Carla; Effekte: LADSPA | genauso | genauso |
| Carla | LV2 (empfohlen), VST3, VST2 | genauso | genauso |

**Faustregel:**
- Nimm **VST3**.
- In Logic nimmst du **AU**.
- In LMMS nimmst du **LV2 über Carla** für Engine und Topline und **LADSPA** für Turbo und Hydraulics.

Die vier Plugins:

| Plugin | Typ | Was es tut |
|---|---|---|
| [Offbeat Engine](https://github.com/lukestark-glitch/offbeat-engine) | Instrument | Kick, Bass, Hat, Stab, Pad, Riser |
| [Offbeat Topline](https://github.com/lukestark-glitch/offbeat-topline) | Instrument | Melodie: Supersaw, Stab, Pluck, Rave-Pfeife |
| [Offbeat Turbo](https://github.com/lukestark-glitch/offbeat-turbo) | Effekt | Master-Lautheit: Glue, Clipper, True-Peak-Limiter |
| [Offbeat Hydraulics](https://github.com/lukestark-glitch/offbeat-hydraulics) | Effekt | Pumpen im Takt der Kick (Sidechain-Gefühl) |

## 2. Herunterladen

Jedes Repo baut auf GitHub automatisch fertige Plugins für alle drei Systeme:
- **Fertige Version:** In jedem Repo unter **Releases** liegen `…-macos.zip`, `…-windows.zip` und `…-linux.zip`.
- **Neuester Stand:** unter **Actions** → letzter grüner Lauf → **Artifacts**. Dafür musst du bei GitHub angemeldet sein.

Jedes ZIP enthält alle Formate, also z. B. `offbeat-topline.vst3`, `offbeat-topline.clap`, `offbeat-topline.lv2`, auf dem Mac dazu `.component` (AU) und `.vst` (VST2), auf Windows/Linux `offbeat-topline-vst.dll` bzw. `-vst.so` (VST2). Du musst nur die Formate kopieren, die deine DAW braucht.

> Der Dateiname der Engine ist aus historischen Gründen nur `offbeat` (also `offbeat.vst3`, `offbeat.lv2`, …). In der DAW heißt sie trotzdem **Offbeat Engine**.

## 3. Installieren

### macOS

Kopiere die Dateien in deinen Plugin-Ordner. Der Ordner `Library` ist im Finder versteckt; du erreichst ihn mit **Gehe zu → Gehe zum Ordner …** (⇧⌘G) und dem Pfad.

| Format | Ordner |
|---|---|
| VST3 (`.vst3`) | `~/Library/Audio/Plug-Ins/VST3/` |
| AU (`.component`) | `~/Library/Audio/Plug-Ins/Components/` |
| CLAP (`.clap`) | `~/Library/Audio/Plug-Ins/CLAP/` |
| VST2 (`.vst`) | `~/Library/Audio/Plug-Ins/VST/` |
| LV2 (`.lv2`) | `~/Library/Audio/Plug-Ins/LV2/` |
| LADSPA (`…-ladspa.dylib`) | für LMMS: in den LMMS-LADSPA-Ordner, **umbenannt auf `.so`** (siehe [LMMS](#lmms)) |

**Gatekeeper:** Die Plugins sind nicht von Apple beglaubigt. Nach dem Download aus dem Internet blockiert macOS sie darum oft („kann nicht geöffnet werden“, oder die DAW zeigt sie nicht an). Gib sie einmal im Terminal frei, zum Beispiel:

```sh
xattr -dr com.apple.quarantine ~/Library/Audio/Plug-Ins/VST3/offbeat*.vst3
xattr -dr com.apple.quarantine ~/Library/Audio/Plug-Ins/Components/offbeat*.component
xattr -dr com.apple.quarantine ~/Library/Audio/Plug-Ins/CLAP/offbeat*.clap
```

Die Mac-Version ist ein Universal-Binary und läuft auf Intel- und Apple-Silicon-Macs (M1–M4).

**Selbst gebaut:** `make install` im Repo kopiert alle Formate an die richtigen Stellen und signiert sie ad-hoc. Gatekeeper ist dann kein Thema.

### Windows

| Format | Ordner |
|---|---|
| VST3 (`.vst3`) | `C:\Program Files\Common Files\VST3\` |
| CLAP (`.clap`) | `C:\Program Files\Common Files\CLAP\` |
| VST2 (`…-vst.dll`) | ein Ordner deiner Wahl, z. B. `C:\Program Files\VSTPlugins\`; ihn in der DAW als VST2-Ordner eintragen |
| LV2 (`.lv2`) | `%APPDATA%\LV2\` |
| LADSPA (`…-ladspa.dll`) | in den LADSPA-Ordner von LMMS (in LMMS unter Einstellungen → Pfade) |

Windows warnt beim ersten Laden eventuell („SmartScreen“), weil die Dateien nicht signiert sind. Das ist bei freien Plugins normal.

### Linux

| Format | Ordner |
|---|---|
| VST3 | `~/.vst3/` |
| CLAP | `~/.clap/` |
| VST2 (`…-vst.so`) | `~/.vst/` |
| LV2 | `~/.lv2/` |
| LADSPA (`…-ladspa.so`) | `~/.ladspa/` (LMMS findet den Ordner, wenn er in Einstellungen → Pfade steht, oder über `LADSPA_PATH`) |

## 4. In der DAW

**Wichtig in jeder DAW außer LMMS:** Stell bei Engine und Topline den Regler **Octave auf 0**. Der Standard +1 gleicht einen LMMS-Fehler aus: LMMS schickt Noten eine Oktave zu tief. In allen anderen DAWs würde +1 alles eine Oktave zu hoch spielen.

**Tempo:** Engine (Bounce Sync, Roll, Pad-LFO, Riser), Topline (Delay) und Hydraulics (Host-Takt) folgen dem Tempo der DAW. Kommt keines an, schaltest du **Host-Tempo** aus und stellst **BPM** von Hand ein.

### FL Studio

1. **Plugins suchen:** Options → **Manage plugins** → „Find installed plugins“. Bei Bedarf vorher den Ordner unter „Plugin search paths“ ergänzen.
2. **Instrument** (Engine, Topline): Im Channel Rack auf **+** klicken und „Offbeat Engine“ bzw. „Offbeat Topline“ wählen.
3. **Effekt** (Turbo, Hydraulics): Im Mixer einen freien Slot anklicken und das Plugin wählen. **Turbo** kommt auf den **Master**, **Hydraulics** auf die Spur mit Bass oder Synths.
4. **Hydraulics** in FL am einfachsten mit **Source = Host-Takt** und **Rate 1/4**: Dann pumpt es auf jeder Viertel, passend zur Four-on-the-floor-Kick.

### Ableton Live

1. **Plugins einschalten:** Einstellungen → **Plug-Ins** → „VST3 Plug-In Custom Folder“ bzw. auf dem Mac „Audio Units“ einschalten → **Rescan**.
2. Im Browser unter **Plug-Ins** erscheinen Offbeat Engine und Topline (Instrumente) sowie Turbo und Hydraulics (Effekte). Zieh sie auf eine MIDI- bzw. Audiospur.
3. **Turbo** kommt als letztes Gerät auf die **Master**-Spur.
4. **Hydraulics** mit **Source = Host-Takt** auf die Bass- oder Synth-Spur legen.

### Logic Pro / GarageBand

1. Die AU-Dateien in `~/Library/Audio/Plug-Ins/Components/` legen. Logic prüft sie beim nächsten Start; im Plug-in-Manager (Logic Pro → Einstellungen → Plug-in-Manager) sollten sie als „erfolgreich“ erscheinen.
2. **Instrumente:** Auf einer Software-Instrument-Spur unter **AU Instruments → Offbeat** auswählen.
3. **Effekte:** Im Audio-FX-Slot unter **Audio Units → Offbeat** auswählen. Hydraulics ist dort ein „MIDI-gesteuerter Effekt“.

### Bitwig Studio / Reaper

- **Bitwig:** CLAP oder VST3 in die üblichen Ordner legen. Bitwig findet sie automatisch, sonst Einstellungen → Locations → Rescan.
- **Reaper:** Options → Preferences → Plug-ins → **CLAP** bzw. **VST** → „Re-scan“. Danach findest du die Plugins im FX-Browser unter „Offbeat“.

### LMMS

LMMS 1.2 lädt keine VST3- oder CLAP-Plugins direkt:

1. **Instrumente (Engine, Topline):** Spur mit **Carla Rack** anlegen, Carla öffnen, **Add Plugin** → LV2 → „Offbeat Engine“ bzw. „Offbeat Topline“ → das Zahnrad öffnet die Oberfläche. In Carla am besten **LV2** nehmen; VST3 zeigt dort rund 2000 zusätzliche MIDI-Parameter an.
2. **Effekte (Turbo, Hydraulics):** Die **LADSPA**-Datei in den LADSPA-Ordner von LMMS legen.
   - Den Ordner findest du in LMMS unter Einstellungen → Pfade, z. B. `~/Documents/lmms/plugins/ladspa/`.
   - **Die Datei muss auf `.so` enden**, auf macOS also `offbeat-turbo-ladspa.dylib` in `offbeat-turbo-ladspa.so` umbenennen. LMMS 1.2 lädt sonst nichts. `make install` macht das automatisch.
   - Danach im FX-Mixer (F9) „Add effect“ wählen und das Plugin aus der LADSPA-Liste nehmen. Turbo kommt auf den Master.
3. **Octave:** Bei Engine und Topline bleibt Octave in LMMS auf **+1** (dem Standard).
4. **Hydraulics im Takt:** Auf der Kick-Spur den **Peak Controller** einfügen und mit dem Hydraulics-Regler **Trigger** verbinden. Die Schritte stehen im README von offbeat-hydraulics.
5. Ein fertiges Beispiel-Projekt mit allen vier Plugins liegt im Übersichts-Repo unter `demo/`.

### Carla

**Add Plugin** → **Refresh** → Offbeat suchen. LV2 empfohlen. Das Zahnrad öffnet die Oberfläche. Effekte in Carla wirken nur auf Klänge aus demselben Carla.

## 5. Selbst bauen

Einzige Abhängigkeit ist [DPF](https://github.com/DISTRHO/DPF). Es kommt als Git-Submodule mit.

```sh
git clone --recurse-submodules https://github.com/lukestark-glitch/offbeat-engine
cd offbeat-engine
make          # Plugins nach bin/, dazu der Offline-Renderer
make check    # Klang-Prüfung mit dem Renderer
make install  # nur macOS: alles in ~/Library/Audio/Plug-Ins kopieren und signieren
```

| System | Was du brauchst |
|---|---|
| macOS | Xcode Command Line Tools (`xcode-select --install`) |
| Windows | [MSYS2](https://www.msys2.org/), darin im MINGW64-Terminal: `pacman -S make vim mingw-w64-x86_64-gcc mingw-w64-x86_64-pkg-config` |
| Linux (Debian/Ubuntu) | `sudo apt install build-essential pkg-config xxd libgl1-mesa-dev libx11-dev libxext-dev libxrandr-dev libxcursor-dev libdbus-1-dev` |

Alle vier Plugins auf einmal baust du mit dem Übersichts-Repo `offbeat`: `git clone --recurse-submodules https://github.com/lukestark-glitch/offbeat && cd offbeat && make`.

## 6. Probleme lösen

| Problem | Lösung |
|---|---|
| DAW findet das Plugin nicht | Liegt es im richtigen Ordner (siehe oben)? In der DAW neu scannen. Auf dem Mac die Quarantäne entfernen (`xattr`, siehe oben). |
| Logic meldet „AU validation failed“ | Plug-in-Manager → „Zurücksetzen und erneut prüfen“. Bei Builds von GitHub vorher `xattr -dr com.apple.quarantine …` ausführen. |
| Alles klingt eine Oktave zu hoch/tief | Octave: 0 in FL/Ableton/Logic/Bitwig/Reaper, +1 in LMMS. |
| LMMS: „Unknown LADSPA plugin“ | Die Datei muss auf `.so` enden und im LADSPA-Ordner aus Einstellungen → Pfade liegen. |
| Hydraulics pumpt nicht | Source prüfen. Host-Takt braucht laufenden Transport; Trigger braucht einen verbundenen Controller; MIDI braucht Noten am Plugin. |
| Delay, Roll oder LFO passen nicht zum Tempo | **Host-Tempo** ausschalten und **BPM** von Hand setzen. |
| Oberfläche bleibt schwarz | Eine Grafikkarte bzw. ein Treiber mit OpenGL 2 wird gebraucht. In virtuellen Maschinen fehlt das oft. |
