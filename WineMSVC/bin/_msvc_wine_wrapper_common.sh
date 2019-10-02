
export WINEDEBUG=-all

function isPath()
{
    if [[ (-f "$1" || -d "$1") ]]; then
        echo 1
    fi
}

function unixToWin()
{
    val=$1
    if [[ "${val}" == "" ]]; then
        val="" #Change nothing
    elif [[ "${val::1}" == "/" ]]; then
        val="`winepath --windows \"${val}\"`" # Convert absolute path
    else
        val="${val//\//\\}" # Convert relative path
    fi
    printf "%q" ${val}
}

ORIG_ARGS=$@
MSVC_TO_ARGS=

for var in "$@"
do
    key=
    val=$var

    # Convert link and include paths -I/path/to, -L/path/to, etc.
    if [[ ("${var::2}" == "-I" || "${var::2}" == "/I" || "${var::2}" == "-L" || "${var::2}" == "/L") && $(isPath "${var:2}") ]]; then
        key=${var::2}
        val="$(unixToWin "${var:2}")"
    # Convert "/Fe:path/to/some" argument
    elif [[ "${var::4}" == "/Fe:" ]]; then
        key=${var::4}
        val="$(unixToWin "${var:4}")"
    # Convert paths of /Fo, Fx, etc. /Fo/path/to, /Fx/path/to, etc.
    elif [[ "${var::3}" == "/Fa" || "${var::3}" == "/Fd" || "${var::3}" == "/Fe" || "${var::3}" == "/Fi" || \
            "${var::3}" == "/Fm" || "${var::3}" == "/Fo" || "${var::3}" == "/Fp" || \
            "${var::3}" == "/FR" || "${var::3}" == "/Fr" || \
            "${var::3}" == "/AI" || "${var::3}" == "/FI" ]]; then
        key=${var::3}
        val="$(unixToWin "${var:3}")"
    # Convert linker's /out path: "/out:kek/path"
    elif [[ "${var::5}" == "/out:" || "${var::5}" == "/OUT:" || "${var::5}" == "/pdb:" || "${var::5}" == "/PDB:" ]]; then
        key=${var::5}
        val="$(unixToWin "${var:5}")"
    # Convert linker's implib path: "/implib:kek/path"
    elif [[ "${var::8}" == "/implib:" || "${var::8}" == "/IMPLIB:" ]]; then
        key=${var::8}
        val="$(unixToWin "${var:8}")"
    # Convert path to manifest file: /MANIFESTFILE:/path/to, etc.
    elif [[ "${var::14}" == "/MANIFESTFILE:" ]]; then
        key=${var::14}
        val="$(unixToWin "${var:14}")"
    # Convert "/outputresource:" path
    elif [[ "${var::16}" == "/outputresource:" || "${var::16}" == "/OUTPUTRESOURCE:" ]]; then
        key=${var::16}
        val="$(unixToWin "${var:16}")"
    # Convert path to manifest file: -LIBPATH:/path/to, etc.
    elif [[ "${var::9}" == "-LIBPATH:" ]]; then
        key=${var::9}
        val="$(unixToWin "${var:9}")"
    # Convert absolute or relative path arguments
    elif [[ ("${var}" != "/lib") && ("${var}" != "/bin") && (-d "$var" || -f "$var") ]]; then
        val="$(unixToWin "${var}")"
    fi # Anything other, pass as-is

    MSVC_TO_ARGS="${MSVC_TO_ARGS} ${key}${val}"
done

