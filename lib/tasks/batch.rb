class Tasks::Batch
  def self.execute
    # 実行したいコードを書く
    f = File.open('public/sake_data/junshu.tsv', 'r')
     f.each_line do |line|
        column = line.split("\t")
        name = column[1]
        alcohol = column[10]
        nihonsyudo = column[11]
        koujimai = column[6]
        kakemai = column[7]
        acid = column[12]
        amino = column[13]
        Sake.create(name: name, alcohol: alcohol, nihonsyudo: nihonsyudo, koujimai: koujimai, kakemai: kakemai, acid: acid, amino: amino)
        p name
        p column[2] #
        p column[3] #容量
        p column[4] #値段
        p column[5] #使用米
        p column[6] #麹米
        p column[7] #掛け米
        p column[8] #使用酵母
        p column[9] #酒母（酛）
        p column[10] #アルコール度数
        p column[11] #日本酒度
        p column[12] #酸度
        p column[13] #アミノ酸度
        p column[14] #
        p column[15] #香味の特徴
        p column[16] #適した飲用ｼｰﾝとﾀﾞｰｹﾞｯﾄ例
        p column[17] #適した飲用温度例
        p column[18] #適した酒器例
        p column[19] #相性の良い料理例

        
     end
  end
end
