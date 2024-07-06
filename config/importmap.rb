pin "application", preload: true
pin "@hotwired/turbo-rails", to: "turbo.min.js", preload: true
pin "@hotwired/stimulus", to: "stimulus.min.js", preload: true
pin "@hotwired/stimulus-loading", to: "stimulus-loading.js", preload: true
pin_all_from "app/javascript/controllers", under: "controllers"
pin "@rails/ujs", to: "@rails--ujs.js" # @7.1.3
pin "@rails/activestorage", to: "activestorage.esm.js"
pin "item_price", to: "item_price.js", preload: true
pin "application", to: "application.js", preload: true
pin "card", to: "card.js"
pin "payjp", to: "https://js.pay.jp/v2/pay.js"