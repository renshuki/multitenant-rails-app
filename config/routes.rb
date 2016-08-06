class SubdomainConstraint
  def self.matches?(request)
    request.subdomain.present? 
  end
end

class SubdomainBlank
  def self.matches?(request)
    request.subdomain.blank?
  end
end

Rails.application.routes.draw do
  constraints(SubdomainConstraint) do
    root 'dashboard#index', as: :subdomain_root
    devise_for :users
    resources :users, only: :index
    resources :projects
  end

  constraints(SubdomainBlank) do
    root 'welcome#index'
    resources :accounts, only: [:new, :create]
  end
end
