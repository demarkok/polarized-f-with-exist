# polarized-f-with-exist

## Dependencies
### Opam 4.13
Make sure the OCaml version is 4.13.1
```bash
sudo apt install opam --compiler=4.13.1
opam init
```

### Ott
In this project, we use a customized version of ott.
To install it using `opam`, run the following from the checkout directory:
```bash
git clone https://github.com/demarkok/ott.git patched-ott
opam pin add ott patched-ott
opam upgrade -w ott
eval $(opam env)
```

### Latex
```
sudo apt install texlive-full
```
We use `rubber v. 1.6.0` to compile LaTeX.
```
pip3 install latex-rubber
```
