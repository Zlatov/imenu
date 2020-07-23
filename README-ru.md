# IMenu

## Установка

`yarn add imenu`




## Использование

__Без sass настроек__

```js
import "imenu/dist/css.css"
```

__С использованием своих настроек для меню__

```js
import "./custom-imenu.scss"
```

```scss
// ./custom-imenu.scss
// Собственные настройки imenu
$imenu_width: 100px;
$imenu_nested_width: 200px;
$imenu_background_color: red;
$imenu_hover_background_color: black;
$imenu_current_background_color: black;
$imenu_border_color: red;
$imenu_color: white;
$imenu_border_radius: 0;

// Стили imenu
@import "imenu/src/sass.scss";
```




## Разработка

Запустить оба webpack процесса:

1. `./bash/build.sh` — компиляция src в dist;
2. `./bash/test.sh` — сбор теста в test/public.




## Лицензия

[MIT License](https://opensource.org/licenses/MIT).
