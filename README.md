# halostatue/fish-battery

A rewrite of [oh-my-fish/plugin-battery] for the [fish shell], providing
a battery utility that is compatible with MacOS and Linux.

Note that I do not use Linux on a laptop, so the Linux battery detection code is
based on `oh-my-fish/plugin-battery` with some changes. It may not be correct,
and there may be ways of reading the battery data that do not require `upower`.
Pull requests to enhance this functionality are greatly appreciated.

## Installation

Install with [Fisher] (recommended):

```fish
fisher install halostatue/fish-battery
```

<details>
<summary>Not using a package manager?</summary>

---

Copy `functions/*.fish` to your fish configuration directory preserving the
directory structure.

</details>

## Usage

Display battery status (slots, charging state, percentage and time
remaining).

```fish
% battery
▮▮▮▮▮▮▮▮▮▯ 🔌 ↑⚡️ 93.6 % ⏱️  0:32
```

Customize `battery` options.

```fish
% battery -f ▶ -e ▷
▶▶▶▶▶▶▶▶▶▷ 🔌 ↑⚡️ 93.6 % ⏱️  0:32
```

### Environment Variables

Unlike `oh-my-fish/plugin-battery`, this `battery` function does not export
environment variables. That is done with `battery.info -x`. Instead, the
helper function `battery.info` and the platform-specific versions
(`battery.info.linux` and `battery.info.darwin`) use the
`--no-scope-shadowing` flag so that calling `battery.info` will expose the
variables to a function calling it, but does not export variables without an
explicit opt-in, making `battery.info` safe to use in prompt functions
without affecting the external environment.

In the list below, the first value is the _exported_ version (`battery.info -x`) and the second value is the local scope version.

#### `BATTERY_IS_PLUGGED` / `__battery_is_plugged`

| State      | `BATTERY_IS_PLUGGED` | `__battery_is_plugged` |
| ---------- | -------------------- | ---------------------- |
| Plugged In | `true`               | `true`                 |
| Unplugged  | unset                | `false`                |

If the battery is plugged in, this will be `true` for both versions. If it is
not plugged in, the exported variable will be unset and the local variable
will be `false`.

```fish
battery.info -x
set -q BATTERY_IS_PLUGGED; and echo Plugged 🔌
```

#### `BATTERY_IS_CHARGING` / `__battery_is_charged`

| State      | `BATTERY_IS_CHARGING` | `__battery_is_charging` |
| ---------- | --------------------- | ----------------------- |
| Plugged In | `true`                | `true`                  |
| Uncharging | unset                 | `false`                 |

If the battery is charging, this will be `true` for both versions. If it is
discharging, the exported variable will be unset and the local variable will
be `false`.

```fish
battery.info -x
set -q BATTERY_IS_CHARGING; and echo Charging ⌁
```

#### `BATTERY_TIME_LEFT` / `__battery_time_left`

Time left in `HH:MM` format. On MacOS, this will be empty if there are more
than 1,000 minutes left (the value 65535 is used to indicate that there is no
estimate possible).

#### `BATTERY_SLOTS`

Number of slots/gauges from 10 available.

#### `BATTERY_MAX_CAP`

Battery maximum capacity.

#### `BATTERY_CUR_CAP`

Battery current capacity.

#### `BATTERY_PCT`

Current battery charge expressed as a percentage.

### System Requirements

- [fish] 3.0+
- upower (Linux only)

## Licence

[MIT](LICENCE.md)

[fisher]: https://github.com/jorgebucaran/fisher
[fish]: https://github.com/fish-shell/fish-shell
[oh-my-fish/plugin-battery]: https://github.com/oh-my-fish/plugin-battery
