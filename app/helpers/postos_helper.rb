module PostosHelper
  def render_with_hashtags(content)
    content.gsub(/[#＃][\w\p{Han}ぁ-ヶｦ-ﾟー]+/){|word| link_to word, "/posto/hashtag/#{word.delete("#")}"}.html_safe
  end 
end
