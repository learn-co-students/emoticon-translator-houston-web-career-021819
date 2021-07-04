# require modules here

=begin
  emoticons = {"get_meaning" =>{j_emoji => word, 
                                j_emoji => word,
                                ...},
               "get_emoticon" => {e_emoji => j_emoji,
                                  e_emoji => j_emoji,
                                  ...
               } }
=end
require 'yaml'
def load_library (file)
  file = YAML.load_file('lib/emoticons.yml')
  emoticons = {}
  emoticons["get_meaning"] = {}
  emoticons["get_emoticon"] = {}
  file.collect do |word, emojis|
    emoticons["get_meaning"][emojis[1]] = word
    emoticons["get_emoticon"][emojis[0]] = emojis[1]
  end
  emoticons
end


def get_japanese_emoticon(file, english_emoticon)
  emoticons = load_library (file)
  if emoticons["get_emoticon"].keys.include?(english_emoticon)
    return emoticons["get_emoticon"][english_emoticon]
  else
    return "Sorry, that emoticon was not found"
  end
end

def get_english_meaning(file, japanese_emoticon)
   emoticons = load_library (file)
   if emoticons["get_meaning"].keys.include?(japanese_emoticon)
     return emoticons["get_meaning"][japanese_emoticon]
   else
     return "Sorry, that emoticon was not found"
   end
end