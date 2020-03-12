# IMenu

## Установка

`yarn add imenu`




## Использование

__Без sass настроек__

```js
import "imenu"
import "imenu/dist/css.css"
```

__С использованием своих настроек для меню__

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




## Разработка

Запустить оба webpack процесса:

1. `./bash/build.sh` — компиляция src в dist;
2. `./bash/test.sh` — сбор теста в test/public.




## Лицензия

[MIT License](https://opensource.org/licenses/MIT).
