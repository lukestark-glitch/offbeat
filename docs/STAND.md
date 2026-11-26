# Stand der Offbeat-Familie

Bestandsaufnahme vom 26.11.2026. Geprüft gegen `OFFBEAT_AUFTRAG.md`, `AUFTRAG_BOUNCE_PREVIEW.md` und `OFFBEAT_ZUSATZ.md`.

Bei Widersprüchen gilt der Bestand: Die Repos bleiben öffentlich, die Übersicht lebt in diesem Repo, und Octave bleibt bei +1.

Legende: **erledigt** · **fehlt** (wird in Phase A gebaut, Doku in Phase B) · **widerspricht** (dem Bestand; was gilt, steht dahinter)

Release **v1.0.0** ist in allen fünf Repos getaggt. Es enthält die Formate VST3, VST2, AU, CLAP und LV2 (Turbo und Hydraulics zusätzlich LADSPA), README, Code-Doku, Lizenz und die CI.

## OFFBEAT_AUFTRAG.md

| Punkt | Stand |
|---|---|
| 0 Repo offbeat-synth → offbeat-engine, Remote, Ordner | **erledigt**: Remote und lokaler Ordner heißen `offbeat-engine` |
| 0 Bilder aus `plugins-logos` | **erledigt**: Auto, Motorrad, Turbolader und Lowrider sind eingebaut |
| 0 neue Repos **privat** | **widerspricht**: Die Repos bleiben öffentlich (Entscheidung des Nutzers) |
| 1 Familie, Reihenfolge, gemeinsamer Look | **erledigt**: OffbeatKit, Zahleneingabe, JSON, Renderer mit `--check` in allen vier |
| 1 Submodule vs. Kopie begründen | **erledigt**: bewusste Kopie, Begründung in `docs/CODE.md` jedes Repos |
| 2 LMMS/Carla, LV2 + VST3, kein CLAP in Carla | **erledigt**; zusätzlich gibt es VST2, AU und CLAP für andere DAWs |
| 2 LADSPA für Turbo und Hydraulics | **erledigt**: als `.so` im LMMS-Ordner, Standardwerte auf LADSPA-Stufen abgestimmt |
| 2 Noten-Versatz, Oktav-Regler | **erledigt**: Octave mit Standard +1 in Engine und Topline |
| 2 Tempo-Fallback, Tempo in LMMS prüfen | **erledigt**: Host-Tempo + BPM-Regler. Laut seinen Symbolen ruft LMMS das Tempo ab; ein Hörtest in LMMS steht noch aus |
| 2 Parameter nur anhängen, IDs nie ändern, nur DPF | **erledigt** |
| 3.1 Engine-Anzeigename, URI unverändert | **erledigt**: Die URI enthält weiterhin `offbeat-synth` |
| 3.2 Topline-Ziele, Renderer-Abnahme | **erledigt**: 10 von 10 Presets bestehen |
| 3.3 Turbo-Kette, Ladedruck, Anzeige, LADSPA, Offline-Werkzeug | **erledigt**; zusätzlich gibt es Auto-Lautheit |
| 3.4 Hydraulics-Machbarkeit, robustester Weg | **erledigt**: Trigger über den LMMS-Peak-Controller, in LMMS getestet |
| 4 `docs/PLAN.md` mit „Offene Fragen“, `docs/HANDOFF.md`, CLAUDE.md | **widerspricht**: Auf Wunsch des Nutzers durch README und `docs/CODE.md` ersetzt. Der Bestand gilt, es gibt also keine CLAUDE.md, PLAN.md oder HANDOFF.md in den Plugin-Repos. Der Branch-Stand für Phase A steht unten in dieser Datei; die Regeln aus OFFBEAT_ZUSATZ §1–2 hat sich Claude im Projekt-Gedächtnis gemerkt |
| 4 Checklisten in PRs, selbst mergen | **erledigt** |
| 4 `docs/FAMILIE.md` in offbeat-engine | **widerspricht**: Die Übersicht lebt in diesem Repo (README.md, SETUP.md); keine doppelte FAMILIE.md |

## AUFTRAG_BOUNCE_PREVIEW.md

| Punkt | Stand |
|---|---|
| 1 `docs/BOUNCE_VIDEO.md` mit den Messwerten | **fehlt**: Doku, kommt in Phase B. Die Werte nutze ich beim Bauen |
| 2.1 Modus „Kick+Bass“ (Combo): Bass auf dem Offbeat, gleich laut, Sprung 24 Halbtöne in 12 ms, Bass-Ton relativ zur Note | **fehlt** |
| 2.2 Bounce-Sektion „Glue“ (EQ → Glue → Sättigung → Clipper) mit Regler „Dichte“ für Kick, Bass und Combo | **fehlt** |
| 2.3 Kick Attack Standard 0 ms | **fehlt**: Bestand ist 1 ms. Die Prüfung „weiche Einblendung“ wird für Attack 0 angepasst, denn eine Rundung am Anfang ist laut Video unerwünscht |
| 2.4 Presets „Kick – Bounce 160“ und „Kick+Bass – Bounce 160“ | **fehlt**; sie kommen ans Ende der Liste |
| 2 Abnahme (Tonhöhe 208/152/97/69 Hz ±10 %, Kick = Bass ±1 dB, Crest 6,5–8 dB, kein Clipping) | **fehlt** |
| 3A Wellenform-Fenster (echter DSP, Ebenen, Offbeat-Linie, Dichte, Spitze) | **fehlt**: neuer Baustein im OffbeatKit |
| 3B Vorhör-Knöpfe (pro Ebene, alle, Loop; Ausgabe über das Plugin; Host-Noten haben Vorrang) | **fehlt** |
| 3C Design im Theme jedes Plugins | **fehlt** |
| 3D Einbau in Engine, Topline, Turbo (Demo-Loop vorher/nachher) und Hydraulics (Pad mit/ohne Pumpen) | **fehlt** |
| 3D LADSPA ohne Vorschau dokumentieren | **fehlt**: Doku, Phase B |
| 3 Abnahme: Vorschau bitgleich zum Renderer, ohne Knackser | **fehlt** |

## OFFBEAT_ZUSATZ.md

| Punkt | Stand |
|---|---|
| Abschnitte 1 und 2 in die CLAUDE.md aller Repos | **widerspricht**: Im Bestand gibt es keine CLAUDE.md mehr (siehe oben). Die Regeln stehen in Claudes Projekt-Gedächtnis und hier |
| 1 Phase A: Feature-Branches, Commits mit `[skip ci]`, keine PRs, kein Merge, keine Workflow-Läufe | gilt ab jetzt |
| 1 Phase A: nur `docs/HANDOFF.md` als Doku | **widerspricht**: Es gibt keine HANDOFF.md mehr; der Branch-Stand steht stattdessen unten in dieser Datei |
| 2 höchstens 2 lokale Builds gleichzeitig; Builds auf GitHub nur durch den Haupt-Agenten, nacheinander | gilt ab jetzt |
| 2 `concurrency`-Gruppe pro Repo und Branch | **fehlt** (Workflow-Änderung, in Phase A mit `[skip ci]`) |
| 2 macOS-Jobs nur bei PRs nach main und bei `workflow_dispatch`, `timeout-minutes: 30` | **fehlt** |
| 2 Mac-Job höchstens einmal neu starten, sonst lokal `make check` | gilt (vom Nutzer freigegeben) |
| 2 Actions-Minuten prüfen | Phase B |
| 3 FL Studio: MIDI-CC-Parameter in VST3 abschalten | **widerspricht**: Abschalten ginge nur durch eine Änderung in DPF. DPF markiert die Parameter schon als versteckt (`V3_PARAM_IS_HIDDEN`), FL Studio und Ableton zeigen sie also nicht an. Über sie kommen in VST3 außerdem „All Notes Off“ (CC 120/123) an. Standard: DPF unverändert lassen |
| 3 FL Studio: Host-Tempo | **erledigt** |
| 3 Universal-Build als Option, Standard x86_64 | **widerspricht**: Im Bestand ist Universal (x86_64 + arm64) der Standard, und v1.0.0 ist so veröffentlicht. Bestand gilt; dazu kommt die Option `UNIVERSAL=false` für reine x86_64-Builds (**fehlt**) |
| 3 `tools/update-all.sh` in offbeat-engine (pull, bauen, install, laufende DAWs erkennen, Versionen ausgeben) | **fehlt** |
| 3 Versionsnummer klein in allen GUIs (`git describe`) | **fehlt** |
| 3 Standalone-Apps Engine und Topline (CoreAudio ohne JACK, MIDI-Keyboard, Bildschirm- und Computer-Tastatur, Oktave ±, Installation nach `~/Applications`) | **fehlt**. DPF kann es: Die Standalone-Version hat RtAudio (CoreAudio) und RtMidi eingebaut, eine JACK-Installation ist nicht nötig. `make standalone` gibt es schon, bisher nur für die Doku-Bilder |
| 3 JSON für LADSPA (Turbo, Hydraulics) | teilweise **erledigt**: `turbo-render`/`hydraulics-render --json` rechnen mit JSON. **Fehlt** (vorsichtige Lösung): Die Renderer geben zu einem JSON die passenden LMMS-Reglerwerte aus (`--lmms-values`), damit man sie im LADSPA-Fenster einstellen kann. Eingriffe in LMMS-Projektdateien gibt es nicht |

## Branch-Stand Phase A

Eine Zeile pro Branch (fertig / offen). Die Commits beginnen mit `[skip ci]`; es gibt keine PRs.

| Repo | Branch | Stand |
|---|---|---|
| offbeat-engine | `phase-a` | **fertig** (8e373e1): Modus Kick+Bass, Dichte, Kick Attack Standard 0, Presets „Kick – Bounce 160“ und „Kick+Bass – Bounce 160“ mit Abnahme, Vorschau mit Ebenen je Modus und Vorhören, Standalone-App, Versionsnummer, `UNIVERSAL=false`, `tools/update-all.sh`, CI-Regeln. `make check` 14× BESTANDEN |
| offbeat-topline | `phase-a` | **fertig** (5548905): Vorschau Ton/Phrase und Vorhören, Standalone-App, Versionsnummer, `UNIVERSAL=false`, CI-Regeln. `make check` BESTANDEN |
| offbeat-turbo | `phase-a` | **fertig** (b695408): Vorschau mit Demo-Loop (Engine-DSP) vorher/nachher und Vorhören, `--lmms-values` für LADSPA, Versionsnummer, `UNIVERSAL=false`, CI-Regeln. `make check` BESTANDEN |
| offbeat-hydraulics | `phase-a` | **fertig** (dd56b48): Vorschau mit Demo-Pad ohne/mit Pumpen und Pump-Kurve, Vorhören, `--lmms-values` für LADSPA, Versionsnummer, `UNIVERSAL=false`, CI-Regeln. `make check` BESTANDEN |
| offbeat | `phase-a` | diese Datei |

Hinweise für Phase B:

- Vorhören in allen vier: Play im Host beendet es, und solange der Host spielt, startet keins (Rückmeldung des Nutzers aus Carla). Host-Noten bzw. Host-Audio am Eingang beenden es ebenfalls.
- Die versteckten Vorhör-Parameter erscheinen in der LADSPA-Version (LMMS) als Regler ohne Wirkung; LADSPA hat keine Vorschau. Das kommt in die README.
- macOS-CI läuft auch auf Tags (für das Release-ZIP); das ist Absicht und kommt in die Doku.
- Turbo bekommt jetzt Zeitinfo vom Host (nur für den Play-Stopp beim Vorhören).
- Offen: Topline ist neben Engine leiser (Demo-Projekt gleicht es über die Lautstärke aus).
- FL Studio: die MIDI-CC-Parameter der VST3-Version bleiben, wie sie sind (siehe oben).
