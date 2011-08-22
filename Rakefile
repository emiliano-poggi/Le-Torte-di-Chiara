require 'rubygems'
require 'nanoc3/tasks'

namespace :site do

	def config root, output='output'
		conf = YAML.load_file('config.yaml')
		conf["site_root"]=root
		conf["output_dir"]=output
		File.open( 'config.yaml','w' ) {|f| f.write( conf.to_yaml )}
	end

	# images, com, copy
	task :compile => [:com,:git]
	
	desc "Generate letortedichiara.com output"
	task :com do
		config '/'
		sh 'nanoc3 compile'
	end

	desc "Generate empo.github.com/Le-Torte-di-Chiara output"
	task :git do
		config '/Le-Torte-di-Chiara/', "output-ghpages"
		sh 'nanoc3 compile'
	end

end
