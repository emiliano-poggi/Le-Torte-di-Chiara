module Nanoc3::Helpers::Gallery

	def count_imgs(gal)
		count = Dir[@config[:output_dir] + "/creazioni/#{gal}/*.jpg"].length / 2
		count
	end

end

include Nanoc3::Helpers::Rendering
include Nanoc3::Helpers::Gallery
