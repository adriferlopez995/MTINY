#!/usr/bin/env bash
# Genera www/index.html (documento completo para Capacitor) a partir de app-body.html.
# Si existe node_modules/@fontsource/fredoka, copia la fuente a www/fonts para que funcione sin internet.
set -euo pipefail
cd "$(dirname "$0")"
mkdir -p www
FONTDIR="node_modules/@fontsource/fredoka/files"
LOCAL_FONT=0
if [ -d "$FONTDIR" ]; then
  mkdir -p www/fonts
  for w in 500 600 700; do
    cp "$FONTDIR/fredoka-latin-$w-normal.woff2" www/fonts/
  done
  LOCAL_FONT=1
fi
{
  printf '%s\n' '<!doctype html>' '<html lang="es">' '<head>' '<meta charset="utf-8">' \
    '<meta name="viewport" content="width=device-width,initial-scale=1,viewport-fit=cover,user-scalable=no">' \
    '<meta name="theme-color" content="#E8F6FF">'
  if [ "$LOCAL_FONT" = "1" ]; then
    printf '%s\n' '<style>' \
      '@font-face{font-family:"Fredoka";font-weight:500;font-style:normal;font-display:swap;src:url(fonts/fredoka-latin-500-normal.woff2) format("woff2")}' \
      '@font-face{font-family:"Fredoka";font-weight:600;font-style:normal;font-display:swap;src:url(fonts/fredoka-latin-600-normal.woff2) format("woff2")}' \
      '@font-face{font-family:"Fredoka";font-weight:700;font-style:normal;font-display:swap;src:url(fonts/fredoka-latin-700-normal.woff2) format("woff2")}' \
      '</style>'
  fi
  printf '%s\n' '</head>' '<body>'
  if [ "$LOCAL_FONT" = "1" ]; then
    grep -v 'fonts.googleapis.com' app-body.html
  else
    cat app-body.html
  fi
  printf '%s\n' '</body>' '</html>'
} > www/index.html
echo "OK: www/index.html (fuente local: $LOCAL_FONT)"
