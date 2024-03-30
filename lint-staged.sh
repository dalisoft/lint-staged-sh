#!/usr/bin/env bash

set -eu

# Exports for binaries access
export PATH="./node_modules/.bin:$PATH"

# CLI app name/prefix
readonly CLI_PREFIX="[lintstaged-sh]"

# Helpers
log() {
  echo -e "$CLI_PREFIX $1"
}

MARKDOWN_FILES=()
TJSX_FILES=()
JSON_YML_FILES=()
HTML_FILES=()
CSS_FILES=()

while read -r file; do
  case "$file" in
  *.md)
    MARKDOWN_FILES+=("$file")
    ;;
  *.js | *.jsx | *.ts | *.tsx)
    TJSX_FILES+=("$file")
    ;;
  *.json | *.yml | *.yaml)
    JSON_YML_FILES+=("$file")
    ;;
  *.html)
    HTML_FILES+=("$file")
    ;;
  *.css | *.scss | *.sass | *.less)
    CSS_FILES+=("$file")
    ;;
  esac
done <<<"$(git diff --name-only --cached)"

# Markdown files
if [ ${#MARKDOWN_FILES[@]} -gt 0 ]; then
  log "Markdown linting started"
  if [ "$(command -v dprint)" ] && [ -f "./dprint.json" ]; then
    log "Markdown [dprint] linting..."
    dprint check --log-level=warn "${MARKDOWN_FILES[*]}"
    log "Markdown [dprint] linting done"
  else
    log "dprint binary and/or configuration are not installed"
  fi
  if [ "$(command -v markdownlint)" ]; then
    log "Markdown [markdownlint] linting..."
    markdownlint "${MARKDOWN_FILES[*]}"
    log "Markdown [markdownlint] done..."
  else
    log "markdownlint binary is not installed"
  fi
  log "Markdown linting done\n"
fi

# tsx/ts/jsx/js
if [ ${#TJSX_FILES[@]} -gt 0 ]; then
  echo "${TJSX_FILES[@]}"
  log "JS(X)/TS(X) linting started"
  if [ "$(command -v biome)" ] && [ -f "./biome.json" ]; then
    log "JS(X)/TS(X) [biome] linting..."
    biome check --diagnostic-level=warn "${TJSX_FILES[@]}"
    log "JS(X)/TS(X) [biome] linting done"
  else
    log "biome binary and/or configuration are not installed"
  fi
  log "JS(X)/TS(X) linting done\n"
fi

# json/yaml
if [ ${#JSON_YML_FILES[@]} -gt 0 ]; then
  log "JSON/YAML linting started"
  if [ "$(command -v spectral)" ]; then
    log "JSON/YAML [spectral] linting..."
    spectral lint --ignore-unknown-format "${JSON_YML_FILES[*]}"
    log "JSON/YAML [spectral] linting done"
  elif [ "$(command -v jsonymllint)" ]; then
    log "JSON/YAML [jsonyamllint] linting..."
    log "spectral-lint binary is not installed, but we use jsonymllint"
    jsonymllint "${JSON_YML_FILES[*]}"
    log "JSON/YAML [jsonyamllint] linting done"
  else
    log "spectral-lint and jsonymllint binaries is not installed"
  fi
  log "JSON/YAML linting done\n"
fi

# html
if [ ${#HTML_FILES[@]} -gt 0 ]; then
  log "HTML linting started"
  if [ "$(command -v htmllint)" ]; then
    log "HTML [htmllint] linting..."
    htmllint "${HTML_FILES[*]}"
    log "HTML [htmllint] linting done"
  else
    log "htmlhint binary is not installed"
  fi
  log "HTML linting done\n"
fi

# css
if [ ${#CSS_FILES[@]} -gt 0 ]; then
  log "CSS linting..."
  if [ "$(command -v stylelint)" ]; then
    log "CSS [stylelint] linting..."
    stylelint --color "${CSS_FILES[*]}"
    log "CSS [stylelint] linting done"
  else
    log "stylelint binary is not installed"
  fi
  log "CSS linting done\n"
fi

PRETTIER_FILES=("${MARKDOWN_FILES[@]}" "${TJSX_FILES[@]}" "${JSON_YML_FILES[@]}" "${HTML_FILES[@]}" "${CSS_FILES[@]}")
log "Prettier overall linting..."
if [ ${#PRETTIER_FILES[@]} -gt 0 ]; then
  if [ "$(command -v prettier)" ]; then
    log "Prettier overall linting started"
    prettier -c "${PRETTIER_FILES[@]}"
    log "Prettier overall linting done\n"
  fi
fi

# Dockerfile
if [ "$(command -v dockerfilelint)" ] && [ -f "./Dockerfile" ]; then
  log "Dockerfile linting..."
  dockerfilelint "Dockerfile"
  log "Dockerfile linting done\n"
fi
