complete -ec battery

complete -xc battery -s f -d 'Set the style of the filled battery slot'
complete -xc battery -l filled -d 'Set the style of the filled battery slot'

complete -xc battery -s e -d 'Set the style of the empty battery slot'
complete -xc battery -l empty -d 'Set the style of the empty battery slot'

complete -xc battery -s l -d 'The color for low battery (under 30%) status'
complete -xc battery -l low -d 'The color for low battery (under 30%) status'

complete -xc battery -s m -d 'The color for medium battery (under 50%) status'
complete -xc battery -l medium -d 'The color for medium battery (under 50%) status'

complete -xc battery -s h -d 'The color for high battery (more than 50%) status'
complete -xc battery -l high -d 'The color for high battery (more than 50%) status'
