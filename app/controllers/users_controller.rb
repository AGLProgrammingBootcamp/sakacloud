class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  # GET /users
  # GET /users.json
  def index
    @users = User.all
  end

  # GET /users/1
  # GET /users/1.json
  def show
    @reviews = @user.reviews
    @sakes = @user.sakes
    sum_fruity = 0
    sum_taste = 0
    average_fruity = 0
    average_taste = 0
    i = 0

    @reviews.each do |review|
      sum_fruity += review[:fruity].to_i
      sum_taste += review[:taste].to_i
      i += 1
    end
    if i != 0 then
      average_fruity = sum_fruity/i
      average_taste = sum_taste/i
      aData = [[average_fruity, average_taste]]
    
      @graph = LazyHighCharts::HighChart.new('graph') do |f|
        f.chart(scatter: true,zoomType: 'xy') #グラフの種類
        f.pane(size:'10%')                  #グラフサイズの比
        f.title(text: '平均値')   
        f.xAxis(title: {
                  enabled: true,
                  text: '香り'
              },
              startOnTick: true,
              endOnTick: true,
              showLastLabel: true,
              min:-2,max:2
              )#タイトル
        f.yAxis(title: {text: "味"} ,min:-2,max:2) #各項目の最大値やら
        f.series(name:'',data: aData)
        f.legend(
              layout: 'vertical',
              align: 'left',
              verticalAlign: 'top',
              x: 50,
              y: 50,
              floating: true,
              borderWidth: 1
          )
        @graph_comp = 1
      end
  	 else
  	  @graph_comp = 0
  	end
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end
  
  def list
    @users = User.all
  end
  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to users_path, notice: "ユーザが保存されました"
    else
      render :new
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    if @user.update(user_params)
      redirect_to user_path, notice: "ユーザ情報を変更しました"
    else
      render :edit
    end
  end    

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: '削除しました' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:name, :email, :password)
    end
end
