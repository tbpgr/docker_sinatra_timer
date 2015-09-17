require 'sinatra'

module Template
  HTML =<<-EOS
<!DOCTYPE html>
<html lang="ja">
<head>
  <meta charset="UTF-8">
  <title>Timer</title>
  <link href='https://fonts.googleapis.com/css?family=$font-family$' rel='stylesheet' type='text/css'>
</head>
<body>
  <div style="font-size:64px;font-family: '$font-family$', sans-serif;">$font-family$</div>
  <div style="font-size:64px;font-family: '$font-family$', sans-serif;">$time$</div>
</body>
</html>
  EOS

  WEB_FONTS = %w(Roboto Lato Oswald Slabo Lora Montserrat Raleway Merriweather Arimo Bitter)
end

get '/' do
  html = Template::HTML.gsub('$time$', Time.now.strftime("%Y/%m/%d %H:%M:%S"))
  html.gsub('$font-family$', Template::WEB_FONTS.sample)
end
