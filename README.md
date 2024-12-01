# DNG Sequence Converter

A Bash script for automated batch conversion of DNG photo sequences to PNG and ProRes video. Designed for processing drone photography and timelapse sequences into professional video formats.

## Features

- Automated processing of DNG sequences in multiple subdirectories
- High-quality DNG to PNG conversion using dcraw
- Professional ProRes 422 HQ video output
- Maintains 4K resolution (3840x2160)
- Organized output structure with separate PNG and ProRes directories
- 23.976 fps video output

## Prerequisites

The script requires the following tools to be installed:

- dcraw (for DNG conversion)
- ffmpeg (with ProRes support)
- Basic Unix tools (find, basename)

### Installation of Dependencies

For Ubuntu/Debian:
```bash
sudo apt-get update
sudo apt-get install dcraw ffmpeg
```

For macOS (using Homebrew):
```bash
brew install dcraw ffmpeg
```

## Usage

1. Make the script executable:
```bash
chmod +x dng_sequence_converter.sh
```

2. Edit the BASE_DIR variable in the script to point to your source directory:
```bash
BASE_DIR="/path/to/your/dng/sequences"
```

3. Run the script:
```bash
./dng_sequence_converter.sh
```

## Directory Structure

The script expects and creates the following directory structure:

```
BASE_DIR/
├── SEQUENCE_1/
│   ├── *.dng files
│   ├── png/
│   │   └── converted png files
│   └── prores/
│       └── output.mov
├── SEQUENCE_2/
│   ├── *.dng files
│   ├── png/
│   │   └── converted png files
│   └── prores/
│       └── output.mov
```

## Configuration

Default settings in the script:
- Resolution: 3840x2160 (4K)
- Frame Rate: 23.976 fps (24000/1001)
- ProRes Profile: HQ (profile:v 3)
- Pixel Format: YUV422 10-bit (yuv422p10le)
- dcraw Quality: High (q 3)

## Customization

To modify the output settings, adjust the following parameters in the script:

- Frame rate: Change `-framerate 24000/1001`
- Resolution: Modify `-s 3840x2160`
- ProRes profile: Adjust `-profile:v 3`
- PNG conversion quality: Edit `dcraw -q 3`

## Error Handling

The script creates required directories automatically. If a directory already exists, it will use the existing directory without overwriting it.

## Performance Considerations

- Processing large DNG sequences requires significant disk space for PNG intermediates
- ProRes encoding is CPU-intensive
- Consider available disk space before processing large sequences

## Contributing

Feel free to fork this repository and submit pull requests for any improvements.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Acknowledgments

- dcraw for high-quality RAW conversion
- FFmpeg for professional video encoding capabilities
