Rails.application.routes.draw do
  root 'palindrome#show'

  get 'palindrome', to: 'palindrome#show'
  get 'calculate/:number', to: 'palindrome#calculate'
  post 'calculate', to: 'palindrome#calculate', as: :calculate
end
