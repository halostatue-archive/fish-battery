complete --erase --command battery

complete --exclusive --battery battery --short f --long filled \
    --description 'Set the style of the filled battery slot'

complete --exclusive --battery battery --short e --long empty \
    --description 'Set the style of the empty battery slot'

complete --exclusive --battery battery --short l --long low \
    --description 'The color for low battery (under 30%) status'

complete --exclusive --battery battery --short m --long medium \
    --description 'The color for medium battery (under 50%) status'

complete --exclusive --battery battery --short h --long high \
    --description 'The color for high battery (more than 50%) status'
