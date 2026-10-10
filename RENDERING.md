# Rendering Specification

`build.sh` renders every file in `config/` into the matching path under
`generated/`.

## Profile Format

`profile/profile.toml` uses a restricted TOML subset: top-level identifier
keys with single-line, double-quoted string values.

```toml
# Machine-specific Git identity
username = "example"
email = "me@example.com"
```

- Keys must be identifiers: they start with a letter or `_`, followed by
  letters, digits, or `_`. Spaces and tabs around the key and `=` are allowed.
- Values may be empty (`""`) and may contain `#` or `=`, but not quotes,
  backslashes, or newlines. Escapes and inline comments are not supported.
- Blank lines and full-line `#` comments are allowed. Duplicate keys, tables,
  and other TOML value types are not supported.

## Placeholder Syntax

The only placeholder syntax is:

```text
\(identifier)
```

`identifier` must exactly match a profile key.

```text
\(username)
\(email)
```

The renderer substitutes each placeholder with the profile value in one pass.
Profile values are not rendered again. Files without placeholders pass through
the same rendering pipeline unchanged in content.

## Errors

The build fails when it finds:

- an unknown profile key
- a missing closing `)`
- an identifier containing unsupported syntax
- an invalid or unsupported profile entry or duplicate profile key

Examples of unsupported placeholder syntax:

```text
\(username.value)
\(upper(username))
\(username + "suffix")
\(a.b.c)
```

Placeholder escaping is not supported. `\\(username)` is interpreted as a
literal `\` followed by the `\(username)` placeholder.

## Atomic Build

The renderer writes every build artifact to a temporary directory first. Only
after all profile parsing and rendering succeeds does it replace `generated/`.
If rendering fails, the existing generated configuration remains available.

## Future Evolution

This specification intentionally excludes expressions, property access,
functions, and escaping. Any future syntax must be added explicitly without
changing the meaning of the current `\(identifier)` form.
