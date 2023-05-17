# polarized-f-with-exist

## Dependencies
### Ott
In this project, we use a customized version of ott.
To install it using `opam`, run the following from the checkout directory:
```bash
opam pin add ott patched-ott
opam upgrade -w ott
```
### Rubber
We use `rubber` to compile LaTeX

```bash
sudo apt install rubber
```