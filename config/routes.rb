Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  scope 'estates' do
    get 'paginate', to: 'estates#paginating'
    post 'search', to: 'estates#search'
  end
  resources :estates, except:[:index, :edit, :new, :delete]
end
