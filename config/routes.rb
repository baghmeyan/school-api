Rails.application.routes.draw do

  ###### Authorization Routs ####################################################
  post 'authentications/auth'
  ###### User Routs #############################################################
  get 'users/admins', to: 'users#show_admins'
  get 'users/students', to: 'users#show_students'
  get 'users/profile', to: 'users#profile'
  # post 'authenticate', to: 'authentications#authenticate'
  ###### Courses Routs ##########################################################
  get 'courses', to: 'courses#index'
  post 'courses', to: 'courses#create'
  delete 'courses/:id', to: 'courses#destroy'
  delete 'courses/', to: 'courses#destroy_courses'
  ###### Academic Years Routs ###################################################
  get 'academic_years/levels/:id', to: 'academic_years#levels'
  get 'academic_years', to: 'academic_years#index'
  post 'academic_years', to: 'academic_years#create'
  ###### Academic Levels Routs ##################################################
  get 'academic_levels/courses/:id', to: 'academic_levels#courses'
  get 'academic_levels/teachers/:id', to: 'academic_levels#teachers'
  get 'academic_levels/academic_year/:id', to: 'academic_levels#academic_year'
  get 'academic_levels/students/:id', to: 'academic_levels#students'
  post 'academic_levels/:academic_year_id/:name', to: 'academic_levels#create'
  ###### Semester ###############################################################
  get 'semesters', to: 'semesters#index'
  get 'semesters/students/:id', to: 'semesters#students'
  post 'semesters', to: 'semesters#create'
  ###### Student ################################################################
  get 'students', to: 'students#index'
  get 'students/grades', to: 'students#my_grades'
  ###### Teacher ################################################################
  get 'teachers/courses', to: 'teachers#courses'
  get 'teachers/students/:id', to: 'teachers#students'
  get 'teachers/academic_levels', to: 'teachers#academic_levels'
  ###### Grade ################################################################
  post 'grades', to: 'grades#create'
  put 'grades/:id', to: 'grades#update'
  ###############################################################################
  resources :users do
    member do
      get :delete
    end
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
