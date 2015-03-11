Then(/^Validate each section area has (\d+) inline stories on the Home Front$/) do |expected_story_count|

  all('.padded-container.inline-stories').each { |stories|
    # DEBUG show the users section title
    puts stories.find('h1').text

    headline_count = stories.all('.home-headline-item.nothumb-hlist-title-skin').each { |headline_story|
      expect(headline_story.text).to match(/\w/)

      # DEBUG show the user section headline title
      puts headline_story.text }

    inline_count = stories.all('.hlist-content.hlist-title-skin').each { |inline_story|
      expect(inline_story.text).to match(/\w/)

      # DEBUG show the user section inline story title
      puts inline_story.text }

    total_count = headline_count.count + inline_count.count

    # DEBUG show the user total count of inline stories per section
    puts total_count

    expect(total_count).to equal(expected_story_count.to_i)

    puts "---"
  }

end
