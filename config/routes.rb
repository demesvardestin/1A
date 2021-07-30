Rails.application.routes.draw do
    # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
    devise_for :admins, :controllers => { :registrations => "authentication/admins/registrations" }
    devise_scope :admin do
        get '/login', to: 'devise/sessions#new'
        get '/password/settings', to: 'admins/registrations#edit'
        get '/retrieve/password', to: 'devise/passwords#new'
    end
    authenticated :admin do
        root 'admins#dashboard', as: :authenticated_user_root
        get '/profile', to: 'admins#profile'
    end
    
    namespace :blog do
        get '/filter_by_category', to: 'articles#filter_by_category'
        get '/', to: 'articles#index'
        get '/create', to: 'articles#new'
        get '/category/:category', to: 'articles#show_category', as: 'show_category'
        get '/tagged/:tag', to: 'articles#show_tag', as: 'show_tag'
        get '/article/:id/edit', to: 'articles#edit'
        get '/article/:slug/:id', to: 'articles#show', as: "show_article"
        get '/article/:slug/:id/edit', to: 'articles#edit'
        
        resources :articles
    end
    
    namespace :project do
        get '/list', to: 'projects#index'
        get '/new', to: 'projects#new'
        get '/tagged/:tag', to: 'projects#show_tag', as: 'show_tag'
        get '/:slug', to: 'projects#show', as: "show_project"
        get '/:slug/edit', to: 'projects#edit'
        get '/:project_id/add-article', to: 'projects#add_article', as: "add_article"
        resources :projects
    end
    
    namespace :freelance do
        get '/', to: 'freelance#index'
        get '/:name', to: 'freelance#show'
    end
    
    resources :comments, except: [:show, :index, :edit]
    resources :admins, only: [:create, :update]
    resources :series, only: [:create, :update, :destroy, :show]
    resources :albums, only: [:create, :update, :destroy, :show, :edit]
    
    get '/a/:id', to: 'blog/articles#article_redirect_from_short_url'
    get '/preview_post', to: 'blog/articles#preview_post'
    get '/about', to: 'pages#about'
    get '/home', to: 'pages#home'
    get '/latest', to: 'pages#latest'
    get '/series', to: 'series#index'
    get '/fitness', to: 'fitness#index'
    get '/new-series', to: 'series#new'
    get '/s/:slug', to: 'series#show', as: 'show_series'
    get '/s/:slug/edit', to: 'series#edit'
    get '/new-album', to: 'albums#new'
    get '/photography', to: 'albums#index'
    get '/photography/:id/:slug', to: 'albums#show'
    
    root "pages#home"
end
