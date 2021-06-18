# Semantic UI for Sass

`semantic-ui-sass` is an Sass-powered version of
[Semantic UI](https://github.com/Semantic-Org/Semantic-UI) and ready to drop
into Rails, Compass, or Sprockets.

[![Build Status](https://travis-ci.org/doabit/semantic-ui-sass.svg?branch=master)](https://travis-ci.org/doabit/semantic-ui-sass)

## NOTE

The gem only has default theme.

## Installation and Usage

```ruby
gem 'semantic-ui-sass'
```

`bundle install` and restart your server to make the files available through the
pipeline.

# semantic-ui-sass with Rails or Sprockets

## CSS

Import Semantic in an SCSS file (for example, `application.css.scss`) to get all
of Semantic's styles

```css
@import 'semantic-ui';
```

You can also include modules

```css
@import 'semantic-ui/collections/menu';
```

## Custom font

```css
$font-url: 'http://fonts.useso.com/css?family=Lato:400,700,400italic,700italic&subset=latin';
@import 'semantic-ui';
```

## Skip font loading

```css
$import-google-fonts: false;
@import 'semantic-ui';
```

## Custom font family

```css
$font-family: 'custom-font-family';
@import 'semantic-ui';
```

### Skip use of custom scrollbars

```css
$use-custom-scrollbars: false;
@import 'semantic-ui';
```

## All variables, you can custom any of that

Fonts:

```css
$font-name: 'Lato' !default;
$font-family: $font-name, 'Helvetica Neue', Arial, Helvetica, sans-serif !default;
$font-url: 'https://fonts.googleapis.com/css?family=Lato:400,700,400italic,700italic&subset=latin,latin-ext' !default;
$import-google-fonts: true !default;
```

Scrollbars:

```css
$use-custom-scrollbars: true !default;
```

Breakpoints:

```css
$mobile-breakpoint: 320px !default;
$tablet-breakpoint: 768px !default;
$computer-breakpoint: 992px !default;
$large-monitor-breakpoint: 1200px !default;
$widescreen-monitor-breakpoint: 1920px !default;
```

## Javascripts

### Ruby on Rails Version 5

We have a helper that includes all Semantic javascripts. Put this in your
Javascript manifest (usually in `application.js`) to

```js
// Loads all Semantic javascripts
//= require semantic-ui
```

You can also load individual modules, provided you also require any
dependencies.

```js
//= require semantic-ui/modal
//= require semantic-ui/dropdown
```

### Ruby on Rails Version 6+

Add packages with yarn:

```console
yarn add jquery popper.js @doabit/semantic-ui-sass
```

In config/webpack/environment.js add the following:

```js
const webpack = require('webpack')

environment.plugins.append(
  'Provide',
  new webpack.ProvidePlugin({
    $: 'jquery',
    jQuery: 'jquery',
    Popper: ['popper.js', 'default']
  })
)
```

In app/javascript/packs/application.js add the following:

```js
import '@doabit/semantic-ui-sass'
import '@doabit/semantic-ui-sass/src/scss/semantic-ui.scss'
```

# semantic-ui-sass with Compass

## New project

Install the gem and create a new project using the gem.

```console
gem install semantic-ui-sass
compass create compass-project -r semantic-ui-sass --using semantic-ui
```

This will sort a few things out:

- You'll get a starting `styles.scss`
- You'll get a compiled stylesheet compiled & ready to drop into your
  application
- We'll also copy the Semantic javascripts & images & fonts into their
  respective folders for you

## Existing project

Install the gem, add the require statement to the top of your configuration
file, and install the extension.

```console
gem install semantic-ui-sass
```

```ruby
# In config.rb
require 'semantic-ui-sass'
```

```console
compass install semantic-ui
```

### NOTE

When using compass, you should visit file in local server, eg
`http://localhost:3000/index.html`, rather than
`file:///Users/doabit/demo/index.html`

# Rails Helpers

## Breadcrumbs helper

Add breadcrumbs helper `<%= semantic_breadcrumbs %>` to your layout.

```ruby
class ApplicationController
  semantic_breadcrumb :index, :root_path
end
```

```ruby
class ExamplesController < ApplicationController
  semantic_breadcrumb :index, :examples_path

  def index
  end

  def show
    @example = Example.find params[:id]
    semantic_breadcrumb @example.name, example_path(@example)
    # semantic_breadcrumb :show, example_path(@example)
  end
end
```

## Flash helper

Add flash helper `<%= semantic_flash %>` to your layout

## Icon helper

```ruby
semantic_icon('add')
# => <i class="add icon"></i>
semantic_icon(:add)
# => <i class="add icon"></i>
semantic_icon('add sign')
# => <i class="add sign icon"></i>
semantic_icon('add', 'sign')
# => <i class="add sign icon"></i>
semantic_icon(:add, :sign)
# => <i class="add sign icon"></i>
semantic_icon('add', id: 'id')
# => <i class="add icon" id="id"></i>
```

## TODO

- Add global variables
- Add rails helpers like `render_flash`?

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
