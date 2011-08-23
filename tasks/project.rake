namespace :project do

	def config root, output='output'
		conf = YAML.load_file('config.yaml')
		conf["site_root"]=root
		conf["output_dir"]=output
		File.open( 'config.yaml','w' ) {|f| f.write( conf.to_yaml )}
	end

	desc "Update project by committing changes to master and ghpages branch, and generating output for domain and gh-pages site"
	task :update => [:domain,:ghpages]
	
	#desc "Update master repo and domain"
	task :domain => [:compile_domain, :ftptest] do
		# import images
		puts "\n#### UPDATE MASTER ####"
		sh 'bin/git-domain.sh'
		# ftp output copy
	end

	task :ftptest do
		sh('lftp -f bin/ftp-synch')
	end

	#desc "Update gh-pages repo"
	task :ghpages => [:compile_ghpages] do
		puts "\n#### UPDATE GH-PAGES ####"
		puts "\n-->> Synch config.yaml on master..."
		sh 'bin/git-domain.sh'
		puts "\n-->> Update ghpages..."
		sh 'bin/git-ghpages.sh'
	end
	
	#desc "Generate letortedichiara.com output"
	task :compile_domain do
		config '/', '../Le-Torte-di-Chiara-output'
		puts "\n-->> Compiling domain site..."
		sh 'nanoc3 compile'
	end

	#desc "Generate empo.github.com/Le-Torte-di-Chiara output"
	task :compile_ghpages do
		config '/Le-Torte-di-Chiara/', '../Le-Torte-di-Chiara-output-ghpages'
		puts "\n-->> Compiling ghpages site..."
		sh 'nanoc3 compile'
	end

end
