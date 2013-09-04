# warden-googleapps-rails

A simple Rails integration using Google Apps OAuth.

It's built on [warden-googleapps](https://github.com/atoms/warden-googleapps), and heavily inspired by [warden-github-rails](https://github.com/fphilipe/warden-github-rails).

## Usage

`warden-googleapps-rails` provides both controller-based and router-based authentication for Rails apps.

First of all, you need to configure this gem by creating an initializer like `config/initializers/warden_googleapps_rails.rb`, and include:

```ruby
Warden::GoogleApps::Rails.setup do |config|
  # Required
  config.google_apps_domain = "thepolydice.com"
  
  # Optional
  # config.google_apps_endpoint = 
  # config.google_apps_redirect_url
end
```

### Controller-based authentication

There're several available authentication methods for controllers.

```ruby
googleapps_authenticate! # Required Google Apps login
googleapps_authenticate?

Thus you could write something like:

```ruby
class PostsController < ApplicationController
  # Require user login for all actions
  before_filter :googleapps_authenticate! 
  
  def new
  	
  # …
end
```

### Router-based authentication



## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
