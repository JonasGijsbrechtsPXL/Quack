#Volume Hoog houden
function set_AudioLevel($audioLevel){$wshShell = new-object -com wscript.shell; 1..50 | % {$wshShell.SendKeys([char]174)};
$audioLevel = $audioLevel / 99;100..$audioLevel | % {$wshShell.SendKeys([char]175)}}
#----------------------------------------------------------------------------------------------------------------------------------------------------
#Speech
Add-Type -AssemblyName System.speech
$speak = New-Object System.Speech.Synthesis.SpeechSynthesizer
#----------------------------------------------------------------------------------------------------------------------------------------------------
#Background
# URL of the image you want to download
$imageUrl = "https://cdn.britannica.com/36/22536-050-E22B1D13/Flag-Union-of-Soviet-Socialist-Republics.jpg"

# Local path to save the downloaded image in the temp directory
$localImagePath = [System.IO.Path]::Combine([System.IO.Path]::GetTempPath(), "USSR.jpg")

# Download the image
Invoke-WebRequest -Uri $imageUrl -OutFile $localImagePath -UseBasicParsing

# Set the wallpaper using .NET framework
Add-Type -TypeDefinition @"
    using System;
    using System.Runtime.InteropServices;

    public class Wallpaper {
        [DllImport("user32.dll", CharSet = CharSet.Auto)]
        public static extern int SystemParametersInfo(int uAction, int uParam, string lpvParam, int fuWinIni);
    }
"@

# Define constants
$SPI_SETDESKWALLPAPER = 0x0014
$SPIF_UPDATEINIFILE = 0x01
$SPIF_SENDCHANGE = 0x02
#----------------------------------------------------------------------------------------------------------------------------------------------------
# Set the wallpaper
[Wallpaper]::SystemParametersInfo($SPI_SETDESKWALLPAPER, 0, $localImagePath, $SPIF_UPDATEINIFILE -bor $SPIF_SENDCHANGE)
#----------------------------------------------------------------------------------------------------------------------------------------------------
#USSR Anthem
$url = "https://www.youtube.com/watch?v=U06jlgpMtQs&ab_channel=rascrifice"
#----------------------------------------------------------------------------------------------------------------------------------------------------
# Infinite loop

Start-Sleep -s 300

set_AudioLevel -Volume 100

$speak.Speak('Salut my friend, You will join the comunism in minus 10 seconds. 10. 9. 8. 7. 6. 5. 4. 3. 2. 1. 0. 0. 0. Welcome!')

set_AudioLevel -Volume 100

[Wallpaper]::SystemParametersInfo($SPI_SETDESKWALLPAPER, 0, $localImagePath, $SPIF_UPDATEINIFILE -bor $SPIF_SENDCHANGE)

Start-Process $url
while ($true) {
        set_AudioLevel -Volume 100
 	Start-Process $url
        start-sleep -seconds 1
    }