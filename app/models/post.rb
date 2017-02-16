class Post < ApplicationRecord
	extend FriendlyId
	  friendly_id :title, use: :slugged

	  def should_generate_new_friedly_id?
	    slug.blank? || title_changed?
		end﻿
	end
end