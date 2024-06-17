// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails

import "@hotwired/turbo-rails"
import * as Rails from '@rails/ujs';
import * as ActiveStorage from "@rails/activestorage"
import "controllers"
import "item_price"
import "hide_button"

Rails.start()
ActiveStorage.start()
