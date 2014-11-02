Pharaoh::Application.routes.draw do

  authenticated :user do
    root to: 'home#index', as: :authenticated_root
  end

  authenticate :user, lambda { |user| user.is_admin? } do
    mount PgHero::Engine, at: 'system/admin/db/pg'
  end

  root to: 'static_pages#index'

  resources :styles, only: :index

  devise_for :users,
    controllers: {
      passwords: 'users/passwords',
      unlocks: 'users/unlocks',
      confirmations: 'users/confirmations'
    },
    skip: [:sessions, :registrations]

  devise_scope :user do
    # sessions
    get 'login', to: 'users/sessions#new', as: :new_user_session
    post 'login', to: 'users/sessions#create', as: :user_session
    delete 'logout', to: 'users/sessions#destroy', as: :destroy_user_session

    # registrations
    get 'register', to: 'users/registrations#new',
      as: :new_user_registration

    get 'account/cancel',
      to: 'users/registrations#cancel',
      as: :cancel_user_registration

    post 'account',
      to: 'users/registrations#create',
      as: :user_registration

    get 'account/edit',
      to: 'users/registrations#edit',
      as: :edit_user_registration

    patch 'account', to: 'users/registrations#update', as: ''
    put 'account', to: 'users/registrations#update', as: ''
    delete 'account', to: 'users/registrations#destroy', as: ''
  end

  concern :pagination do
    get 'page/:page', action: :index, on: :collection
  end

  scope 'system' do
    namespace :admin do
      root to: 'static_pages#index', as: :root #= admin_root

      resources :users, concerns: :pagination do
        collection do
          post 'enable/:id', action: :enable, as: :enable
        end
      end

      namespace :server do
        resources :stats, only: :index do
          get 'processes', on: :collection
        end
      end
    end
  end
end
