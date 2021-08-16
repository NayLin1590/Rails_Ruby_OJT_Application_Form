Rails.application.routes.draw do
  get 'application_form/applicant'
  root 'application_form#applicant'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
