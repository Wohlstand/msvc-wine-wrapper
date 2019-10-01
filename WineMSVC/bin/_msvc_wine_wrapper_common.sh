
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
    # Convert link and include paths -I/path/to, -L/path/to, etc.
    if [[ ("${var::2}" == "-I" || "${var::2}" == "-L") && (-d "${var:2}" || -f "${var:2}") ]]; then
        key=${var::2}
        val="$(unixToWin "${var:2}")"
        MSVC_TO_ARGS="${MSVC_TO_ARGS} ${key}${val}"
    # Convert paths of /Fo, Fx, etc. /Fo/path/to, /Fx/path/to, etc.
    elif [[ ("${var::2}" == "/F") && (-d "${var:3}" || -f "${var:3}") ]]; then
        key=${var::3}
        val="$(unixToWin "${var:3}")"
        MSVC_TO_ARGS="${MSVC_TO_ARGS} ${key}${val}"
    # Convert linker's /out path: /out:kek/path
    elif [[ "${var::5}" == "/out:" || "${var::5}" == "/OUT:" ]]; then
        key=${var::5}
        val="$(unixToWin "${var:5}")"
        MSVC_TO_ARGS="${MSVC_TO_ARGS} ${key}${val}"
    # Convert path to manifest file: /MANIFESTFILE:/path/to, etc.
    elif [[ "${var::14}" == "/MANIFESTFILE:" ]]; then
        key=${var::14}
        val="$(unixToWin "${var:14}")"
        MSVC_TO_ARGS="${MSVC_TO_ARGS} ${key}${val}"
    # Convert absolute or relative path arguments
    elif [[ ("${var}" != "/lib") && ("${var}" != "/bin") && (-d "$var" || -f "$var") ]]; then
        val="$(unixToWin "${var}")"
        MSVC_TO_ARGS="${MSVC_TO_ARGS} ${val}"
    # Pass any unknown arguments as-is
    else
        MSVC_TO_ARGS="${MSVC_TO_ARGS} $var"
    fi
done
