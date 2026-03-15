# ffmpeg

## 检查视频

```
ffprobe video.mp4
```

## 裁剪视频

```
ffmpeg -ss 00:00:00 -i video.mp4 -to 01:39:09 -c copy video_clip.mp4
```

## 转换音频

```
ffmpeg -i input.mkv -vn -acodec mp3  output.mp3
```
