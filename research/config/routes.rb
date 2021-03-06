ActionController::Routing::Routes.draw do |map|

  # custom mappings... find out why for instance, categories/json isn't mapped to by the map.resources calls.

  map.courses_json '/courses/json', :controller => 'courses', :action => 'json' 
  map.categories_json '/categories/json', :controller => 'categories', :action => 'json'
  map.proglangs_json '/proglangs/json', :controller => 'proglangs', :action => 'json' 


  map.resources :pictures

#  map.connect '/jobs/list', :controller => 'jobs', :action => 'index'
  map.activate_job      '/jobs/activate/:id',         :controller => 'jobs',    :action => 'activate'
  map.new_job_applic    '/jobs/:job_id/apply',        :controller => 'applics', :action => 'new'
  map.create_job_applic '/jobs/:job_id/doapply',      :controller => 'applics', :action => 'create', :method => 'post'
  map.list_jobs_applics '/jobs/:job_id/applications', :controller => 'applics', :action => 'index'
  map.applic            '/applications/:id',          :controller => 'applics', :action => 'show'
  map.destroy_applic    '/applications/:id/withdraw', :controller => 'applics', :action => 'destroy'
  map.applic_resume     '/applications/:id/resume',   :controller => 'applics', :action => 'resume'
  map.applic_transcript '/applications/:id/transcript', :controller=>'applics', :action => 'transcript'
  map.job_search        '/search',                    :controller => 'jobs',    :action => 'index'
  map.resources :jobs   # Must be last so the above routes take precedence

  map.resources :reviews

  map.resources :categories 

  map.resources :documents

  map.logout '/logout', :controller => 'sessions', :action => 'destroy'
  map.login '/login', :controller => 'sessions', :action => 'new'
  map.register '/register', :controller => 'users', :action => 'create'
  map.signup '/signup', :controller => 'users', :action => 'new'
  
  map.resources :users
  
  map.resource :session

  map.dashboard '/dashboard', :controller => :dashboard, :action => :index

  # The priority is based upon order of creation: first created -> highest priority.

  # Sample of regular route:
  #   map.connect 'products/:id', :controller => 'catalog', :action => 'view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   map.purchase 'products/:id/purchase', :controller => 'catalog', :action => 'purchase'
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   map.resources :products

  # Sample resource route with options:
  #   map.resources :products, :member => { :short => :get, :toggle => :post }, :collection => { :sold => :get }

  # Sample resource route with sub-resources:
  #   map.resources :products, :has_many => [ :comments, :sales ], :has_one => :seller
  
  # Sample resource route with more complex sub-resources
  #   map.resources :products do |products|
  #     products.resources :comments
  #     products.resources :sales, :collection => { :recent => :get }
  #   end

  # Sample resource route within a namespace:
  #   map.namespace :admin do |admin|
  #     # Directs /admin/products/* to Admin::ProductsController (app/controllers/admin/products_controller.rb)
  #     admin.resources :products
  #   end

  # You can have the root of your site routed with map.root -- just remember to delete public/index.html.
  # map.root :controller => "welcome"
  
  map.root :controller => "home"
  
  # See how all your routes lay out with "rake routes"

  # Install the default routes as the lowest priority.
  # Note: These default routes make all actions in every controller accessible via GET requests. You should
  # consider removing or commenting them out if you're using named routes and resources.
  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end
