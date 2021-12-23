RailsAdmin.config do |config|
  ### Popular gems integration

  ## == Devise ==
  config.authenticate_with do
    warden.authenticate! scope: :user
  end
  config.current_user_method(&:current_user)

  ## == CancanCan ==
  config.authorize_with :cancancan

  ## == Pundit ==
  # config.authorize_with :pundit

  ## == PaperTrail ==
  # config.audit_with :paper_trail, 'User', 'PaperTrail::Version' # PaperTrail >= 3.0.0

  ### More at https://github.com/sferik/rails_admin/wiki/Base-configuration

  ## == Gravatar integration ==
  ## To disable Gravatar integration in Navigation Bar set to false
  # config.show_gravatar = true

  config.actions do
    dashboard                     # mandatory
    index                         # mandatory
    new
    export
    bulk_delete
    show
    edit
    delete
    show_in_app

    ## With an audit adapter, you can add:
    # history_index
    # history_show
  end

  config.model 'Website' do
    list do
      field :title
      field :url
      field :schedule
      field :active
    end
    object_label_method do
      :title
    end
  end

  config.model 'User' do
    configure :roles, :pg_string_array
    list do
      field :email
      field :roles
      field :last_sign_in_at
      field :last_sign_in_ip
    end
    edit do
      exclude_fields :id, :created_at, :updated_at
      field :email
      field :password
      field :password_confirmation
      field :roles
      field :last_sign_in_at
      field :last_sign_in_ip
    end
    object_label_method do
      :email
    end
  end

  config.model 'Notifier' do
    list do
      field :platform
      field :website
      field :active
    end
    edit do
      field :platform
      field :active
      field :website
      field :credentials
    end
  end
end
