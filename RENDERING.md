# Rendering Specification

`build.sh` renders every file in `config/` into the matching path under
`generated/`.

## Profile Format

`profile/profile.ini` uses one `key=value` entry per non-empty line.

```ini
workspace=/Users/example/workspace
username=example
email=me@example.com
```

- Keys must be identifiers: they start with a letter or `_`, followed by
  letters, digits, or `_`. Whitespace around keys is not trimmed.
- Values are the text after the first `=` and may be empty.
- Sections, duplicate keys, and non-empty lines without `=` are invalid.

## Placeholder Syntax

The only placeholder syntax is:

```text
\(identifier)
```

`identifier` must exactly match a profile key.

```text
\(workspace)
\(username)
\(company)
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
- an invalid profile entry or duplicate profile key

Examples of unsupported placeholder syntax:

```text
\(workspace.path)
\(upper(username))
\(workspace + "/src")
\(a.b.c)
```

Escaping is not supported. `\\(workspace)` is interpreted as a literal `\`
followed by the `\(workspace)` placeholder.

## Atomic Build

The renderer writes every build artifact to a temporary directory first. Only
after all profile parsing and rendering succeeds does it replace `generated/`.
If rendering fails, the existing generated configuration remains available.

## Future Evolution

This specification intentionally excludes expressions, property access,
functions, and escaping. Any future syntax must be added explicitly without
changing the meaning of the current `\(identifier)` form.
