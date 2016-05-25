# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

# Add additional assets to the asset load path
# Rails.application.config.assets.paths << Emoji.images_path

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in app/assets folder are already added.
# Rails.application.config.assets.precompile += %w( search.js )



Rails.application.config.assets.precompile += %w( bx_loader.gif controls.png )

Rails.application.config.assets.precompile += %w( users.coffee )
Rails.application.config.assets.precompile += %w( news.coffee )
Rails.application.config.assets.precompile += %w( departments.coffee )
Rails.application.config.assets.precompile += %w( events.coffee )
Rails.application.config.assets.precompile += %w( employees.coffee )
Rails.application.config.assets.precompile += %w( linkages.coffee )
Rails.application.config.assets.precompile += %w( organizations.coffee )
Rails.application.config.assets.precompile += %w( user_sessions.coffee )

Rails.application.config.assets.precompile += %w( facilities.js )
Rails.application.config.assets.precompile += %w( home.coffee )
Rails.application.config.assets.precompile += %w( articles.js )
Rails.application.config.assets.precompile += %w( outreach_programs.js )
Rails.application.config.assets.precompile += %w( researches.js )
Rails.application.config.assets.precompile += %w( curriculums.js )
Rails.application.config.assets.precompile += %w( graduates.js )
Rails.application.config.assets.precompile += %w( static_pages.js )
