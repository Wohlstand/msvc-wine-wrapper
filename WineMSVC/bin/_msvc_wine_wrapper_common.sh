
MSVC_TO_ARGS=
for var in "$@"
do
    if [[ ("${var}" != "/lib") && ("${var}" != "/bin") && ("${var::1}" == "/") && (-d "$var" || -f "$var") ]]; then
        val="`winepath --windows \"$var\"`"
        MSVC_TO_ARGS="${MSVC_TO_ARGS} $val"
    elif [[ ("${var:2:1}" == "/") && (-d "${var:2}" || -f "${var:2}") ]]; then
        key=${var::2}
        val="`winepath --windows \"${var:2}\"`"
        MSVC_TO_ARGS="${MSVC_TO_ARGS} ${key}${val}"
    else
        MSVC_TO_ARGS="${MSVC_TO_ARGS} $var"
    fi
done

