# Semantic UI for Sass

`semantic-ui-sass` is an Sass-powered version of Semantic UI.

## Installation and Usage

```ruby
gem 'semantic-ui-sass', '~> 0.0.1'
````
`bundle install` and restart your server to make the files available through the pipeline.

## Usage

### CSS

Import Semantic in an SCSS file (for example, `application.css.scss`) to get all of Semantic's styles

```css
@import "semantic-ui";
```

You can also include modules

```css
@import "semantic-ui/collections/menu";
```

### Javascripts

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

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
