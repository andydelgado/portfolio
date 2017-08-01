module ProjectsHelper
  def image_generator(height:, width:)
    "http://placehold.it/#{height}x#{width}"
  end

  def project_img img, type
    if img.model.main_image? || img.model.thumb_image?
      img
    elsif type == 'thumb'
      image_generator(height: '350', width: '200')
    else
      image_generator(height: '600', width: '350')
    end
  end
end