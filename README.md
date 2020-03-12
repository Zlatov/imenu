# IMenu

## Install

`yarn add imenu`




## Usage

__No sass settings__

```js
import "imenu"
import "imenu/dist/css.css"
```

__Using your settings for the menu__

```js
import "imenu"
```

```scss
$imenu_width: 100px;
$background_color: #ffffff;
$hover_background_color: #dddddd;
$current_background_color: #eeeeee;
$border_color: #dddddd;
$border_radius: 4px;
$color: inherit;

@import "imenu/src/sass.scss";
```




## Development

Run both webpack processes:

1. `./bash/build.sh` — compiling src to dist;
2. `./bash/test.sh` — build in test/public.




## License

[MIT License](https://opensource.org/licenses/MIT).
