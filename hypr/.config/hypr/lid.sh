#!/usr/bin/env sh

EXTERNAL="DP-3"
INTERNAL="eDP-1"

if hyprctl monitors | grep -q "$EXTERNAL"; then
    # Externer Monitor ist angeschlossen
    if [ "$1" = "close" ]; then
        # Lid zu -> internen Monitor deaktivieren
        hyprctl keyword monitor "$INTERNAL, disable"
    else
        # Lid offen -> internen Monitor links vom externen platzieren
        hyprctl keyword monitor "$INTERNAL, preferred, 0x0, 1"
    fi
else
    # Kein externer Monitor -> interner IMMER aktiv
    hyprctl keyword monitor "$INTERNAL, preferred, auto, 1"
fi
