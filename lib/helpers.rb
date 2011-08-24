module Nanoc3::Helpers::Gallery

	def count_imgs(gal)
		count = Dir[@config[:output_dir] + "/creazioni/#{gal}/*.jpg"].length / 2
		count
	end

end

module Nanoc3::Helpers::Config
	def config root, output='output'
		conf = YAML.load_file('config.yaml')
		conf["site_root"]=root
		conf["output_dir"]=output
		File.open( 'config.yaml','w' ) {|f| f.write( conf.to_yaml )}
	end
end


include Nanoc3::Helpers::Rendering
include Nanoc3::Helpers::Gallery
include Nanoc3::Helpers::Config
