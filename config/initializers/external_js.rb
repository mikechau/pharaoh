EXTERNAL_JS = ''

if Rails.env.development?
  EXTERNAL_JS << '<script data-turbolinks-track="true" src="http://localhost:4000/webpack-bundle.js"></script>'.html_safe
end