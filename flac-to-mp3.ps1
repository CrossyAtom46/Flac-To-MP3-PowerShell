# Path to the input folder containing the files to convert
$sourceFolder = "C:\Music"

# Path to the output folder to save the converted MP3 files
$destinationFolder = "C:*Converted"

# Path to the FFmpeg executable
$ffmpegPath = "C:\ffmpeg\ffmpeg.exe"
# Get all FLAC files in the source folder
$files = Get-ChildItem -Path $sourceFolder -Filter *.flac -File

# Iterate through each file and convert it to MP3 using fdkaac
foreach ($file in $files) {
    # Build the output file path with the same name and OGG extension
    $outputFilePath = Join-Path -Path $destinationFolder -ChildPath ($file.BaseName + ".mp3")

    # Execute fdkaac command to convert the file to OGG
    & $ffmpegPath -i $file.FullName $outputFilePath
}
