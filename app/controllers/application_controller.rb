class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end
  get '/' do 
    @recipes = Recipe.all
    erb :index
  end
  get '/recipes' do 
   @recipes = Recipe.all
    erb :index
  end
  
  get '/recipes/new' do 
    erb :new
  end

  post '/recipes' do 
    @recipes = Recipe.create(name: params[:name], ingredients: params[:ingredients], cook_time: params[:cook_time])
    redirect "/recipes/#{@recipes.id}"
  end

  get '/recipes/:id/edit' do 
    @recipe = Recipe.find(params[:id])
    erb :edit
  end

  patch '/recipes/:id' do 
      @recipe = Recipe.find(params[:id])
      @recipe.update(name: params[:name], ingredients: params[:ingredients], cook_time: params[:cook_time])
      redirect "recipes/#{@recipe.id}"
    end
  get '/recipes/:id' do 
    @recipe = Recipe.find(params[:id])
    erb :show
  end
  delete '/recipes/:id' do 
    @recipe = Recipe.find(params[:id])
    @recipe.delete()
    redirect '/recipes'
  end



end



# @recipe = Recipe.new(name: params[:name], ingredients: params[:ingredients], cook_time: params[:cook_time])