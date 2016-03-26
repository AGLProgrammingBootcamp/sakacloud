class Tasks::Batch
  begin
    def self.execute
      File.open('sake_data/jukushu.tsv') do |file|
        file.each_line do |labmen|
          puts labmen
        end
      end
    end
  end
end