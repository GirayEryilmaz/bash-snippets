for name in JB170{01..99}
do
    mkdir $name
    mv "$name"_*.gz $name
done

rmdir *
