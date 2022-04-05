function battery.info.linux --no-scope-shadowing
    if not command -sq upower
        echo >&2 'Please install upower.'
        return 1
    end

    set -l devices (upower -e | grep battery)
    set -l upo (upower -i $devices)

    set __battery_is_plugged false
    contains -- charging $upo
    and set __battery_is_plugged true
    set __battery_is_charging $__battery_is_plugged

    set __battery_max_cap (string match -r 'energy-full:\\s+([.\\d]+)' $upo)[2]
    set __battery_cur_cap (string match -r 'energy:\\s+([.\\d]+)' $upo)[2]
    set __battery_pct (string match -r 'percentage:\\s+([.\\d]+)' $upo)[2]
    set __battery_time_left (string match -r 'time to \\w+:\\s+([.\\d]+\s+\w+)' $upo)[2]
    set __battery_slots (math -s0 $__battery_pct / 10)
end
