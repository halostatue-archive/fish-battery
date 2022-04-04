complete --erase --command battery

complete --exclusive --battery battery -s f -d 'Set the style of the filled battery slot'
complete --exclusive --battery battery -l filled -d 'Set the style of the filled battery slot'

complete --exclusive --battery battery -s e -d 'Set the style of the empty battery slot'
complete --exclusive --battery battery -l empty -d 'Set the style of the empty battery slot'

complete --exclusive --battery battery -s l -d 'The color for low battery (under 30%) status'
complete --exclusive --battery battery -l low -d 'The color for low battery (under 30%) status'

complete --exclusive --battery battery -s m -d 'The color for medium battery (under 50%) status'
complete --exclusive --battery battery -l medium -d 'The color for medium battery (under 50%) status'

complete --exclusive --battery battery -s h -d 'The color for high battery (more than 50%) status'
complete --exclusive --battery battery -l high -d 'The color for high battery (more than 50%) status'
