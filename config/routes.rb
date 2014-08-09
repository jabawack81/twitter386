Twitter386::Application.routes.draw do

  get   '/auth/failure',          to: 'session#error',      as: 'failure'
  get   '/auth/twitter/callback', to: 'session#create',     as: 'callback'
  get   '/contact',               to: 'contact#index',      as: 'contact'
  get   '/followfriday',          to: 'followfriday#index', as: 'followfriday'
  get   '/signout',               to: 'session#destroy',    as: 'signout'
  root                            to: 'welcome#index'

end
