require 'yaml'
require 'pry'

def load_library(file_path)
  library = YAML.load_file(file_path)
  hash = {"get_meaning" => {}, "get_emoticon" => {}}
  library.each do |mean, emote|
    hash["get_meaning"][emote[1]] = mean
    hash["get_emoticon"][emote[0]] = emote.last
  end
  hash
end

def get_japanese_emoticon(file_path, emote)
  hash = load_library(file_path)
  out = hash["get_emoticon"][emote]
  if out.nil?
    out = "Sorry, that emoticon was not found"
  end
  out
end

def get_english_meaning(file_path, emote)
  hash = load_library(file_path)
  out = hash["get_meaning"][emote]
  if out.nil?
    out = "Sorry, that emoticon was not found"
  end
  out
end
