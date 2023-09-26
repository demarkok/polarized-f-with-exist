# polarized-f-with-exist

## Dependencies
### Opam
```bash
sudo apt install opam
opam init
eval $(opam env --switch=default)
```

### Ott
In this project, we use a customized version of ott.
To install it using `opam`, run the following from the checkout directory:
```bash
opam pin add ott patched-ott
opam upgrade -w ott
```

### Latex
We use `latexmk` to compile LaTeX
```
sudo apt install texlive-full
sudo apt install latexmk
```

