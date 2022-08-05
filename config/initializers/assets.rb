# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = "1.0"

# Add additional assets to the asset load path.
# Rails.application.config.assets.paths << Emoji.images_path

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in the app/assets
# folder are already added.
# Rails.application.config.assets.precompile += %w( admin.js admin.css )
Rails.application.config.assets.precompile += %w( application.css )
Rails.application.config.assets.precompile += %w( application.js nprogress/nprogress.js jquery1/dist/jquery.js)
Rails.application.config.assets.precompile += %w( admins_backoffice.js fastclick/lib/fastclick.js)
Rails.application.config.assets.precompile += %w( admins_backoffice.css bootstrap/dist/js/bootstrap.js
                                                  users_backoffice.js users_backoffice.css admin_devise.css
                                                  admin_devise.js)
Rails.application.config.assets.precompile += %w( sb-admin-2.css 
                                                  custom.js custom.css)
Rails.application.config.assets.precompile += %w( jquery1/dist/jquery.js notifyjs/dist/notify.js)
