module ApplicationHelper

  def avatar_url
    current_user.photo || "http://placehold.it/30x30"
  end

  def avatar_img(myclass)
    if current_user.cphoto
        cl_image_tag current_user.cphoto.path, width: 150, height: 150, crop: :fill, class: "avatarimg #{myclass}"
    elsif current_user.photo != "" && current_user.photo != nil
       image_tag(current_user.photo, class: "avatarimg #{myclass}")
    else
       image_tag("avatar.png", class: "avatarimg #{myclass}")
    end
  end
end
