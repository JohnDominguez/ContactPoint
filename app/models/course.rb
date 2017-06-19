class Course < ApplicationRecord
	mount_uploader :video_intro, VideoIntroUploader
end
