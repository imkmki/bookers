Rails.application.routes.draw do

  root 'homes#top' # トップページを homes#top に設定
  resources :books
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
