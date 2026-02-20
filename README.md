# my_package

A T package.

## Description

A brief description of what my_package does.

## Installation

Add the following to the `[dependencies]` section of your `tproject.toml`:

```toml
[dependencies]
my_package = { git = "https://github.com/username/my_package", tag = "v0.1.0" }
```

Then run `nix develop` to enter the environment with the package available.

## Usage

```t
-- Example usage of my_package functions
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
