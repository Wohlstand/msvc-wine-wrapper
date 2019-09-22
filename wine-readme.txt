=== Add next DLLs into overrides and set them as "native"

c1
c1ast
c1xx
msvcirt
msvcp120
msvcp120d
msvcr120
msvcr120d
vccorlib120d
vcmeta




=== Add next environment variables

==== (Visual Studio 2013) ====
"COMNTOOLS"="C:\\Program Files (x86)\\Microsoft Visual Studio 12.0\\Common7\\Tools\\"
"INCLUDE"="C:\\Program Files (x86)\\Microsoft Visual Studio 12.0\\VC\\include;C:\\Program Files (x86)\\Windows Kits\\8.1\\include\\shared;C:\\Program Files (x86)\\Windows Kits\\8.1\\include\\um;C:\\Program Files (x86)\\Windows Kits\\8.1\\include\\winrt"
"LIB"="C:\\Program Files (x86)\\Microsoft Visual Studio 12.0\\VC\\lib;C:\\Program Files (x86)\\Windows Kits\\8.1\\lib\\winv6.3\\um\\x86"
"LIBPATH"="C:\\Program Files (x86)\\Microsoft Visual Studio 12.0\\VC\\LIB;C:\\Program Files (x86)\\Windows Kits\\8.1\\References\\CommonConfiguration\\Neutral"
"PATH"="C:\\Program Files (x86)\\Microsoft Visual Studio 12.0\\Common7\\IDE\\;C:\\Program Files (x86)\\Microsoft Visual Studio 12.0\\Common7\\Tools;C:\\Program Files (x86)\\Microsoft Visual Studio 12.0\\VC\\bin;C:\\Program Files (x86)\\Microsoft Visual Studio 12.0\\VC\\VCPackages;C:\\Program Files (x86)\\Windows Kits\\8.1\\bin\\x86;C:\\Windows;C:\\Windows\\system32"
"VS120COMNTOOLS"="C:\\Program Files\\Microsoft Visual Studio 12.0\\Common7\\Tools\\"
"WINDOWS_KIT"="C:\\Program Files (x86)\\Windows Kits\\8.1\\"
"WindowsLibPath"="C:\\Program Files (x86)\\Windows Kits\\8.1\\References\\CommonConfiguration\\Neutral"
"WindowsSdkDir"="C:\\Program Files (x86)\\Windows Kits\\8.1\\"
"WindowsSDKLibVersion"="winv6.3\\"
"WindowsSDKVersion"="\\"

==== (Visual Studio 2015) ====
Since it's hard to use official installer here, is possible to just copy all necessary files manually
(no need to make any registry changes except of environment variables with paths):

- Install Visual Studio Community by regular way into the Windows OS that running in the virtual machine like VirtualBox or VMWare, or installed on another computer

- Copy next folders from Windows host into Wine prefix's folder (it's not need to have everything, the package can have much smaller weight):

-- From "C:\Program Files (x86)\Microsoft SDKs"
   into "drive_c/Program Files (x86)/Microsoft SDKs"

-- From "C:\Program Files (x86)\Windows Kits"
   into "drive_c/Program Files (x86)/Windows Kits"

-- Make the empty folder "drive_c/Program Files (x86)/Microsoft Visual Studio 14.0"

-- From "C:\Program Files (x86)\Microsoft Visual Studio 14.0\lib"
   into "/home/vitaly/.wine/drive_c/Program Files (x86)/Microsoft Visual Studio 14.0/lib"

-- From "C:\Program Files (x86)\Microsoft Visual Studio 14.0\VC"
   into "/home/vitaly/.wine/drive_c/Program Files (x86)/Microsoft Visual Studio 14.0/VC"

----- Environment variables -----
"COMNTOOLS"="C:\\Program Files (x86)\\Microsoft Visual Studio 14.0\\Common7\\Tools\\"
"INCLUDE"="C:\\Program Files (x86)\\Microsoft Visual Studio 14.0\\VC\\include;C:\\Program Files (x86)\\Windows Kits\\10\\Include\\10.0.17134.0\\um;C:\\Program Files (x86)\\Windows Kits\\10\\Include\\10.0.17134.0\\cppwinrt;C:\\Program Files (x86)\\Windows Kits\\10\\Include\\10.0.17134.0\\shared;C:\\Program Files (x86)\\Windows Kits\\10\\Include\\10.0.17134.0\\ucrt;C:\\Program Files (x86)\\Windows Kits\\10\\Include\\10.0.17134.0\\winrt;"
"LIB"="C:\\Program Files (x86)\\Microsoft Visual Studio 14.0\\VC\\lib;C:\\Program Files (x86)\\Windows Kits\\10\\Lib\\10.0.17134.0\\um\\x86;C:\\Program Files (x86)\\Windows Kits\\10\\Lib\\10.0.17134.0\\ucrt\\x86"
"LIBPATH"="C:\\Program Files (x86)\\Microsoft Visual Studio 14.0\\VC\\LIB;C:\\Program Files (x86)\\Windows Kits\\8.1\\References\\CommonConfiguration\\Neutral"
"PATH"="C:\\Program Files (x86)\\Microsoft Visual Studio 14.0\\Common7\\IDE\\;C:\\Program Files (x86)\\Microsoft Visual Studio 14.0\\Common7\\Tools;C:\\Program Files (x86)\\Microsoft Visual Studio 14.0\\VC\\bin;C:\\Program Files (x86)\\Windows Kits\\10\\bin\\10.0.17134.0\\x86;C:\\Program Files (x86)\\Microsoft Visual Studio 14.0\\VC\\VCPackages;C:\\Program Files (x86)\\Windows Kits\\8.1\\bin\\x86;C:\\Windows;C:\\Windows\\system32"
"VS120COMNTOOLS"="C:\\Program Files\\Microsoft Visual Studio 14.0\\Common7\\Tools\\"
"WINDOWS_KIT"="C:\\Program Files (x86)\\Windows Kits\\8.1\\"
---------------------------------
If you where installed any sort of MFC or other extra packages, you'll need also list in these variables their includes and lib folders also.



==== (Visual Studio 2017) [NEED TO VERIFY] ====
"COMNTOOLS"="C:\\Program Files (x86)\\Microsoft Visual Studio 15.0\\Common7\\Tools\\"
"INCLUDE"="C:\\Program Files (x86)\\Microsoft Visual Studio 15.0\\VC\\include;C:\\Program Files (x86)\\Windows Kits\\8.1\\include\\shared;C:\\Program Files (x86)\\Windows Kits\\8.1\\include\\um;C:\\Program Files (x86)\\Windows Kits\\8.1\\include\\winrt"
"LIB"="C:\\Program Files (x86)\\Microsoft Visual Studio 15.0\\VC\\lib;C:\\Program Files (x86)\\Windows Kits\\8.1\\lib\\winv6.3\\um\\x86"
"LIBPATH"="C:\\Program Files (x86)\\Microsoft Visual Studio 15.0\\VC\\LIB;C:\\Program Files (x86)\\Windows Kits\\8.1\\References\\CommonConfiguration\\Neutral"
"PATH"="C:\\Program Files (x86)\\Microsoft Visual Studio 15.0\\Common7\\IDE\\;C:\\Program Files (x86)\\Microsoft Visual Studio 15.0\\Common7\\Tools;C:\\Program Files (x86)\\Microsoft Visual Studio 15.0\\VC\\bin;C:\\Program Files (x86)\\Microsoft Visual Studio 15.0\\VC\\VCPackages;C:\\Program Files (x86)\\Windows Kits\\8.1\\bin\\x86;C:\\Windows;C:\\Windows\\system32"
"VS120COMNTOOLS"="C:\\Program Files\\Microsoft Visual Studio 15.0\\Common7\\Tools\\"
"WINDOWS_KIT"="C:\\Program Files (x86)\\Windows Kits\\8.1\\"
"WindowsLibPath"="C:\\Program Files (x86)\\Windows Kits\\8.1\\References\\CommonConfiguration\\Neutral"
"WindowsSdkDir"="C:\\Program Files (x86)\\Windows Kits\\8.1\\"
"WindowsSDKLibVersion"="winv6.3\\"
"WindowsSDKVersion"="\\"

