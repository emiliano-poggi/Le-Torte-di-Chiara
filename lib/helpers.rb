module Nanoc3::Helpers::Gallery

	def count_imgs(gal)
		count = Dir["content/creazioni/#{gal}/*.jpg"].length / 2
		puts "Gal #{gal} counts #{count}"
		count
	end

end

include Nanoc3::Helpers::Rendering
include Nanoc3::Helpers::Gallery
