# HM0011a ZMK firmware builder

## Usage

1. Build container image (if it is not created)
```sh
podman build \
    -t zmk-builder \
    -f Dockerfile ./zmk/.devcontainer
```

2. Build the firmware
```sh
podman compose run zmk-builder build <target>
```

## Targets
- Central
    - `hm0011a_central_dongle`
    - `hm0011a_central_left`
    - `hm0011a_central_right`
- Peripheral
    - `hm0011a_peripheral_left`
    - `hm0011a_peripheral_right`
