Jekyll::Hooks.register :site, :post_read do |site|
  site.tags.each do |tag, posts|
    FileUtils.mkdir_p("tag/#{tag}")
    File.write("tag/#{tag}/index.html", <<-HTML
      ---
      layout: tag
      tag: #{tag}
      permalink: /tag/#{tag}/
      ---
    HTML
    )
  end
end
