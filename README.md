# openai-whisper-codespace

rclone copy 'gdrive:Apna College/Aptitude Preparation (English)/2' ./videos --progress --transfers 4
<hr>

For all file in the videos folder
<br>
python3 transcribe_one_by_one.py "videos/"
<hr>
	
For only single file inside videos folder
<br>
python3 transcribe_one_by_one.py "videos/video_n.mp4"