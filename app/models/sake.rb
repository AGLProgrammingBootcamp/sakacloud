class Sake < ActiveRecord::Base
  has_many :reviews
  def set_image(file)
    if !file.nil?
      file_name = file.original_filename
      File.open("public/sake_images/#{file_name}", 'wb'){|f| f.write(file.read)}
      self.image = file_name
    end
  end
end
