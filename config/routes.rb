Rails.application.routes.draw do

 devise_for :users,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}

  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
}
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  scope module: :public do
    root to: 'homes#top'
    get 'posts/list' => 'posts#list',as: 'list'
    resources :posts
    get 'users/my_page' => 'users#show',as: 'my_page'
    get 'users/ragistration_edit' => 'users#edit',as: 'user_edit'
    patch 'users/ragistration_edit' => 'users#update',as: 'user_update'
    get 'users/confirm' => 'users#confirm',as: 'confirm'
    patch 'users/secession' => 'users#secession',as: 'secession'
  end

  namespace :admin do
    root to: 'posts#top'
    resources :users,only:[:index, :edit, :update]
    resources :posts, only:[:index, :show, :update] do
      member do
        get 'list'
      end
    end
  end

end
