
ORIG_ARGS=$@
MSVC_TO_ARGS=
for var in "$@"
do
    if [[ ("${var}" != "/lib") && ("${var}" != "/bin") && ("${var::1}" == "/") && (-d "$var" || -f "$var") ]]; then
        val="`winepath --windows \"$var\"`"
        MSVC_TO_ARGS="${MSVC_TO_ARGS} $val"
    elif [[ ("${var}" != "/lib") && ("${var}" != "/bin") && (-d "$var" || -f "$var") ]]; then
            val="${var//\//\\\\}"
            MSVC_TO_ARGS="${MSVC_TO_ARGS} $val"
    elif [[ ("${var::1}" == "/") && (-d "${var:2}" || -f "${var:2}") ]]; then
        key=${var::2}
        val="`winepath --windows \"${var:2}\"`"
        MSVC_TO_ARGS="${MSVC_TO_ARGS} ${key}${val}"
    elif [[ "${var::5}" == "/out:" ]]; then
        key=${var::5}
        val=${var:5}
        val="${val//\//\\\\}"
        MSVC_TO_ARGS="${MSVC_TO_ARGS} ${key}${val}"
    elif [[ "${var::14}" == "/MANIFESTFILE:" ]]; then
        key=${var::14}
        val=${var:14}
        val="${val//\//\\\\}"
        MSVC_TO_ARGS="${MSVC_TO_ARGS} ${key}${val}"
    else
        MSVC_TO_ARGS="${MSVC_TO_ARGS} $var"
    fi
done

