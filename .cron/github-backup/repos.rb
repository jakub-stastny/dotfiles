#!/usr/bin/env ruby

require 'yaml'
require 'open-uri'

REPO_LIST_URL = 'http://github.com/api/v2/yaml/repos/show/botanicus'
BACKUP_DIR = '/backups/github/repos'

unless Dir.exist?(BACKUP_DIR)
  puts "~ Creating #{BACKUP_DIR}"
  system "mkdir -p #{BACKUP_DIR}"
end

YAML.load(open(REPO_LIST_URL))['repositories'].each do |repository|
  puts "~ #{repository[:name]}"
  system 'git clone git@github.com:botanicus/#{repository[:name]}.git #{backupDirectory}/#{repository[:name]}'
end
