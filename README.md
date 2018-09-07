This repository provides a copy of the Twemoji image set, optimized for the web.

<img width="40" height="40" src="https://cdn.jsdelivr.net/gh/s9e/emoji-assets-twemoji/dist/svgz/1f929.svgz">


## How to build

You will need Bash, npm and zopfli installed. Run `scripts/init.sh` to install git submodules and svgo, then run 
`scripts/build.sh` to rebuild the files in the `dist` directory. The process is single threaded and will take several minutes.


## Assets

Images in the `dist` directory are derived from the [Twemoji](https://github.com/twitter/twemoji) images.

Filenames have been normalized and the SVG content has been minified with [SVGO](https://github.com/svg/svgo/) before being compressed with [zopfli](https://github.com/google/zopfli).


## License

- Tools in the `scripts` directory are under the [MIT license](scripts/LICENSE).
- Images in the `dist` directory are licensed under [CC-BY 4.0](dist/LICENSE-GRAPHICS), Copyright Twitter, Inc and [other contributors](https://github.com/twitter/twemoji/graphs/contributors).


## Differences from Twemoji

- SVG content has been minified with SVGO.
- SVG files have been compressed with zopfli to produce SVGZ files.
- Filenames have been normalized to use 4- and 5- digits hex values, and exclude `200f` and `fe0f`. For instance, the image named `a9.svg` in Twemoji is available as `00a9.svgz` in this repository.


## Contributions

This repository is not open for external contributions. If you have a suggestion that pertains exclusively to this repository, you can open a new issue to discuss it. If you have a suggestion or a pull request that pertains to the art, please direct it to their author.
