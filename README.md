Copy the relevant filepaths from the LAUV to local folder by calling this command from within each cpu folder:

'''rsync -ah --no-R --no-d --files-from=filepathx.txt logger@10.0.80.39:/ .'''
