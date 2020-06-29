function battery.info -d 'Update and export battery information' --no-scope-shadowing
    argparse 'x/export' -- $argv

    test -z $OSTYPE; and set OSTYPE (uname)

    if test $OSTYPE = 'Darwin'
        battery.info.darwin
    else if test $OSTYPE = 'Linux'
        battery.info.linux
    else
        echo >&2 'Unknown operating system: '$OSTYPE
        return 1
    end

    set -q _flag_export; or return

    set -gx BATTERY_SLOTS $__battery_slots
    set -gx BATTERY_MAX_CAP $__battery_max_cap
    set -gx BATTERY_CUR_CAP $__battery_cur_cap
    set -gx BATTERY_PCT $__battery_pct
    set -gx BATTERY_TIME_LEFT $__battery_time_left

    if $__battery_is_plugged
        set -gx BATTERY_IS_PLUGGED $__battery_is_plugged
    else
        set -ge BATTERY_IS_PLUGGED
    end

    if $__battery_is_charged
        set -gx BATTERY_IS_CHARGED $__battery_is_charged
    else
        set -ge BATTERY_IS_CHARGED
    end
end
