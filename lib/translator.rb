require "yaml"

def load_library (file_path)
  emoticons = YAML.load_file(file_path)
  new_emoticon_hash = {"get_meaning" => {}, "get_emoticon" => {}}
  emoticons.each do |description_string, emoticons_array|
    new_emoticon_hash["get_meaning"][emoticons_array[1]] = description_string
    new_emoticon_hash["get_emoticon"][emoticons_array[0]] = emoticons_array [1]
  end
  new_emoticon_hash
end

def get_japanese_emoticon (file_path, emoticon)
  emoticon_dictionary = load_library(file_path)
  if emoticon_dictionary["get_emoticon"][emoticon]
    return emoticon_dictionary["get_emoticon"][emoticon]
  else
    return "Sorry, that emoticon was not found"
  end
end

def get_english_meaning (file_path, emoticon)
  emoticon_dictionary = load_library(file_path)
  if emoticon_dictionary["get_meaning"][emoticon]
    return emoticon_dictionary["get_meaning"][emoticon]
  else
    return "Sorry, that emoticon was not found"
  end
end
