
du -sh file_path

# or

stat -c "%s" file_path

# or human readable

stat -c "%s" file_path | numfmt --to=iec
