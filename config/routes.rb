Rails.application.routes.draw do
  # Registration & Authentication
  mount_devise_token_auth_for 'User', at: 'auth', controllers: {
      omniauth_callbacks: 'users/omniauth_callbacks',
      registrations:      'users/registrations',
      sessions:           'users/sessions',
      token_validations:  'users/token_validations',
      passwords:          'users/passwords'
  }
end
