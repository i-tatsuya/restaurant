class CourseImg < ActiveRecord::Base
  belongs_to :course
  attr_reader :uploaded_image
  attr_accessible :uploaded_image, :data, :content_type
  attr_accessible :uploaded_image, as: :admin
  attr_accessor :updated_image

  IMAGE_TYPES = {"image/jpeg" => "jpg", "image/gif" => "gif", "image/png" => "png" }

  def uploaded_image=(image)
    @uploaded_image = image
    self.content_type = convert_content_type(image.content_type)
    self.data = image.read
  end

  def extenstion(mime_type)
    IMAGE_TYPES[mime_type]
  end

  private
  def convert_content_type(ctype)
    ctype = ctype.rstrip.downcase
    case ctype
    when "image/pjpeg" then return "image/jpeg"
    when "image/jpg"   then return "image/jpeg"
    when "image/x-png" then return "image/png"
    end
    return ctype
  end
end
