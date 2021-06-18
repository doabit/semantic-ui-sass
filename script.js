const jsContent = `import './api.js'
import './colorize.js'
import './form.js'
import './state.js'
import './visibility.js'
import './visit.js'
import './site.js'
import './accordion.js'
import './checkbox.js'
import './dimmer.js'
import './dropdown.js'
import './embed.js'
import './modal.js'
import './nag.js'
import './popup.js'
import './progress.js'
import './rating.js'
import './search.js'
import './shape.js'
import './sidebar.js'
import './sticky.js'
import './tab.js'
import './transition.js'
`
// create semantic-ui.js
const fs = require('fs')

fs.writeFile('./src/semantic-ui.js', jsContent, err => {
  if (err) console.log('create semantic-ui.js fail', err)
})

// create semantic-ui.scss
const cssContent = `@import './globals/all';
@import './elements/all';
@import './collections/all';
@import './views/all';
@import './modules/all';
`
fs.writeFile('./src/scss/semantic-ui.scss', cssContent, err => {
  if (err) console.log('create semantic-ui.scss fail', err)
})

// replace image-url and font-url
fs.writeFileSync(
  './src/scss/elements/_icon.scss',
  fs
    .readFileSync('./src/scss/elements/_icon.scss', 'utf8')
    .replace(/font-url\(\"semantic-ui/g, `url("assets/fonts`)
)

fs.writeFileSync(
  './src/scss/elements/_flag.scss',
  fs
    .readFileSync('./src/scss/elements/_flag.scss', 'utf8')
    .replace(/image-url\(\"semantic-ui/g, `url("assets/images`)
)
