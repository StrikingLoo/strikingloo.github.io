---
layout: post
title: "Useful Bash Commands"
date: 2020-11-04
description: "A series of bash commands I found useful, usually the product of some minutes of research or tinkering."
---

how many lines with a given extension?

```find . -name "*.$1" | xargs wc -l| tail -n 1```

---

To run this site locally

```
sudo gem install rails
sudo gem install jekyll
sudo gem install jekyll bundler
cd ~/desiredFolder

bundle init
bundle install
bundle add jekyll
bundle exec jekyll serve
```

---

To turn .enex notes from Evernote into .md files directly: [evernote2md](https://github.com/wormi4ok/evernote2md)

---

To find all files containing a given expression. 
``` grep -rnw '/path/to/somewhere/' -e 'pattern' ```

---

### Tar commands:

To extract a tarfile:

``` tar -xzf myfile.tar.gz ```

x for extract, z for zip, f for file. -v for verbose, is optional.

``` tar -czf new_name.tar.gz source_directory ```

c for create, z for zip, v for verbose (optional) and f for file. 

**Note that source comes after destination, like in a ASM instruction!** 

---

### Basic sed use case

``` echo 'this-is-a-path' | sed 's/-/\//g' ```
output:
` this/is/a/path `

---

### Redshift copy from S3

``` 
copy $TABLE\_NAME
from 'S3\_PATH'
iam\_role '$iam\_role'
removequotes
emptyasnull
blanksasnull
maxerror 100
delimiter ','
IGNOREHEADER 1
; 
```

---

Watch example:
``` watch -n 10 ls -lAhF ```

---

Installing GPT-NeoX

```

git clone https://github.com/EleutherAI/gpt-neox.git
apt-get install python3.8
update-alternatives --install /usr/bin/python3 python3 /usr/bin/python3.8 2
update-alternatives --config python3
wget https://bootstrap.pypa.io/get-pip.py
python3 get-pip.py
python3.8 -m pip install torch
apt-get install python3-dev
python3.8 -m pip install https://bitbucket.org/mpi4py/mpi4py/downloads/mpi4py-3.0.3.tar.gz
python3.8 -m pip install -r requirements/requirements.txt

python3 -m pip install torch==1.5.0+cu101 torchvision==0.6.0+cu101 -f https://download.pytorch.org/whl/torch_stable.html #case when cuda 10.1

python prepare_data.py enron -t CharLevelTokenizer -d ./data/
python ./deepy.py train.py -d configs small.yml local_setup.yml #warning since eval won't work ok
```

---

Classic nvidia commands:

- nvcc --version : get CUDA version
- nvidia-smi : display cute table with stats that include VRAM.
