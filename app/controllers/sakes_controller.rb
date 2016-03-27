class SakesController < ApplicationController
  before_action :set_sake, only: [:show, :edit, :update, :destroy]

  # GET /sakes
  # GET /sakes.json
  def index
    @sakes = Sake.all
  end

  # GET /sakes/1
  # GET /sakes/1.json
  def show
    @reviews = @sake.reviews
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
        f.series(name:'Aさん',data: aData)
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
  # GET /sakes/new
  def new
    @sake = Sake.new
  end

  # GET /sakes/1/edit
  def edit
  end

  # POST /sakes
  # POST /sakes.json
  def create
    @sake = Sake.new(sake_params)
    file = params[:sake][:image]
    @sake.set_image(file)
    respond_to do |format|
      if @sake.save
        format.html { redirect_to @sake, notice: '登録完了しました' }
        format.json { render :show, status: :created, location: @sake }
      else
        format.html { render :new }
        format.json { render json: @sake.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sakes/1
  # PATCH/PUT /sakes/1.json
  def update
    file = params[:sake][:image]
    @sake.set_image(file)
    respond_to do |format|
      if @sake.update(sake_params)
        format.html { redirect_to @sake, notice: '情報を編集しました' }
        format.json { render :show, status: :ok, location: @sake }
      else
        format.html { render :edit }
        format.json { render json: @sake.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sakes/1
  # DELETE /sakes/1.json
  def destroy
    @sake.destroy
    respond_to do |format|
      format.html { redirect_to sakes_url, notice: '削除しました' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sake
      @sake = Sake.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def sake_params
      params.require(:sake).permit(:name, :place, :user_id)
    end
end
