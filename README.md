# hello_t

A [T](https://github.com/b-rodrigues/tlang) package.

## Description

This is a simple "hello world" package for the T programming language.

## Installation

Add the following to the `[dependencies]` section of your `tproject.toml`:

```toml
[dependencies]
hello_t = { git = "https://github.com/username/hello_t", tag = "v0.0.3" }
```

Then run `nix develop` to enter the environment with the package available.

## Usage

```t
hello("world")
```

## Development

Enter the development shell:

```bash
nix develop
```

Run tests:

```bash
t test
```

## License

EUPL-1.2
