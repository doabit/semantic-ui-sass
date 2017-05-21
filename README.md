# Semantic UI for Sass

`semantic-ui-sass` is an Sass-powered version of [Semantic UI](https://github.com/Semantic-Org/Semantic-UI) and ready to drop into Rails & Compass.

[![Build Status](https://travis-ci.org/doabit/bootstrap-sass-extras.png?branch=master)](https://travis-ci.org/doabit/bootstrap-sass-extras)

## NOTE

The gem only has default theme.

## Installation and Usage

```ruby
gem 'semantic-ui-sass', git: 'https://github.com/doabit/semantic-ui-sass.git'
```

`bundle install` and restart your server to make the files available through the pipeline.

# semantic-ui-sass with Rails

## CSS

Import Semantic in an SCSS file (for example, `application.css.scss`) to get all of Semantic's styles

```css
@import "semantic-ui";
```

You can also include modules

```css
@import "semantic-ui/collections/menu";
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

## All variables, you can custom any of that
```css
$import-google-fonts: true !default;
$font-url: 'https://fonts.googleapis.com/css?family=Lato:400,700,400italic,700italic&subset=latin,latin-ext' !default;
$font-name: 'Lato' !default;
$font-family: $font-name, 'Helvetica Neue', Arial, Helvetica, sans-serif !default;
```

## Javascripts

We have a helper that includes all Semantic javascripts. Put this in your Javascript manifest (usually in `application.js`) to

```js
// Loads all Semantic javascripts
//= require semantic-ui
```

You can also load individual modules, provided you also require any dependencies.

```js
//= require semantic-ui/modal
//= require semantic-ui/dropdown
```

# semantic-ui-sass with Compass

## New project

Install the gem and create a new project using the gem.

```console
gem install semantic-ui-sass
compass create compass-project -r semantic-ui-sass --using semantic-ui
```

This will sort a few things out:

* You'll get a starting `styles.scss`
* You'll get a compiled stylesheet compiled & ready to drop into your application
* We'll also copy the Semantic javascripts & images & fonts into their respective folders for you

## Existing project

Install the gem, add the require statement to the top of your configuration file, and install the extension.

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

When using compass, you should visit file in local server, eg `http://localhost:3000/index.html`, rather than `file:///Users/doabit/demo/index.html`

## In a meteor.js project
Add the dependency to your project smart.json file
```json
"semantic-ui-sass": {
  "git": "git@github.com:doabit/semantic-ui-sass.git"
}
```
and then also import it in your main *.scss file
```scss
@import 'packages/semantic-ui-sass/app/assets/stylesheets/semantic-ui';
```

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

* Add global variables
* Add rails helpers like `render_flash`?

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
