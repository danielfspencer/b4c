### b4c
Standalone compiler and assembler for Blizzard 4. The compiler and the assembler are taken directly
from the corresponding version of the [GUI toolchain app](https://github.com/danielfspencer/blizzard-4/). Both projects
use the same version numbers.

```
Usage: b4c [options] <file>

Options:
  -V, --version           output the version number
  -o --output <filename>  output filename
  -c --compile            compile the input file
  -a --assemble           assemble the input file
  -v --verbose            print debugging messages
  -d --dump               dump the compiler's AST to ast.json
  -q --quiet              only print error messages
  -h, --help              display help for command
  If neither -c nor -a is specified then the input
  files's extension determines the mode

  - Compile program.b4 into program.asm
  $ b4c program.b4

  - Compile then assemble program.b4 into program.bin
  $ b4c -ca program.b4

  - Assemble program.asm into program.bin
  $ b4c program.asm
```

### Prebuilt Binaries
https://github.com/danielfspencer/b4c/releases/latest

### Source Code
To get the source for the latest released version, type:

```bash
git clone https://github.com/danielfspencer/b4c
```

Install the libraries required with:
```bash
cd b4c
npm install
```

Run directly from source with:
```bash
node b4c.js
```

Or, build a binary for your OS. The generated executable is found in the ```dist/``` folder.
```bash
npm run dist
```

If you are running Linux, you can then install the binary for user-wide use with:
```bash
`cp dist/b4c ~/.local/bin`
```

You can then invoke the compiler by typing
```bash
b4c
```
anywhere.
