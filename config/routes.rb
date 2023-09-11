# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resource :user, controller: :user, only: [] do
        collection do
          post :sign_in
        end
      end
    end
  end
end
