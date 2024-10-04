# frozen_string_literal: true

Rails.application.routes.draw do
  get 'up', to: "healths#show"
end