
class RegistrationsController < Devise::RegistrationsController
  prepend_before_filter :authenticate_scope!, only: [:new, :create, :cancel, :edit, :update, :destroy]
	skip_before_filter :require_no_authentication

end