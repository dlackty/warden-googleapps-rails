# warden-googleapps-rails

A simple Rails integration using Google Apps OAuth.

It's built on [warden-googleapps](https://github.com/atoms/warden-googleapps), and heavily inspired by [warden-github-rails](https://github.com/fphilipe/warden-github-rails).

## Usage

`warden-googleapps-rails` provides both controller-based and router-based authentication methods for Rails apps.

First of all, you need to configure this gem by creating an initializer like `config/initializers/warden_googleapps_rails.rb`, and include:

```ruby
Warden::GoogleApps::Rails.setup do |config|
  # Required
  config.google_apps_domain = "example.org"
  
  # Optional
  # config.google_apps_endpoint = "http://www.google.com/accounts/o8/id" # this is gmail
  # config.google_apps_redirect_url =  "http://example.org/verify_url" # endpoint where google apps redirects to after successful authentication
end
```

### Controller Helpers

There're several authentication methods for controllers.

```ruby
# Redirect user to Google Apps OAuth if user not log in
googleapps_authenticate!

# Return whether user has logged in
googleapps_authenticate? 

# Get user object
googleapps_user

# Log out
googleapps_logout
```

Thus you could write something like:

```ruby
class PostsController < ApplicationController
  # Ask user log in for all actions
  before_filter :googleapps_authenticate! 
  
  def new
  	@user = googleapps_user
  	# …
  end
  # …
end
```

### Router Constraints

In your `routes.rb` you could simply wrap your resources:

```ruby
MyApp::Application.routes.draw do
  # …

  namespace :admin do do    
    # Initialize Google Apps authentication flow if user not log in
    googleapps_authenticate do
      resources :posts
    end
    
    # Require user log in but will not redirect to OAuth flow
    googleapps_authenticated do
      resources :users
    end
  # …
  end

end
```

## Contact

Richard Lee

- http://github.com/dlackty
- http://twitter.com/dlackty
- dlackty@gmail.com

## License

`warden-googleapps-rails` is available under the MIT license. See the `LICENSE.txt` file for more info.
