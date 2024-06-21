// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails

//= require rails-ujs
//= require turbolinks
//= require_tree .

import "@hotwired/turbo-rails"
import Rails from "@rails/ujs"
import * as ActiveStorage from "@rails/activestorage"
import "controllers"
import "item_price"


Rails.start()
ActiveStorage.start()