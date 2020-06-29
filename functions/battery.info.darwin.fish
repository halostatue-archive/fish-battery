function battery.info.darwin --no-scope-shadowing
    set -l ioreg (ioreg -rc "AppleSmartBattery")

    set __battery_is_plugged false
    string match -rq "\"ExternalConnected\" = Yes" $ioreg; and set __battery_is_plugged true

    set __battery_is_charging false
    string match -rq "\"IsCharging\" = Yes" $ioreg; and set __battery_is_charging true

    set __battery_max_cap (string match -r "\"MaxCapacity\" = (\d+)" $ioreg)[2]
    set __battery_cur_cap (string match -r "\"CurrentCapacity\" = (\d+)" $ioreg)[2]
    set __battery_pct (math -s1 $__battery_cur_cap / $__battery_max_cap x 100)

    set -l time_left
    if $__battery_is_charging
        set time_left (string match -r "\"AvgTimeToFull\" = (\d+)" $ioreg)[2]
    else
        set time_left (string match -r "\"AvgTimeToEmpty\" = (\d+)" $ioreg)[2]
    end

    if test $time_left -gt 1000
        set __battery_time_left
    else
        set __battery_time_left (printf '% 2d:%02d' (math -s0 $time_left / 60) (math -s0 $time_left % 60))
    end

    set __battery_slots (math -s0 "round($__battery_pct / 10)")
end
