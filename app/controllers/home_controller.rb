class HomeController < ApplicationController
  def top
  end
  
  def graph
      genre = ['香','軽','コク','熟成']
      aData = [7,3,2,8]
      bData = [4,5,9,1] #二件目のデータ
  
      @graph = LazyHighCharts::HighChart.new('graph') do |f|
        f.chart(polar: true,type:'line') #グラフの種類
        f.pane(size:'80%')                  #グラフサイズの比
        f.title(text: 'Aさんの好み')         #タイトル
        f.xAxis(categories: genre,tickmarkPlacement:'on') #categories:各項目の名前,tickmarkPlacement:'on'だとメモリ表示がカテゴリーの表示に沿う
        f.yAxis(gridLineInterpolation: 'polygon',lineWidth:0,min:0,max:10) #各項目の最大値やら
        f.series(name:'Aさん',data: aData,pointPlacement:'on')
                                                     #各データ
        f.series(name:'sake_review',data: bData,pointPlacement:'on') #二件目のグラフ表示
        f.legend(align: 'right',
  	        verticalAlign: 'top',
  	        y: 70,
  	        layout: 'vertical')
      end
  end
end
