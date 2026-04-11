## Colemak CAWS keyd configuration for Latin American users

This keyd configuration is based on one of Dreymar's Big Bag layouts: [Cmk-eD-EsAlt_ISO_CurlAWideSym](https://github.com/DreymaR/BigBagKbdTrixPKL/tree/master/Layouts/Colemak/Cmk-eD-Es/Cmk-eD-EsAlt_ISO_CurlAWideSym)

It lacks most features, but it is enough for everyday use. The following features are available:

- Extend layers (1 and 2)
- Basic accented characters with AltGr: á é í ó ú
- Diaeresis (`AltGr + ; + [vowel]`): ä ë ï ö ü
- Toggleable oneshot mods for gaming

### Installation

1. Change your default layout to `US, intl., AltGr Unicode combining`.
2. Install `git` through your package manager:

```sh
# Ubuntu/Debian/Mint
sudo apt install git
# Fedora
sudo dnf install git
# Arch
sudo pacman -Syu git
```

3. Install `keyd`:

```sh
git clone https://github.com/rvaiya/keyd
cd keyd
make && sudo make install
sudo systemctl enable --now keyd
```

4. Clone the repository and copy the `keyd` configuration files. Alternatively, just paste this in your terminal:

```sh
curl -fsSL https://raw.githubusercontent.com/addielponce/colemak-keyd/refs/heads/main/install.sh | bash
```

### Notes

- This configuration is activated for all users. If you share your device with others, this may cause problems. To quickly disable keyd, press `backspace + escape + enter`. Support for per-user configuration may be added in the future.
- Unfortunately, there is a [bug](https://github.com/rvaiya/keyd/issues/273) that prevents unicode from working in certain cases, which is why a specific layout is required. Hopefully it will be resolved in the future.
