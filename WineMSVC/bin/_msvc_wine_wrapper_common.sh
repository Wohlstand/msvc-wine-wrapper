
function unixToWin()
{
    val=$1
    if [[ "${val::1}" == "/" ]]; then
        val="`winepath --windows \"${val}\"`"
    else
        val="${val//\//\\\\}"
    fi
    echo -n "${val}"
}

ORIG_ARGS=$@
MSVC_TO_ARGS=
for var in "$@"
do
    if [[ ("${var}" != "/lib") && ("${var}" != "/bin") && ("${var::1}" == "/") && (-d "$var" || -f "$var") ]]; then
        val="$(unixToWin "${var}")"
        MSVC_TO_ARGS="${MSVC_TO_ARGS} ${val}"
    elif [[ ("${var}" != "/lib") && ("${var}" != "/bin") && (-d "$var" || -f "$var") ]]; then
        val="$(unixToWin ${var})"
        MSVC_TO_ARGS="${MSVC_TO_ARGS} $val"
    elif [[ ("${var::2}" == "-I" || "${var::2}" == "-L") && (-d "${var:2}" || -f "${var:2}") ]]; then
        key=${var::2}
        val="$(unixToWin "${var:2}")"
        MSVC_TO_ARGS="${MSVC_TO_ARGS} ${key}${val}"
    elif [[ "${var::5}" == "/out:" ]]; then
        key=${var::5}
        val="$(unixToWin "${var:5}")"
        MSVC_TO_ARGS="${MSVC_TO_ARGS} ${key}${val}"
    elif [[ "${var::14}" == "/MANIFESTFILE:" ]]; then
        key=${var::14}
        val="$(unixToWin "${var:14}")"
        MSVC_TO_ARGS="${MSVC_TO_ARGS} ${key}${val}"
    else
        MSVC_TO_ARGS="${MSVC_TO_ARGS} $var"
    fi
done

