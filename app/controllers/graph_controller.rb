class GraphController < ApplicationController
  
  def culculate_average(@review)
    @user=@review.user
    @sake=@review.sake
    @user.fruity.each_with_index do |review, i|
      @furuity=@
    end
    @average_furuity=@fruity/i
  end
  
  def create_graph(ave_fruity,…)
    
    @reviews = Review.all # すべての日本酒評価の情報が配列
        @chart_data = []
        @reviews.each_with_index do |review, i| # 1行ずつ
        
            @chart_data << [ i, review.fruity,review.unique,review.light,review.clear ]
        end
    
    #1つ：特定ユーザーが記録したsakesの4指標を取り出す　
    #1つ：記録された特定日本酒のreviewsの4指標を取り出す
    #各指標の平均値を計算する
    
    genre = ['香りが高い','クセがある','香りがひかえめ','のみくちが良い']
      aData = [ave_fruity,ave_unique,ave_light,average_clear]
      #bData = [4,5,9,1] #二件目のデータ
  
      @graph = LazyHighCharts::HighChart.new('graph') do |f|
        f.chart(polar: true,type:'line') #グラフの種類
        f.pane(size:'80%')                  #グラフサイズの比
        f.title(text: 'Aさんの好み')         #タイトル
        f.xAxis(categories: genre,tickmarkPlacement:'on') #categories:各項目の名前,tickmarkPlacement:'on'だとメモリ表示がカテゴリーの表示に沿う
        f.yAxis(gridLineInterpolation: 'polygon',lineWidth:0,min:0,max:3) #各項目の最大値やら
        f.series(name:'Aさん',data: aData,pointPlacement:'on')
                                                     #各データ
        #f.series(name:'sake_review',data: bData,pointPlacement:'on') #二件目のグラフ表示
        f.legend(align: 'right',
  	        verticalAlign: 'top',
  	        y: 70,
  	        layout: 'vertical')
      end
  end
end
