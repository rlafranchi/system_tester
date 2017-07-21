---
layout: page
title: Getting Started
permalink: /getting-started/
---

## Install the Ruby Gem

Add this line to your application's Gemfile:

```ruby
gem 'system_tester', group: :development
```

Add the system_tester db to `config/database.yml`
```yml
# you may want to consider a shared MySQL/Postgres database
# if you have a team that needs shared access
system_tester:
  <<: *default
  database: db/system_tester.sqlite3
```

And then install and run the migrations:
```bash
$ bundle install
$ rails system_tester:migrate
```

Mount the engine in config/routes.rb:
```ruby
Rails.application.routes.draw do
  # ... other routes

  # Mount in development environment only
  if Rails.env.development?
    mount SystemTester::Engine => "/system_tester"
  end
end
```

Start your dev server and you are good to go.

## Install the Chrome Extension

Start your free trial and install the chrome extension from the chrome webstore:

<a id="install-button" class="c-btn" href="https://chrome.google.com/webstore/detail/system-tester/ebpjncfolmfiiphibdajgblbchkklbcf">Add to Chrome</a>