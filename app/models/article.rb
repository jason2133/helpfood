class Article < ApplicationRecord
    belongs_to :user
    mount_uploader :articleimage, S3Uploader
    acts_as_followable
end
