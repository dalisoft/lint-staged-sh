#!/bin/sh
set -eu

# Exports for binaries access
export PATH="./node_modules/.bin:$PATH"

# CLI app name/prefix
readonly CLI_PREFIX="[lintstaged-sh]"

# Helpers
log() {
  echo "$CLI_PREFIX $1"
}

MARKDOWN_FILES=""
TJSX_FILES=""
JSON_FILES=""
YAML_FILES=""
HTML_FILES=""
CSS_FILES=""

for file in $(git diff --name-only --cached --diff-filter=ACMR); do
  case "$file" in
  *.md)
    MARKDOWN_FILES="$MARKDOWN_FILES $file"
    ;;
  *.js | *.jsx | *.ts | *.tsx)
    TJSX_FILES="$TJSX_FILES $file"
    ;;
  *.json)
    JSON_FILES="$JSON_FILES $file"
    ;;
  *.yml | *.yaml)
    YAML_FILES="$YAML_FILES $file"
    ;;
  *.html)
    HTML_FILES="$HTML_FILES $file"
    ;;
  *.css | *.scss | *.sass | *.less)
    CSS_FILES="$CSS_FILES $file"
    ;;
  esac
done

MARKDOWN_FILES=$(echo "$MARKDOWN_FILES" | awk '{$1=$1}1')
TJSX_FILES=$(echo "$TJSX_FILES" | awk '{$1=$1}1')
JSON_FILES=$(echo "$JSON_FILES" | awk '{$1=$1}1')
YAML_FILES=$(echo "$YAML_FILES" | awk '{$1=$1}1')
HTML_FILES=$(echo "$HTML_FILES" | awk '{$1=$1}1')
CSS_FILES=$(echo "$CSS_FILES" | awk '{$1=$1}1')

# Markdown files
if [ ${#MARKDOWN_FILES} -gt 1 ]; then
  log "Markdown linting started"
  if [ "$(command -v dprint)" ] && [ -f "./dprint.json" ]; then
    log "Markdown [dprint] linting..."
    dprint check --log-level=warn "${MARKDOWN_FILES}"
    log "Markdown [dprint] linting done"
  else
    log "dprint binary and/or configuration are not installed"
  fi
  if [ "$(command -v markdownlint)" ]; then
    log "Markdown [markdownlint] linting..."
    markdownlint "${MARKDOWN_FILES}"
    log "Markdown [markdownlint] done..."
  else
    log "markdownlint binary is not installed"
  fi
  log "Markdown linting done\n"
fi

# tsx/ts/jsx/js
if [ ${#TJSX_FILES} -gt 1 ]; then
  log "JS(X)/TS(X) linting started"
  if [ "$(command -v biome)" ] && [ -f "./biome.json" ]; then
    log "JS(X)/TS(X) [biome] linting..."
    biome check --diagnostic-level=warn "${TJSX_FILES}"
    log "JS(X)/TS(X) [biome] linting done"
  else
    log "biome binary and/or configuration are not installed"
  fi
  log "JS(X)/TS(X) linting done\n"
fi

# json
if [ ${#JSON_FILES} -gt 1 ]; then
  log "JSON linting started"
  if [ "$(command -v jsona)" ]; then
    log "JSON [jsona] linting..."
    jsona fmt --option trailing_newline=true --check "${JSON_FILES}"
    log "JSON [jsona] linting done"
  elif [ "$(command -v spectral)" ]; then
    if [ -f "./.spectral.yaml" ] || [ -f "./.spectral.yml" ]; then
      log "JSON [spectral] linting..."
      spectral lint --ignore-unknown-format "${JSON_FILES}"
      log "JSON [spectral] linting done"
    else
      log "JSON [spectral] config not found"
    fi
  else
    log "spectral-lint binary is not installed"
  fi
  log "JSON linting done\n"
fi

# yaml
if [ ${#YAML_FILES} -gt 1 ]; then
  log "YAML linting started"
  if [ "$(command -v spectral)" ]; then
    if [ -f "./.spectral.yaml" ] || [ -f "./.spectral.yml" ]; then
      log "YAML [spectral] linting..."
      spectral lint --ignore-unknown-format "${YAML_FILES}"
      log "YAML [spectral] linting done"
    else
      log "YAML [spectral] config not found"
    fi
  else
    log "spectral-lint binary is not installed"
  fi
  log "YAML linting done\n"
fi

# html
if [ ${#HTML_FILES} -gt 1 ]; then
  log "HTML linting started"
  if [ "$(command -v htmllint)" ]; then
    log "HTML [htmllint] linting..."
    htmllint "${HTML_FILES}"
    log "HTML [htmllint] linting done"
  else
    log "htmlhint binary is not installed"
  fi
  log "HTML linting done\n"
fi

# css
if [ ${#CSS_FILES} -gt 1 ]; then
  log "CSS linting..."
  if [ "$(command -v stylelint)" ]; then
    log "CSS [stylelint] linting..."
    stylelint --color "${CSS_FILES}"
    log "CSS [stylelint] linting done"
  else
    log "stylelint binary is not installed"
  fi
  log "CSS linting done\n"
fi

PRETTIER_FILES=$(echo "${MARKDOWN_FILES} ${TJSX_FILES} ${JSON_FILES} ${YAML_FILES} ${HTML_FILES} ${CSS_FILES}" | awk '{$1=$1}1')

if [ ${#PRETTIER_FILES} -gt 4 ]; then
  log "Prettier overall linting..."
  if [ "$(command -v prettier)" ]; then
    log "Prettier overall linting started"
    prettier -c ${PRETTIER_FILES}
    log "Prettier overall linting done\n"
  fi
fi

# Dockerfile
if [ "$(command -v dockerfilelint)" ] && [ -f "./Dockerfile" ]; then
  log "Dockerfile linting..."
  dockerfilelint "Dockerfile"
  log "Dockerfile linting done\n"
fi
