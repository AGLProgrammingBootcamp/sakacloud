class ReviewsController < ApplicationController
  before_action :set_review, only: [:show, :edit, :update, :destroy]
  
  # GET /reviews
  # GET /reviews.json
  def index
    @reviews = Review.all
  end

  # GET /reviews/1
  # GET /reviews/1.json
  def show
    @user = @review.user
    @sake = @review.sake
     aData = [[@review.fruity.to_i, @review.taste.to_i]]
    @graph = LazyHighCharts::HighChart.new('graph') do |f|
      f.chart(scatter: true,zoomType: 'xy') #グラフの種類
      f.pane(size:'10%')                  #グラフサイズの比
      f.title(text: 'あなたの評価')   
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
  	end
  end
  
  def create_graph
    
    @reviews = Review.all # すべての日本酒評価の情報が配列
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
    
    average_fruity = sum_fruity/i
    average_taste = sum_taste/i
    aData = [[average_fruity, average_taste]]
    
    @graph = LazyHighCharts::HighChart.new('graph') do |f|
      f.chart(scatter: true,zoomType: 'xy') #グラフの種類
      f.pane(size:'10%')                  #グラフサイズの比
      f.title(text: '')   
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
  	end
  end

  # GET /reviews/new
  def new
    @review = Review.new
  end

  # GET /reviews/1/edit
  def edit
  end

  # POST /reviews
  # POST /reviews.json
  def create
    @review = Review.new(review_params)

    respond_to do |format|
      if @review.save
        format.html { redirect_to @review, notice: '投稿できました.' }
        format.json { render :show, status: :created, location: @review }
      else
        format.html { render :new }
        format.json { render json: @review.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /reviews/1
  # PATCH/PUT /reviews/1.json
  def update
    respond_to do |format|
      if @review.update(review_params)
        format.html { redirect_to @review, notice: '修正しました' }
        format.json { render :show, status: :ok, location: @review }
      else
        format.html { render :edit }
        format.json { render json: @review.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /reviews/1
  # DELETE /reviews/1.json
  def destroy
    @review.destroy
    respond_to do |format|
      format.html { redirect_to reviews_url, notice: '消去しました.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_review
      @review = Review.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def review_params
      params.require(:review).permit(:user_id, :sake_id, :comment,:fruity,:taste)
    end
end
