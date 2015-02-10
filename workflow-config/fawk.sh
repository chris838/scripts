function fawk {
    first="awk '{print "
    last="}'"
    cmd="${first}\$${1}${last}"
    eval $cmd
}