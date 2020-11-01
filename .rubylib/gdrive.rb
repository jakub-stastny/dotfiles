require 'google_drive'

class CLI
  # This has to be a file, so it can be updated with scope and refresh token (automatically).
  def self.ensure_credentials_file(credentials_file_path)
    unless File.file?(credentials_file_path)
      File.open(credentials_file_path, 'w') do |file|
        file.puts({
      client_id: ENV.fetch('GDRIVE_CLIENT_ID'),
      client_secret: ENV.fetch('GDRIVE_CLIENT_SECRET')
    }.to_json)
      end
    end
  end

  # Creates a session. This will prompt the credential via command line for the
  # first time and save it to config.json file for later usages.
  # See this document to learn how to create config.json:
  # https://github.com/gimite/google-drive-ruby/blob/master/doc/authorization.md
  def self.build(credentials_file_path)
    self.new(GoogleDrive::Session.from_config(credentials_file_path))
  end

  def initialize(session)
    @session = session
  end

  def download(session, remote_path, local_path)
    file = find_file(session, remote_path)
    file || abort("File #{remote_path} not found")
    if file.is_a?(GoogleDrive::Collection)
      Dir.mkdir(local_path)
      Dir.chdir(local_path) do
        file.files.each do |file|
          download(session, file)
        end
      end
    else
      file.download_to_file(local_path)
    end
  rescue NotImplementedError
    # This will want the format to be specified most likely.
    #
    # file.export_as_file(local_path)
    binding.pry
  end

  def find_file(session, full_path)
    full_path.split('/').reduce(session.root_collection) do |parent, file_name|
      parent.file_by_title(file_name)
    end
  end

  # TODO: Make it show the whole path (and don't list folders).
  def find(session, collection, indent = 0)
    collection.files.uniq(&:title).sort_by(&:title).each do |file|
      if file.is_a?(GoogleDrive::Collection)
        puts "#{'  ' * indent}#{`tput setaf 4`}#{file.title}#{`tput sgr0`}"
        find(session, file, indent + 1)
      else
        puts "#{'  ' * indent}#{file.title}"
      end
    end
  end

  def command_list(destination)
    collection = destination.nil? || destination == '/' ? session.root_collection : find_file(session, destination)
    collection.files.uniq(&:title).sort_by(&:title).each do |file|
      puts file.is_a?(GoogleDrive::Collection) ? "#{`tput setaf 4`}#{file.title}#{`tput sgr0`}" : file.title
    end
  end

  def command_find(destination)
    collection = ARGV.first.nil? || ARGV.first == '/' ? session.root_collection : find_file(session, ARGV.first)
    find(session, collection)
  end

  def command_search(title)
#   drive_service = session.instance_variable_get(:@fetcher).drive
#   query = "title contains '#{ARGV.first}'"
#   puts "Query: #{query}"
#   files = drive_service.list_files(q: query)
#   files.items.each do |file|
#     puts file.title
#   end
  end

  def command_cat(remote_path)
    remote_path, local_path = ARGV
    local_path ||= File.basename(remote_path)
    file = find_file(session, remote_path)
    file || abort("File #{remote_path} not found")
    if file.is_a?(GoogleDrive::Collection)
      abort "File #{remote_path} is a directory"
    else
      puts file.download_to_string
    end
  end

  def command_download(remote_path, local_path)
    local_path ||= File.basename(remote_path)
    puts "~ Downloading '#{remote_path}' to #{local_path}"
    download(session, remote_path, local_path)
  end

  def command_upload(local_path, remote_path)
    remote_path ||= "/#{File.basename(local_path)}"
    puts "~ Uploading '#{local_path}' to #{remote_path}"
    session.upload_from_file(local_path, remote_path, convert: false)
    # File is always uploaded to the root_collection by default.
    # Do:
    # file = @session.upload_from_file(ruta, file, convert: false)
    # folder.add(file)
    # @session.root_collection.remove(file)
    # https://github.com/gimite/google-drive-ruby/issues/260
  end

  def command_mkdir(remote_path)
    *dirnames, basename = ARGV.first.split('/')
    collection = dirnames.empty? ? session.root_collection : find_file(dirnames.join('/'))
    collection.create_subcollection(ARGV.first.split('/').last)
  end

  def command_remove(remote_path)
    puts "~ Deleting '#{ARGV.first}'"
    file = find_file(session, ARGV.first)
    file.delete(true)
  end
end
