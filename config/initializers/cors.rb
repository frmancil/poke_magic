Rails.application.config.middleware.insert_before 0, Rack::Cors do
    allow do
      origins ['https://pokemagic-3945bd616b13.herokuapp.com']
  
      resource '*',
        headers: :any,
        methods: [:get, :post, :put, :patch, :delete, :options, :head]
    end
  end