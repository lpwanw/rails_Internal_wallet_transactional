# frozen_string_literal: true

Rails.application.routes.draw do
  if Rails.env.development?
    mount Rswag::Ui::Engine => "/api-docs"
    mount Rswag::Api::Engine => "/api-docs"
  end

  namespace :api do
    namespace :v1 do
      resource :user, controller: :user, only: [] do
        collection do
          get :me
          post :sign_in
        end
      end
    end
  end
end
