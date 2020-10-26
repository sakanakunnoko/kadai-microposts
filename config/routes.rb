Rails.application.routes.draw do
  #root：アクセスして一番最初のコントローラへの指示.
  #主にトップページなどに用いられる
  root to: 'toppages#index'
end
