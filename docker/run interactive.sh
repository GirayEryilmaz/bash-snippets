# this will remove container on exit
# i = interactive
# t = tty (terminal)
# --rm = remove when done
sudo docker run --name <new name> -it --rm <image>

# if the default entry point is not shell, do this to gte bash:
sudo docker run --rm -it --entrypoint bash <image-name-or-id>
