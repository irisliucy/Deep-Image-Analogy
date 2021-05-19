sync()
{
	rsync -z -r -e "ssh" --delete --exclude="*.ipynb_checkpoints*" --exclude="*build*" --exclude="*dist*" --exclude="*egg-info*" --exclude="*__pycache__*" /Users/chuiyiliu/src/Deep-Image-Analogy Int-ebec2e2c-4d58-415d-bb7b-4c6d7c373dd13.sensei-t:/home/code-base/runtime/src/Deep-Image-Analogy
	echo Synced with remote on $(date)
}
while true; do
	while inotifywait -r -e modify,move,create,delete -qq -t 15 /Users/chuiyiliu/src/Deep-Image-Analogy; do
		sync
	done

	sync
done