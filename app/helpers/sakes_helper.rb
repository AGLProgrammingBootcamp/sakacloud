module SakesHelper
  def image_for(user)
    if user.image
      image_tag "/sake_images/#{user.image}", class: "profile_img"
    else
      image_tag "/sake_images/sake_def.jpg", class: "profile_img"
    end
  end
end
