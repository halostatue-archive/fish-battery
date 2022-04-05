function battery -d 'Report on battery status for OS X and Linux'
    argparse 'f/filled=' 'e/empty=' 'l/low=' 'm/medium=' 'h/high=' -- $argv
    or return 1

    set -l filled ▮
    set -l empty ▯
    set -l low (set_color -o f00)
    set -l medium (set_color -o ff0)
    set -l high (set_color -o 0f0)

    set -q _flag_filled
    and set filled $_flag_filled
    set -q _flag_empty
    and set empty $_flag_empty
    set -q _flag_low
    and set low $_flag_low
    set -q _flag_medium
    and set medium $_flag_medium
    set -q _flag_high
    and set high $_flag_high

    set -l normal (set_color normal)
    set -l color $high
    set -l plug 🔌
    set -l charge ⚡️
    set -l charge_up ↑
    set -l charge_down ↓
    set -l clock ⏱️

    battery.info

    switch $__battery_slots
        case 0 1 2
            set color $low
        case 3 4
            set color $medium
    end

    for n in (seq 10)
        if test $n -le $__battery_slots
            printf $color$filled$normal
        else
            printf $color$empty$normal
        end
    end

    $__battery_is_plugged
    and printf " "$plug

    if $__battery_is_charging
        printf " %s%s%s%s" $high $charge_up $charge $normal
    else
        printf " %s%s%s%s" $low $charge_down $charge $normal
    end

    printf " %s%s %%" $color $__battery_pct
    printf " %s %s%s\n" $clock $__battery_time_left $normal
end
