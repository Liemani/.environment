#!/usr/bin/env bash

set -euo pipefail

if [ "$#" -ne 1 ]; then
  printf 'Usage: renderer.sh <environment-root>\n' >&2
  exit 1
fi

ENVIRONMENT="$1"
CONFIG="$ENVIRONMENT/config"
PROFILE="$ENVIRONMENT/profile/profile.ini"
EFFECTIVE="$ENVIRONMENT/effective"
RUNTIME="$ENVIRONMENT/lib/runtime"
TEMPORARY=""
BACKUP=""
PROFILE_KEYS=()
PROFILE_VALUES=()

cleanup() {
  if [ -n "$TEMPORARY" ] && [ -d "$TEMPORARY" ]; then
    rm -rf "$TEMPORARY"
  fi
}

trap cleanup EXIT

fail() {
  printf '%s\n' "$1" >&2
  exit 1
}

is_identifier() {
  case "$1" in
    [A-Za-z_]*) ;;
    *) return 1 ;;
  esac

  case "$1" in
    *[!A-Za-z0-9_]*|'') return 1 ;;
    *) return 0 ;;
  esac
}

load_profile() {
  local line key value existing_key index line_number

  line_number=0
  while IFS= read -r line || [ -n "$line" ]; do
    line_number=$((line_number + 1))

    if [ -z "$line" ]; then
      continue
    fi

    case "$line" in
      *=*)
        key=${line%%=*}
        value=${line#*=}
        ;;
      *)
        fail "Invalid profile entry at line $line_number: expected key=value"
        ;;
    esac

    if ! is_identifier "$key"; then
      fail "Invalid profile key at line $line_number: $key"
    fi

    index=0
    while [ "$index" -lt "${#PROFILE_KEYS[@]}" ]; do
      existing_key=${PROFILE_KEYS[$index]}
      if [ "$existing_key" = "$key" ]; then
        fail "Duplicate profile key: $key"
      fi
      index=$((index + 1))
    done

    PROFILE_KEYS+=("$key")
    PROFILE_VALUES+=("$value")
  done < "$PROFILE"
}

lookup_profile_value() {
  local key="$1" index

  index=0
  while [ "$index" -lt "${#PROFILE_KEYS[@]}" ]; do
    if [ "${PROFILE_KEYS[$index]}" = "$key" ]; then
      RENDER_VALUE=${PROFILE_VALUES[$index]}
      return 0
    fi
    index=$((index + 1))
  done

  return 1
}

render_line() {
  local input="$1" output="" character remainder next_character key

  while [ -n "$input" ]; do
    character=${input%"${input#?}"}

    if [ "$character" = '\' ]; then
      remainder=${input#?}
      next_character=${remainder%"${remainder#?}"}

      if [ "$next_character" = '(' ]; then
        input=${remainder#?}

        case "$input" in
          *')'*)
            key=${input%%)*}
            input=${input#*)}
            ;;
          *)
            fail "Invalid placeholder in $RENDER_FILE at line $RENDER_LINE: missing )"
            ;;
        esac

        if ! is_identifier "$key"; then
          fail "Invalid placeholder in $RENDER_FILE at line $RENDER_LINE: \\($key)"
        fi

        if ! lookup_profile_value "$key"; then
          fail "Unknown profile key: $key"
        fi

        output="$output$RENDER_VALUE"
        continue
      fi
    fi

    output="$output$character"
    input=${input#?}
  done

  RENDERED_LINE=$output
}

render_file() {
  local source_file="$1" destination_file="$2" line has_newline

  RENDER_FILE=${source_file#"$CONFIG"/}
  RENDER_LINE=0

  while :; do
    line=""
    if IFS= read -r line; then
      has_newline=1
    elif [ -n "$line" ]; then
      has_newline=0
    else
      break
    fi

    RENDER_LINE=$((RENDER_LINE + 1))
    render_line "$line"
    if [ "$has_newline" -eq 1 ]; then
      printf '%s\n' "$RENDERED_LINE"
    else
      printf '%s' "$RENDERED_LINE"
      break
    fi
  done < "$source_file" > "$destination_file"
}

if [ ! -d "$CONFIG" ]; then
  printf 'Configuration source directory is missing: %s\n' "$CONFIG" >&2
  exit 1
fi

if [ ! -d "$RUNTIME" ]; then
  printf 'Runtime implementation directory is missing: %s\n' "$RUNTIME" >&2
  exit 1
fi

if [ ! -f "$PROFILE" ]; then
  printf 'Profile is missing: %s\n' "$PROFILE" >&2
  printf 'Copy profile/profile.ini.sample to profile/profile.ini, then edit it.\n' >&2
  exit 1
fi

load_profile

TEMPORARY="$(mktemp -d "$ENVIRONMENT/.effective.tmp.XXXXXX")"

while IFS= read -r -d '' source_file; do
  relative_path=${source_file#"$CONFIG"/}
  destination_file="$TEMPORARY/$relative_path"
  mkdir -p "$(dirname "$destination_file")"
  render_file "$source_file" "$destination_file"
done < <(find "$CONFIG" -type f -print0)

cp -R "$RUNTIME/." "$TEMPORARY/runtime"

if [ -e "$EFFECTIVE" ]; then
  BACKUP="$ENVIRONMENT/.effective.previous.$$"
  mv "$EFFECTIVE" "$BACKUP"
fi

if mv "$TEMPORARY" "$EFFECTIVE"; then
  TEMPORARY=""
  if [ -n "$BACKUP" ]; then
    rm -rf "$BACKUP"
  fi
else
  if [ -n "$BACKUP" ]; then
    mv "$BACKUP" "$EFFECTIVE"
  fi
  exit 1
fi
