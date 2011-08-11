module Nanoc3::Helpers::Gallery

	def count_imgs(gal)
		Dir["./content/creazioni/#{gal}/*.jpg"].length / 2
	end

end

include Nanoc3::Helpers::Rendering
include Nanoc3::Helpers::Gallery
