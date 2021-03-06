Myapp::Application.routes.draw do
  
  devise_for :users,:controllers => { registrations: 'users/registrations',
                                      confirmations: 'users/confirmations', passwords: 'users/passwords' , sessions: 'users/sessions'}
  # You can have the root of your site routed with "root"



  authenticated do
    devise_scope :user do
     get "dashboards/dashboard_2", as: :authenticated_root
     get '/users/sign_out' => 'devise/sessions#destroy'
    end
  end

  unauthenticated do
    devise_scope :user do
      root to: 'landing#index'
    end
  end


  resources :business_level_settings, :path => ':domain/:user_type/business_level_settings' do
    collection do
      get :terms_conditions
      get :franchise_aggrement
      get :overview
      get :bin_types
      get :bin_locations
      get :gallery
      get :contact
    end
  end

  resources :program_settings, :path => ':domain/:user_type/program_settings' do
    collection do
      get :recycling_target
      get :data_entry
    end
    end
  namespace :business do
    resources :payments  do
      collection do
        get :payment_confirm
      end
    end
    resources :logins do
      collection do
        get :get_zipcode
        get :get_location_from_zipcode
        get :user_quote
        get :user_plan_selection
        get :amount_calculation
        get :po_and_invoice
        get :po_and_invoice_email
        get :get_invoice
        get :account_confirmation
        get :get_city_and_state
        get :invoice_confirm
      end
    end
  end

  resources :levels do
    collection do
      get :get_level
    end
  end
  resources :wgus

  resources :materials, :path => ':domain/:user_type/materials' do
    collection do
      get :material_list
      get :facility_list
      get :check_list
    end
  end

  resources :project_types, :path => ':domain/:user_type/project_types' do
  end

  resources :users, :path => ':domain/:user_type/users' do
  end

  resources :vendors

  resources :facilities, :path => ':domain/:user_type/facilities'do
    collection do
      get :facility_listing
    end
  end

  resources :tips, :path => ':domain/:user_type/tips'

  #get "wgu/:id/add_menu_level/:id"  => 'dashboards#add_menu_level'

  get "custom_level_adding/:id" => 'dashboards#custom_level_adding' ,as: :custom_level
  get "custom_wgu_adding/:id" => 'dashboards#custom_wgu_adding' ,as: :custom_wgu
  #get "bin_types/:id" => 'dashboards#add_bin_type' ,as: :bin_type
  get "bin_types/:page/:id"  => 'dashboards#add_report_type' ,as: :report_type
  # All routes

  #resources :dashboards
  get "/Wastetracking_levels_#{Date.today}" => 'dashboards#get_csv' ,as: :get_csv
  get "/Wastetracking_#{Date.today}_levels" => 'dashboards#get_pdf' ,as: :get_pdf
  post "dashboards/create" => 'dashboards#create'
  get 'dashboards/add_more_wgus'
  get "dashboards/dashboard_1"
  get "/getting_sub_levels/:id"  => 'dashboards#getting_sub_levels'
  get "dashboards/dashboard_2"
  get "dashboards/dashboard_3"
  get "dashboards/dashboard_4"
  get "dashboards/dashboard_4_1"
  get "dashboards/dashboard_5"
  get "dashboards/tracking"
  get "dashboards/organize"
  get "dashboards/tools"
  get "dashboards/new_tracking"  => 'dashboards#new_tracking' ,as: 'new_tracking'
  get "dashboards/get_liquid_only"
  get "dashboards/get_solid_only"
  get "dashboards/get_liquid_and_solid"
  
  get "layoutsoptions/index"
  get "layoutsoptions/off_canvas"

  get "graphs/flot"
  get "graphs/morris"
  get "graphs/rickshaw"
  get "graphs/chartjs"
  get "graphs/chartist"
  get "graphs/peity"
  get "graphs/sparkline"

  get "mailbox/inbox"
  get "mailbox/email_view"
  get "mailbox/compose_email"
  get "mailbox/email_templates"
  get "mailbox/basic_action_email"
  get "mailbox/alert_email"
  get "mailbox/billing_email"

  get "metrics/index"

  get "widgets/index"

  get "forms/basic_forms"
  get "forms/advanced"
  get "forms/wizard"
  get "forms/file_upload"
  get "forms/text_editor"

  get "appviews/contacts"
  get "appviews/profile"
  get "appviews/profile_two"
  get "appviews/contacts_two"
  get "appviews/projects"
  get "appviews/project_detail"
  get "appviews/file_menager"
  get "appviews/vote_list"
  get "appviews/calendar"
  get "appviews/faq"
  get "appviews/timeline"
  get "appviews/pin_board"
  get "appviews/teams_board"
  get "appviews/social_feed"
  get "appviews/clients"
  get "appviews/outlook_view"
  get "appviews/blog"
  get "appviews/article"
  get "appviews/issue_tracker"

  get "pages/search_results"
  get "pages/lockscreen"
  get "pages/invoice"
  get "pages/invoice_print"
  get "pages/login"
  get "pages/login_2"
  get "pages/forgot_password"
  get "pages/register"
  get "pages/not_found_error"
  get "pages/internal_server_error"
  get "pages/empty_page"

  get "miscellaneous/notification"
  get "miscellaneous/nestablelist"
  get "miscellaneous/timeline_second_version"
  get "miscellaneous/forum_view"
  get "miscellaneous/forum_post_view"
  get "miscellaneous/google_maps"
  get "miscellaneous/code_editor"
  get "miscellaneous/modal_window"
  get "miscellaneous/validation"
  get "miscellaneous/tree_view"
  get "miscellaneous/chat_view"
  get "miscellaneous/agile_board"
  get "miscellaneous/diff"
  get "miscellaneous/sweet_alert"
  get "miscellaneous/idle_timer"
  get "miscellaneous/spinners"
  get "miscellaneous/live_favicon"
  get "miscellaneous/masonry"

  get "uielements/typography"
  get "uielements/icons"
  get "uielements/draggable_panels"
  get "uielements/buttons"
  get "uielements/video"
  get "uielements/tables_panels"
  get "uielements/tabs"
  get "uielements/notifications_tooltips"
  get "uielements/badges_labels_progress"

  get "gridoptions/index"

  get "tables/static_tables"
  get "tables/data_tables"
  get "tables/foo_tables"
  get "tables/jqgrid"

  get "commerce/products_grid"
  get "commerce/products_list"
  get "commerce/product_edit"
  get "commerce/product_detail"
  get "commerce/orders"
  get "commerce/payments"

  get "gallery/basic_gallery"
  get "gallery/slick_carusela"
  get "gallery/bootstrap_carusela"

  get "cssanimations/index"

  get "landing/index"

end
