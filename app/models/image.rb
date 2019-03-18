class Image < ApplicationRecord
  belongs_to :property, inverse_of: :images
  has_attached_file :image, styles: { thumb: ['32x32#', 'jpg'] },
                            convert_options: {
                              all: '-interlace Plane'
                            },
                            default_url: '/images/default_:style_photo.png'
  
  validates_attachment_presence :image
  validates_attachment_file_name :image, matches: [ /png\z/, /jpe?g\z/, /gif\z/ ]
end
