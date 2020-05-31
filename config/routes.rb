Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html


  namespace :api do
    namespace :v1 do
<<<<<<< HEAD
      resources :posts, only: [:index, :create, :show]
=======
      resources :posts, only: [:index]
      resources :likes, only: [:index]
      resources :comments, only: [:index]
>>>>>>> 820ec7691a7f252e425840df783680ae99702ce4
    end
  end

  # namespace :api do
  #   namespace :v1 do
  #     resources :comments, only: [:index, :show, :create, :edit, :update, :delete]
  #   end
  # end
<<<<<<< HEAD
  namespace :api do
    namespace :v1 do
      resources :likes, only: [:index, :create]
    end
  end
=======
  # namespace :api do
  #   namespace :v1 do
  #     resources :likes, only: [:index, :show, :delete, :edit, :update, :create]
  #   end
  # end

>>>>>>> 820ec7691a7f252e425840df783680ae99702ce4
end
