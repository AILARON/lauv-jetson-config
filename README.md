Copy the config files from the LAUV:

    rsync -ah --no-R --no-d --files-from=silcam-cpu/filepathx.txt logger@10.0.80.39:/ silcam-cpu/

    rsync -ah --no-R --no-d --files-from=jetson-1/filepathx.txt ubuntu@10.0.80.34:/ jetson-1/

    rsync -ah --no-R --no-d --files-from=jetson-2/filepathx.txt ubuntu@10.0.80.35:/ jetson-2/
