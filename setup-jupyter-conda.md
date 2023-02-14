Install jupter to your base env 
```bash
conda install -c conda-forge jupyterlab
```

Can also..
```bash
conda install -c conda-forge nb_conda_kernels  
conda install -c conda-forge jupyter_contrib_nbextensions
```

Go to your env that you want to use from jupyter
```bash
conda activate <the env>
```

Install ipykernel, this is needed here!
```bash
conda install -c anaconda ipykernel
```

If kernel is missing from the jupyter, do the following while `<the env>` is activated!:
```bash
python -m ipykernel install --user --name=<the env>
```

THAT IS IT!
  
To start the jupyter lab, activate your base env (where you installed it) and do `jupyter lab`
You can take a look at [this](https://github.com/GirayEryilmaz/bash-snippets/blob/main/run-jupyter-lab.sh) too.
