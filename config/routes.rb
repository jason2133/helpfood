Rails.application.routes.draw do

  get 'userrequests/index'

  get 'userrequests/new'

  get 'userrequests/ask'

  get 'edit_asks/index'
  get 'edit_asks/ask'

  ##------resources :zizuminfos 보다 위에
  get 'zizuminfos/search'
  ##-------------------------------------
  
  resources :zizuminfos
  post '/zizuminfos/:id/follow', to: 'follows#zizum_back_follow_toggle', as: 'zizum_back_follow'
  post '/menus/index/params', to: 'follows#zizum_front_follow_toggle', as: 'zizum_front_follow'

  get 'home/index'
  root 'home#index'
  get 'home/about'

  #----------resouces :restaurants 보다 위에 가게 해야 함! --------------------
  get 'restaurants/search' => "restaurants#search"
  get 'menus/search/' => "menus#search"
  get 'menus/getMenu' => "menus#getMenu"
  # get 'allergies/index' => "allergies#index", as: 'allergies' 
  get 'menus/index' => "menus#index", as: 'menus'

  resources :menus #메뉴
  resources :restaurants
  ##-------------------------------------------------------------------------------------------master//

  ### 로그인과 관리자 페이지 ### rails/db 관리자설정으로바꾸려면 config/initializer/rails_db 주석해제!
  devise_for :users, :controllers => { omniauth_callbacks: 'user/omniauth_callbacks', registraions: 'user/registrations'}
  devise_scope :user do
    get 'editsns', :to => 'devise/registrations#editsns'
  end

  #get '/profiles/new' => 'profiles#new', as: :user_root # creates user_root_path
  # get '/profiles/:user_id' => 'profiles#show', as: :user_root
  #namespace :user do
  #  root 'profiles#new' # creates user_root_path
  #end

  ## for 사업자 ##
  devise_scope :owner do
    get 'owners/search' => 'owners/sessions#search' , as: 'search_path'
  end
  devise_for :owners, path: 'owners', controllers: { sessions: "owners/sessions", registraions: 'owners/registrations'}
  get 'home/myrt' => 'home#myrt'

  # devise_for :admins 관리자페이지 admin설정하려면 주석해제 +initializer/rails_admin도!
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin' #devise보다 아래위치

  ### 알림 ###
  get '/new_alarms/read_all' => 'new_alarms#read_all'# 전체 삭제
  resources :new_alarms  #알림 삭제보다아래위치
  resources :boards #임시

  ### api테스트 ###
  get 'result2/:keyword' => 'boards#result2' 

  ### 나만의 페이지 ###
  resources :profiles

  get '/zizuminfos/:id/follow_destroy', to: 'follows#profile_follow_destroy_toggle', as: 'profile_follow_destroy'

  ### Public Market ###
  resources :articles
  post '/articles/:id/follow', to: 'follows#article_follow_toggle', as: 'article_follow'
  
  ### 회원가입 Devise ###
  # devise_for :users

  ### 크롤링 ###
  get '/crawling' => 'restaurants#crawling'
  
  ### 수정 / 삭제 요청 ###
  #요청 확인
  get '/userrequests' => 'userrequests#index'
  #메뉴 추가 요청
  get '/userrequests/new_request' => 'userrequests#new_request'
  post '/userrequests/create' => 'userrequests#create'
  #메뉴 수청 / 삭제 요청
  get '/userrequests/edit_request' => 'userrequests#edit_request'
  post '/userrequests/edit_request' => 'userrequests#edit_request'
  #승인
  post '/userrequests/permit' => 'userrequests#permit'


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  ## 수정 / 삭제 요청 ###
  #요청 확인
  get '/userrequests' => 'userrequests#index'
  #메뉴 추가 요청
  get '/userrequests/new_request' => 'userrequests#new_request'
  post '/userrequests/create' => 'userrequests#create'
  #메뉴 수청 / 삭제 요청
  get '/userrequests/edit_request' => 'userrequests#edit_request'
  post '/userrequests/edit_request' => 'userrequests#edit_request'
  #승인
  post '/userrequests/permit' => 'userrequests#permit'
end
