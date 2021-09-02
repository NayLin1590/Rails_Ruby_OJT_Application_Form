Rails.application.routes.draw do
  # get 'test/test'
  get 'applicants/applicants'
  root 'applicants#applicants'
  post '/confirm' , to: 'applicants#confirm'
  get '/confirm' , to: 'applicants#confirmData'
  post '/saveData' , to: 'applicants#saveData'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
