class UsersController < ApplicationController
  before_action :require_user_logged_in, only: [:index, :show]
  #一覧を表示
  def index
    @users = User.order(id: :desc).page(params[:page]).per(25)
  end
 #レコードの内容を表示
  def show
    @user = User.find(params[:id])
    @microposts = @user.microposts.order(id: :desc).page(params[:page])
    counts(@user)
  end
 #リソースを新規作成
  def new
    @user = User.new
  end
 #newから受け取る
  def create
    @user = User.new(user_params)

    if @user.save
      flash[:success] = 'ユーザを登録しました。'
      #create アクション実行後に更に show アクションが実行され、
      #show.html.erb が呼ばれる
      redirect_to @user
    else
      flash.now[:danger] = 'ユーザの登録に失敗しました。'
      #単に users/new.html.erb を表示するだけ
      render :new
    end
  end
  
  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
