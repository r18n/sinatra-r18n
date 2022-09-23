# Sinatra R18n Plugin

[![Cirrus CI - Base Branch Build Status](https://img.shields.io/cirrus/github/r18n/sinatra-r18n?style=flat-square)](https://cirrus-ci.com/github/r18n/sinatra-r18n)
[![Codecov branch](https://img.shields.io/codecov/c/github/r18n/sinatra-r18n/main.svg?style=flat-square)](https://codecov.io/gh/r18n/sinatra-r18n)
[![Code Climate](https://img.shields.io/codeclimate/maintainability/r18n/sinatra-r18n.svg?style=flat-square)](https://codeclimate.com/github/r18n/sinatra-r18n)
[![Depfu](https://img.shields.io/depfu/r18n/sinatra-r18n?style=flat-square)](https://depfu.com/repos/github/r18n/sinatra-r18n)
[![License](https://img.shields.io/github/license/r18n/sinatra-r18n.svg?style=flat-square)](LICENSE)
[![Gem](https://img.shields.io/gem/v/sinatra-r18n.svg?style=flat-square)](https://rubygems.org/gems/sinatra-r18n)

Sinatra extension which provides i18n support to translate your web application.

It is a wrapper for [R18n core library](https://github.com/r18n/r18n-core).
See [R18n documentation](https://github.com/r18n/r18n-core/blob/main/README.md)
for more information.

# Features

* Nice Ruby-style syntax.
* Filters.
* Flexible locales.
* Custom translations loaders.
* Translation support for any classes.
* Time and number localization.
* Several user language support.

# How To

1.  Create translations dir `./i18n/`.

2.  Add file with translation to `./i18n/` with language code in file name
    (for example, `en.yml` for English or `en-us.yml` USA English dialect).
    For example, `./i18n/en.yml`:

    ```yaml
    post:
      friends: Post only for friends
      tags: Post tags are %1

    comments: !!pl
      0: No comments
      1: One comment
      n: '%1 comments'

    html: !!html
      <b>Don't escape HTML</b>
    ```

3.  Add R18n to your Sinatra application:
    ```ruby
    require 'sinatra/r18n'
    ```
    If your application inherits from `Sinatra::Base` also add:
    ```ruby
    class YourApp < Sinatra::Base
      register Sinatra::R18n
      set :root, __dir__
    ```

4.  Add locale to your URLs. For example:
    ```ruby
    get '/:locale/posts/:id' do
      @post = Post.find(params[:id])
      haml :post
    end
    ```
    Or save locale in session, when user change it:

    ```ruby
    before do
      session[:locale] = params[:locale] if params[:locale]
    end
    ```

    **Warning**: such hooks have to be before `register Sinatra::R18n` since R18n version 5
    has no more lazy evaluation and initializes immediately. See #3 or specs / test application.

5.  Use translation messages in views. For example in HAML:
    ```haml
    %p= t.post.friends
    %p= t.post.tags(@post.tags.join(', '))

    %h2= t.comments(@post.comments.size)
    ```

6.  Print localized time and numbers. For example:
    ```ruby
    l @post.created_at, :human
    ```

7.  Print available translations. For example in HAML:
    ```haml
    %ul
      - r18n.available_locales.each do |locale|
        %li
          %a( href="/#{locale.code}/" )= locale.title
    ```

# Configuration

You can change default locale and translations dir:

```ruby
R18n::I18n.default = 'ru'
R18n.default_places { './translations' }
```

# License

R18n is licensed under the GNU Lesser General Public License version 3.
You can read it in LICENSE file or in [www.gnu.org/licenses/lgpl-3.0.html](https://www.gnu.org/licenses/lgpl-3.0.html).

# Author

Andrey “A.I.” Sitnik [andrey@sitnik.ru](mailto:andrey@sitnik.ru)
