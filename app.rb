require 'sinatra/base'
require 'sinatra/reloader'

class ExtraLunches < Sinatra::Base
  configure do
    set :views, settings.root + '/'
  end

  configure :development do
    register Sinatra::Reloader
  end


  get '/' do
    lunches = ENV['EXTRA_LUNCHES'].to_i

    erb :index, locals: {
      extra_lunches: lunches,
      status: lunches < 10 ? 'up' : 'down'
    }
  end
end
