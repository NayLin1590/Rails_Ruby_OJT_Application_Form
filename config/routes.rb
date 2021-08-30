Rails.application.routes.draw do
  # get 'test/test'
  get 'applicants/applicants'
  root 'applicants#applicants'
  post '/confirm' , to: 'applicants#confirm'
  get '/confirm' , to: 'applicants#confirmData'
  post '/saveData' , to: 'applicants#saveData'
  # testing
  get '/test' , to: 'test#test'
  post '/test' , to: 'test#test'
  post '/check' , to: 'test#check'
  # get 'confirm', to: 'test#confirm'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
