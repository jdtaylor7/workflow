# Recording GIFs in Linux

I use a two-step process to generate high-quality GIFs in Linux:

1. Record video using OBS
2. Convert the video to a GIF using FFmpeg

The following packages are used to do so:

`sudo pacman -Syu obs-studio ffmpeg`

### Record video using OBS

* Create a "window capture" source
* Fit capture window to the size of the recorded window
    * Right click screen once recorded window is running and being previewed
    * Resize output (source size)
* Set a keybinding to start/stop recording
* Record screen

### Convert video to GIF using FFmpeg

* Refer to provided gif conversion script: `vid2gif.sh` in this directory
* Update the fps and scale values as desired
* Run the script: `vid2gif.sh input.mkv output.gif`
* If posting to Github, tweek settings to keep final GIF size under 10MB

### Sources

* [Recording Smooth Game GIFs](http://pixelnicks.net/tuts/gifs.html)
* [How to Convert Video to GIF in Linux \[Terminal and GUI Methods\]](https://itsfoss.com/convert-video-gif-linux/)
* [How do I convert a video to GIF using ffmpeg, with reasonable quality?](https://superuser.com/questions/556029/how-do-i-convert-a-video-to-gif-using-ffmpeg-with-reasonable-quality)
* [High quality GIF with FFmpeg](http://blog.pkh.me/p/21-high-quality-gif-with-ffmpeg.html)
