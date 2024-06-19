// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails

import "@hotwired/turbo-rails"
import Turbolinks from "turbolinks"
import Rails from "@rails/ujs"
import * as ActiveStorage from "@rails/activestorage"
import "controllers"
import "item_price"


Rails.start()
ActiveStorage.start()
