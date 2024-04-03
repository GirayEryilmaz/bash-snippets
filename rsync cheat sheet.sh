# Copy/synch the folder name myfolder to the current directory, note that there is no trailing / after myfolder:
rsync -aP hpc:"/path/to/myfolder" ./
or
rsync -aP hpc:"/path/to/myfolder" 

# Copy/synch content of myfolder into localfolder:
rsync -aP hpc:"/path/to/myfolder/" ./localfolder/

# This will copy remote myfolder into a new folder it created named newfolder:
rsync -aP hpc:"/path/to/myfolder" newfolder
# meaning you will have ./newfolder/myfolder, which is counter intuitive imo

# if you want to copy myfolder with a different name, you need this:
rsync -aP sumner:"/projects/ucar-lab/giray/DOGMA-seq/Dogma-2/Restart\ from\ aggregated\ samples/analysis/"  newfolder/
# Which copies the content of myfolder into the newfolder (which is created if missing)
